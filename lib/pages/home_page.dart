import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //la variable que usaremos para mostrar en pantalla
  String nombre = "";

  //me creo una función/metodo save para guardar datos con sharedPrefeces
  // save() async {//*hasta aqui es paso 3 **

  //Agregamos nuestro Future, void por que no retorna nada
  Future<void> save() async {
    //*paso 4 reemplazamos, paso 3 al paso 4 **

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

  //con esto recuperamos/obtenemos nuestro valor que viene de nuestro save(){}
  // getData() async { //*hasta aqui es paso 3 **

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
    debugPrint(mandarin.getString("name"));

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
    return mandarinas.getString("name") ?? "_";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //!PASO 1: creación de botones "guardar" y "obtener"
            //!PASO 2: nos creamos nuestros funciones save(){} y getData(){}
            //!PASO 3: mostramos el valor en la pantalla usando una variable
            //!PASO 4: mostrmos el valor usando FutureBuilder
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
