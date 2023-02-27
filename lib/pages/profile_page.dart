import 'package:codigo6_shared/utils/sp_global.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //creamos nuestras variables
  String name = "";
  String address = "";
  String correo = "";

  //invocamos nuestro initState para que sea el primero en
  //activarse antes de entrar a nuestro widget
  @override
  void initState() {
    super.initState();
    //llamamos nuestro metodo getData()
    getData();
  }

  getData() {
    //nos creamos una instancia para sharedPrefences
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    //asignamos el valor de pref a nuestra variable "name";
    name = SPGlobal().name;
    address = SPGlobal().address;
    correo = SPGlobal().email;
    // print(address);
    setState(() {});
    // name = prefs.getString("name") ?? "-";
    // address = prefs.getString("address") ?? "-";
    // email = prefs.getString("email") ?? "-";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Mi Perfil ${SPGlobal().name}",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  "nombre completo",
                  style: TextStyle(
                    color: Colors.grey,
                    // fontSize: 16,
                    // fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  address,
                  style: const TextStyle(
                    // color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  "dirección",
                  style: TextStyle(
                    color: Colors.grey,
                    // fontSize: 16,
                    // fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  correo,
                  style: const TextStyle(
                    // color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "correo electrónico",
                  style: TextStyle(
                    color: Colors.grey,
                    // fontSize: 16,
                    // fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
