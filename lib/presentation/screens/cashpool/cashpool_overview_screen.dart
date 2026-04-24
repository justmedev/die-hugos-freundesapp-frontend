import "package:diehugosapp/data/models/cashpool.dart";
import "package:diehugosapp/presentation/screens/cashpool/cashpool_create_screen.dart";
import "package:diehugosapp/presentation/screens/cashpool/cashpool_detail_screen.dart";
import "package:diehugosapp/presentation/widgets/scaffold_with_navbar.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_navigation/src/extension_navigation.dart";
import "package:shared_preferences/shared_preferences.dart";

class CashpoolOverviewScreen extends StatefulWidget {
  const CashpoolOverviewScreen({super.key});

  @override
  State<CashpoolOverviewScreen> createState() => _CashpoolOverviewScreenState();
}

class _CashpoolOverviewScreenState extends State<CashpoolOverviewScreen> {
  late Future<List<Cashpool>> futureCashpools;

  @override
  void initState() {
    super.initState();
    futureCashpools = fetchCashpools();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavbar(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FutureBuilder(
            future: futureCashpools,
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: asyncSnapshot.data?.length,

                  itemBuilder: (ctx, i) {
                    final data = asyncSnapshot.data![i];
                    return FItem(
                      title: Text(data.title),
                      subtitle: Text(data.description),
                      details: Text(
                        "von ${data.ownerId} am ${formatDate(data.createdAt)}",
                      ),
                      suffix: const Icon(FIcons.chevronRight),
                      onPress: () async {
                        await Get.to(const CashpoolDetailScreen());
                      },
                    );
                  },
                );
              } else if (asyncSnapshot.hasError) {
                return Text("${asyncSnapshot.error}");
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
          const Spacer(),
          FButton(
            onPress: () async {
              await Get.to(const CashpoolCreateScreen());
            },
            child: const Text("Gruppenkassa erstellen"),
          ),
        ],
      ),
    );
  }

  Future<List<Cashpool>> fetchCashpools() async {
    final prefs = await SharedPreferences.getInstance();

    // final response = await http.get(
    //   Uri.http("localhost:8000", "/cashpools"),
    //   // Send authorization headers to the backend.
    //   headers: {
    //     HttpHeaders.acceptHeader: "application/json",
    //     HttpHeaders.authorizationHeader: 'Bearer ${prefs.getString("jwt")}',
    //   },
    // );
    //
    // if (response.statusCode != 200) {
    //   throw Exception("Unable to fetch cashpools!");
    // }
    //
    // final Iterable decoded = jsonDecode(response.body);
    //
    // return List<Cashpool>.from(
    //   decoded.map((model) => Cashpool.fromJson(model)),
    // );

    return List<Cashpool>.empty();
  }

  String formatDate(DateTime dt) {
    // DD.MM.YY
    return "${dt.day.toString().padLeft(2, "0")}.${dt.month.toString().padLeft(2, "0")}.${dt.year.toString().replaceRange(0, 2, "")}";
  }
}
