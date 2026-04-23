import 'dart:convert';
import 'dart:io';

import 'package:diehugosapp/models/cashpool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CashpoolDetailScreen extends StatefulWidget {
  const CashpoolDetailScreen({super.key});

  @override
  State<CashpoolDetailScreen> createState() => _CashpoolDetailScreenState();
}

class _CashpoolDetailScreenState extends State<CashpoolDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final typography = context.theme.typography;
    final itemStyle = context.theme.itemStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // FTile(
        //   prefix: Icon(FIcons.banknote),
        //   title: const Text('23€ bezahlt'),
        // ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "23€",
                  style: TextStyle(
                    height: 1.1,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(width: 6),
                const Text(
                  " für die Gruppe bezahlt!",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),

        Text(
          style: typography.xl2.copyWith(fontWeight: FontWeight.bold),
          "Aktivität",
        ),
      ],
    );
  }
}
