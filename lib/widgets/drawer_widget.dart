import 'package:codigo6_shared/pages/profile_page.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        //para abarcar todo el espacio asignado
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //creamos nuestra cabecera de nuestro drawer
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://images.pexels.com/photos/3052361/pexels-photo-3052361.jpeg?auto=compress&cs=tinysrgb&w=600",
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //con el circleavatar redondeamos una imagen y ponemos borde
                const CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 35,
                    //realimos la llamda de una imagen desde la nube
                    backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/598917/pexels-photo-598917.jpeg?auto=compress&cs=tinysrgb&w=600",
                    ),
                  ),
                ),
                //realizar la separación de espacio
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Elí Pacombia Santander",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "eli.pacombia@gmail.com",
                  style: TextStyle(
                    color: Colors.grey[100],
                    fontSize: 16,
                    // fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          //creamos nuestro lista de opciones debajo de nuestra cabecera
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
            leading: const Icon(
              Icons.person,
            ),
            title: const Text("Mi perfil"),
          ),
          const ListTile(
            leading: Icon(
              Icons.settings,
            ),
            title: Text("Configuración"),
          ),
          const ListTile(
            leading: Icon(
              Icons.price_change,
            ),
            title: Text("Ventas"),
          ),
          const ListTile(
            leading: Icon(
              Icons.pie_chart,
            ),
            title: Text("Resumen"),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(
              Icons.exit_to_app,
            ),
            title: Text("Cerrar sesión"),
          )
        ],
      ),
    );
  }
}
