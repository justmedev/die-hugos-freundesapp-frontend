import 'package:flutter/cupertino.dart';
import 'package:forui/forui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => FScaffold(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 20,
      children: [
        Text(
          "Willkommen, Mona!",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        FButton(onPress: () {}, child: Text("Zur Gruppenkassa")),
      ],
    ),
  );
}
