import "package:flutter/material.dart";

String serializeDateOnly(DateTime dt) =>
    DateUtils.dateOnly(dt).toIso8601String().split("T")[0];
