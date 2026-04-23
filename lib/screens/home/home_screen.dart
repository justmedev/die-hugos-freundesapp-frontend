import 'package:diehugosapp/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    spacing: 20,
    children: [
      Text(
        "Willkommen, Mona!",
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      Spacer(),
      FButton(onPress: () {
        context.push('/cashpools');
      }, child: Text("Zur Gruppenkassa")),
    ],
  );
}
