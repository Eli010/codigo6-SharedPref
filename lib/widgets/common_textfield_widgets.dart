import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final IconData icon;
  final String text;
  final TextEditingController? controller;

  const CommonTextField(
      {super.key, required this.icon, required this.text, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextField(
        controller: controller,
        //cambiamos el puntero;
        cursorColor: Colors.black,
        //cambiamos el style del texto que escriba el usuario;
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
          //cambiamos el color de relleno;
          fillColor: Colors.blue,
          //aceptamos el cambio del color de relleno;
          filled: true,
          //manejamos el paddion de nuestro texfield;
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          //el mensaje post llenado;
          hintText: text,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
          //icono dentro del texfield;
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
