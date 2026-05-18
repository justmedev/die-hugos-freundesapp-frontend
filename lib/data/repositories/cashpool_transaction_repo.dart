import "dart:async";
import "dart:convert";

import "package:diehugosapp/data/managers/session_manager.dart";
import "package:diehugosapp/data/models/cashpool_transactions/cashpool_transaction.dart";
import "package:diehugosapp/data/models/cashpool_transactions/cashpool_transaction_event.dart";
import "package:diehugosapp/data/models/cashpool_transactions/cmds/cashpool_create_transaction_cmd.dart";
import "package:diehugosapp/data/models/cashpool_transactions/cmds/cashpool_update_transaction_cmd.dart";
import "package:dio/dio.dart";
import "package:eventflux/eventflux.dart";
import "package:flutter/cupertino.dart";

abstract class CashpoolTransactionRepo {
  Future<CashpoolTransaction> create(CashpoolTransactionCreateCmd cmd);

  Future<CashpoolTransaction> update(CashpoolTransactionUpdateCmd cmd);

  Future<Iterable<CashpoolTransaction>> getAllByCashpoolId(int cashpoolId);

  Future<Stream<CashpoolTransactionEvent>> listenToTransactionEvents(
    int cashpoolId,
  );
  // TODO: delete
}

class CashpoolTransactionRepoImpl implements CashpoolTransactionRepo {
  CashpoolTransactionRepoImpl(this.dio, this.sessionManager);

  final Dio dio;
  final SessionManager sessionManager;

  @override
  Future<CashpoolTransaction> create(CashpoolTransactionCreateCmd cmd) async {
    final res = await dio.post<Map<String, Object?>>(
      "/cashpools/${cmd.cashpoolId}/transactions",
      data: cmd.toRequest().toJson(),
    );
    if (res.data == null) throw Exception("res.data shall not be null!");
    return CashpoolTransaction.fromJson(res.data!);
  }

  @override
  Future<CashpoolTransaction> update(CashpoolTransactionUpdateCmd cmd) async {
    final res = await dio.put<Map<String, Object?>>(
      "/cashpools/${cmd.cashpoolId}/transactions/${cmd.transactionId}",
      data: cmd.toRequest().toJson(),
    );
    if (res.data == null) throw Exception("res.data shall not be null!");
    return CashpoolTransaction.fromJson(res.data!);
  }

  @override
  Future<Iterable<CashpoolTransaction>> getAllByCashpoolId(
    int cashpoolId,
  ) async {
    final res = await dio.get<List<dynamic>>(
      "/cashpools/$cashpoolId/transactions",
    );
    if (res.data == null) throw Exception("res.data shall not be null!");
    return res.data!.map(
      (item) => CashpoolTransaction.fromJson(item as Map<String, Object?>),
    );
  }

  @override
  Future<Stream<CashpoolTransactionEvent>> listenToTransactionEvents(
    int cashpoolId,
  ) async {
    final completer = Completer<Stream<CashpoolTransactionEvent>>();

    EventFlux.instance.connect(
      EventFluxConnectionType.get,
      "${dio.options.baseUrl}/cashpools/$cashpoolId/transactions/listen",
      header: {
        "Authorization": "Bearer ${sessionManager.currentSession?.accessToken}",
      },
      onSuccessCallback: (res) {
        final mappedStream = res!.stream!.expand<CashpoolTransactionEvent>((e) {
          try {
            final decoded = jsonDecode(e.data) as Map<String, dynamic>;
            switch (e.event) {
              case "created":
                return [
                  CashpoolTransactionEvent.created(
                    CashpoolTransaction.fromJson(decoded),
                  ),
                ];
              case "updated":
                return [
                  CashpoolTransactionEvent.updated(
                    CashpoolTransaction.fromJson(decoded),
                  ),
                ];
              case "deleted":
                return [
                  CashpoolTransactionEvent.deleted(
                    decoded["transactionId"] as int,
                    decoded["emittingUserId"] as int,
                  ),
                ];
              case "hello":
                debugPrint("Received hello");
                return [];
              case "error":
                debugPrint("Received an error from SSE: ${e.data}");
                return [];
              case String():
                debugPrint("Unknown event ${e.event} with data ${e.data}");
                return [];
            }
          } on FormatException {
            return [];
          }
        });

        completer.complete(mappedStream);
      },
      onError: (err) {
        debugPrint(
          "SSE error: ${err.message} (${err.statusCode}) ${err.reasonPhrase}",
        );
      },
    );

    return completer.future;
  }
}
