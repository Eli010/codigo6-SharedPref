//aqui realizaremos nuestro singleton
//no creamos nuestra clase con el nombre SPGlobal
import 'package:shared_preferences/shared_preferences.dart';

class SPGlobal {
  //me creo una instance llamado instance
  static final SPGlobal _instance = SPGlobal.mandarina();

  //me creo un contructor con nombre
  SPGlobal.mandarina();

  //me creo un constructor tipo factory
  factory SPGlobal() {
    // return _instance;
    return SPGlobal._instance;
  }
  //una forma de probar que funciona
  List<String> products = [];

  //nos creamos una variable de tipo SharedPreferences con asignación posterior late
  late SharedPreferences prefs;

  //nos creamos una metodo de iniciación para nuestro shared
  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  /*CON ESTAS FUNCIONES USAREMOS NUESTRO SHAREDPREFENCES*/
  //con este metodo guardamos nuestros datos
  set name(String value) {
    prefs.setString("name", value);
  }

  //con este metodo recuperamos nuestros valores
  String get name {
    return prefs.getString("name") ?? "-";
  }

  set address(String value) {
    prefs.setString("address", value);
  }

  String get address {
    return prefs.getString("address") ?? "-";
  }

  set email(String value) {
    prefs.setString("correo", value);
  }

  String get email {
    return prefs.getString("correo") ?? "";
  }
}
