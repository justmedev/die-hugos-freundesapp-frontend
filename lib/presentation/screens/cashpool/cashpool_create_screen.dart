import "dart:async";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:go_router/go_router.dart";
import "package:shared_preferences/shared_preferences.dart";

class CashpoolCreateScreen extends StatefulWidget {
  const CashpoolCreateScreen({super.key});

  @override
  State<CashpoolCreateScreen> createState() => _CashpoolCreateScreenState();
}

class _CashpoolCreateScreenState extends State<CashpoolCreateScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Form(
    key: _formKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FTextFormField(
          label: const Text("Titel"),
          control: .managed(controller: _titleController),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => ((value?.length ?? 0) >= 1)
              ? null
              : "Der eingegebene Titel ist zu kurz.",
        ),
        const SizedBox(height: 10),
        FTextFormField.multiline(
          label: const Text("Beschreibung"),
          control: .managed(controller: _descriptionController),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => ((value?.length ?? 0) >= 1)
              ? null
              : "Die eingegebene Beschreibung ist zu kurz.",
        ),
        const SizedBox(height: 20),
        FButton(
          child: const Text("Erstellen"),
          onPress: () {
            if (!_formKey.currentState!.validate()) {
              return; // Form is invalid.
            }

            createCashpool();
            context.pop();
            // Form is valid, do something.
          },
        ),
      ],
    ),
  );

  Future<void> createCashpool() async {
    final prefs = await SharedPreferences.getInstance();

    // final response = await http.post(
    //   Uri.http("10.0.2.2:8000", "/cashpools"),
    //   body: jsonEncode({
    //     "title": _titleController.text.trim(),
    //     "description": _descriptionController.text.trim(),
    //   }),
    //   headers: {
    //     HttpHeaders.contentTypeHeader: "application/json",
    //     HttpHeaders.authorizationHeader: 'Bearer ${prefs.getString("jwt")}',
    //   },
    // );
    //
    // if (response.statusCode != 200) {
    //   throw Exception("Unable to create cashpool!");
    // }
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }
}
