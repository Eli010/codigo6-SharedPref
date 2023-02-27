import 'package:codigo6_shared/utils/sp_global.dart';
import 'package:codigo6_shared/widgets/common_textfield_widgets.dart';
import 'package:codigo6_shared/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //nos cremos nuestros controladores para los textfield
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _addressCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();

  //la variable que usaremos para mostrar en pantalla
  String nombre = "";

  save() {
    //realizamos la llamada desde nuestro sp_global = singleton
    SPGlobal().name = "Lee Pacombia";
    SPGlobal().address = "Jr. Mariano Melgar 645";
    SPGlobal().email = "Lee@gmail.com";
  }
/*
  //me creo una función/metodo save para guardar datos con sharedPrefeces
  // save() async {//hasta aqui es paso 3 **
  
  //Agregamos nuestro Future, void por que no retorna nada
  Future<void> save() async {
    //paso 4 reemplazamos, paso 3 al paso 4 **

    //me creo una instacia de sharedPreferences
    //el getInstance() es un Future por ello lleva await
    SharedPreferences mandarina = await SharedPreferences.getInstance();

    //con la intancia creado, seleccionamos el tipo de dato que queremos
    // guardar con nuestro metodo setString
    //Key=es el nombre de la llave de nuestro valor "name"
    mandarina.setString("name", "Elí Pacombia");

    //con esto verificamos que la función ejecute
    debugPrint("guardar.."); // es igual a --> print("guardar ...");
  }
*/
  //con esto recuperamos/obtenemos nuestro valor que viene de nuestro save(){}
  // getData() async { //hasta aqui es paso 3 **

  //Agregamos nuestro Future, void por que no retorna nada
  Future<void> getData() async {
    //*paso 4 reemplazamos, paso 3 al paso 4 **
    //volvemos a crear una nueva instancia,
    //el nombre de la instancia puede ser igual o diferente, no altera
    SharedPreferences mandarin = await SharedPreferences.getInstance();

    //mostraremos en nuestra consola el dato recuperado
    //madarin= el nombre de nuestra instancia
    //getString = el metodo para obtener nuestro valor del meotod save(){}
    //key= colocamos la llave de nuestro valor a obtener "name"
    debugPrint(mandarin.getString("names")); // es igual a --> print();

    //asignamos el valor a nuestra variable externa
    //OJO:realizamos una condición para que no te mande un valor nullo-> ?? "-";
    nombre = mandarin.getString("name") ?? "-"; //-> usamos la variables

    //? cambiamos nuestro widget de StatelessWidget a StateFullWidget para usar setState
    //con esto actulizamos nuestro Widget buil
    setState(() {});
  }

  //creamos una nueva función con un retorno de valor,
  //String = es el tipo de valor que retornará
  Future<String> getName() async {
    //volvemos a crear una nueva instancia,
    //el nombre de la instancia puede ser igual o diferente, no altera
    SharedPreferences mandarinas = await SharedPreferences.getInstance();

    //aqui retornamos nuestro valor
    return mandarinas.getString("names") ?? "_";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //nos creamos nuestra appBar que se muestra en la parte superior
      appBar: AppBar(
        //es el titulo que se muestra en nuestra cabecera
        title: const Text("SharedPreferences"),
        //centramos nuestro titulo
        centerTitle: true,
      ),
      //creamos una menu desplegable
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //!PASO 1: creación de botones "guardar" y "obtener"
            //!PASO 2: nos creamos nuestros funciones save(){} y getData(){}
            //!PASO 3: mostramos el valor en la pantalla usando una variable
            //!PASO 4: mostrmos el valor usando FutureBuilder
            //!PASO 5: nos cremos tres textFields con sus controladores

            //NOS CREAMOS TRES TEXTFIELD
            CommonTextField(
              //puede ser un ejemplo o una petición
              text: "Ingrese su nombre completo",
              //el icono se saldra antes de escribir
              icon: Icons.person,
              //manemos de datos ingresados a nuestro textfield
              controller: _nameCtrl,
            ),
            CommonTextField(
              text: "Ingrese su dirección",
              icon: Icons.location_on,
              controller: _addressCtrl,
            ),
            CommonTextField(
              text: "Correo eléctronico",
              icon: Icons.email,
              controller: _emailCtrl,
            ),
            //nos creamos un boton llamado "guardar" para nuestra funciòn Save(){}
            ElevatedButton(
              onPressed: () {
                //llamamos la funcion save() con el cual guardamos nuestro valor
                save();
              },
              child: const Text(
                "Guardar",
              ),
            ),

            //creamos un boton llamado "obtener" para nuestra funciòn getData(){}
            ElevatedButton(
              onPressed: () {
                //llamamos nuestra funcion getData() con el obtenemos nuestro valor
                getData();
              },
              child: const Text(
                "obtener",
              ),
            ),

            //en vez de Text(""), cambiamos por Text(nombre)
            //nombre = viene de nuestro getData
            Text(nombre),

            //trazamos una linea con este widget
            const Divider(),

            //Usamos FutureBuilder para mostrar el valor en la pantalla
            FutureBuilder(
              //mencionamos de que función llamaremos el valor
              future: getName(),
              //snap= el valor que retorna nuestra función getName()
              builder: (context, AsyncSnapshot snap) {
                //realizaremos una verificación
                //snap.hasData = ¿el snap tiene un valor?
                if (snap.hasData) {
                  //si tiene, mostramos el valor en un widget Text("")
                  return Text(snap.data);
                }
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
