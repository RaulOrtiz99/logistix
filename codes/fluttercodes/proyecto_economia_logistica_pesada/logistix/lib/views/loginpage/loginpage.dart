import 'package:flutter/material.dart';
import 'package:logistix/screens/map_screen.dart';
import 'package:logistix/views/homepage/homepage.dart';
import 'package:show_up_animation/show_up_animation.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List images = [
    "loginborroso.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/${images[index]}"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   width: 100,
                  //   height: 200,
                  //   decoration: BoxDecoration(
                  //
                  //     color: Colors.white70
                  //   ),
                  // ),
                 ShowUpAnimation(
                        child: Center(child: Image.asset('assets/images/logologistix.png',height: 80,)),
                        // child: const AppText(text: "Tarabuco", size: 35.0),
                      ),
                  Text(
                    "Inicio de sesion",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 300,
                    child: ShowUpAnimation(
                      child: TextField(
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          hintText: 'Correo',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          filled: true,
                          fillColor: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    child: ShowUpAnimation(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: Colors.black,
                            size: 30,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          filled: true,
                          fillColor: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: ShowUpAnimation(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PageInicio()));
                        },
                        child: Text(
                          "Iniciar sesion",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomePage {
}