import "dart:async";
import "dart:io";

import "package:diehugosapp/data/managers/session_manager.dart";
import "package:diehugosapp/data/models/auth/auth_response/auth_response.dart";
import "package:diehugosapp/data/models/auth/auth_state/auth_state.dart";
import "package:diehugosapp/data/models/user/user.dart";
import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:oauth2/oauth2.dart" as oauth2;
import "package:url_launcher/url_launcher.dart";

abstract class AuthRepo {
  Future<AuthResponse> login();

  Future<void> logout();

  Future<AuthSession?> authLocally();

  Future<AuthSession> tokenRefresh(String refreshToken);
}

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({
    required this.sessionManager,
    required this.dio,
  });

  final SessionManager sessionManager;
  final Dio dio;

  final String _clientId = dotenv.get("KC_CLIENTID");
  final String _authorizationEndpoint =
      "${dotenv.get("KC_REALM_URI")}/protocol/openid-connect/auth";
  final String _endSessionEndpoint =
      "${dotenv.get("KC_REALM_URI")}/protocol/openid-connect/logout";
  final String _tokenEndpoint =
      "${dotenv.get("KC_REALM_URI")}/protocol/openid-connect/token";
  final String _redirectUrl = "http://localhost:8888/callback";
  final List<String> _scopes = [
    "openid",
    "profile",
    "email",
    "offline_access",
  ];

  @override
  Future<AuthResponse> login() async {
    final grant = oauth2.AuthorizationCodeGrant(
      _clientId,
      Uri.parse(_authorizationEndpoint),
      Uri.parse(_tokenEndpoint),
    );

    final authorizationUrl = grant.getAuthorizationUrl(
      Uri.parse(_redirectUrl),
      scopes: _scopes,
    );

    final completer = Completer<Uri>();
    HttpServer? server;

    try {
      server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8888)
        ..listen((request) async {
          if (request.uri.path == "/callback") {
            request.response
              ..statusCode = HttpStatus.ok
              ..headers.contentType = ContentType.html
              ..write(
                "<h1>Anmeldung erfolgreich!</h1><p>Du kannst dieses Fenster nun schließen.</p>",
              );
            await request.response.close();
            completer.complete(request.uri);
          } else {
            request.response
              ..statusCode = HttpStatus.notFound
              ..write("Not Found");
            await request.response.close();
          }
        });

      if (await canLaunchUrl(authorizationUrl)) {
        await launchUrl(authorizationUrl, mode: LaunchMode.externalApplication);
      } else {
        throw Exception("Could not launch $authorizationUrl");
      }

      final responseUri = await completer.future;
      final client = await grant.handleAuthorizationResponse(
        responseUri.queryParameters,
      );

      // Fetch user profile from backend using the new access token
      final userRes = await dio.get<Map<String, Object?>>(
        "/users/me",
        options: Options(
          headers: {
            "Authorization": "Bearer ${client.credentials.accessToken}",
          },
        ),
      );

      if (userRes.data == null) {
        throw Exception("Failed to fetch user profile after OAuth2 login");
      }

      final user = User.fromJson(userRes.data!);
      final authResponse = AuthResponse(
        accessToken: client.credentials.accessToken,
        refreshToken: client.credentials.refreshToken ?? "",
        user: user,
      );

      await sessionManager.saveSession(
        AuthSession.fromAuthResponse(authResponse),
      );
      return authResponse;
    } finally {
      await server?.close(force: true);
    }
  }

  @override
  Future<void> logout() async {
    final uri = Uri.parse(_endSessionEndpoint);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw Exception("Could not launch $uri");
    }
  }

  @override
  Future<AuthSession?> authLocally() async {
    return sessionManager.currentSession;
  }

  @override
  Future<AuthSession> tokenRefresh(String refreshToken) async {
    final currentSession = sessionManager.currentSession;
    if (currentSession == null) {
      throw Exception("No current session found during token refresh");
    }

    final credentials = oauth2.Credentials(
      currentSession.accessToken,
      refreshToken: refreshToken,
      tokenEndpoint: Uri.parse(_tokenEndpoint),
      scopes: _scopes,
    );

    final client = oauth2.Client(
      credentials,
      identifier: _clientId,
    );

    try {
      final newClient = await client.refreshCredentials();
      final newSession = currentSession.copyWith(
        accessToken: newClient.credentials.accessToken,
        refreshToken: newClient.credentials.refreshToken ?? refreshToken,
      );

      await sessionManager.saveSession(newSession);
      return newSession;
    } on Exception catch (e) {
      debugPrint("Token refresh failed: $e");
      rethrow;
    } finally {
      client.close();
    }
  }
}
