import 'package:codigo6_shared/pages/home_page.dart';
import 'package:codigo6_shared/utils/sp_global.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //nos creamos nuestra variable de tipo SPGlobal
  SPGlobal spGlobal = SPGlobal();
  //con esto inicializamos nuestro sharedPrefences en todo nuestro project
  await spGlobal.initSharedPreferences();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
    );
  }
}
