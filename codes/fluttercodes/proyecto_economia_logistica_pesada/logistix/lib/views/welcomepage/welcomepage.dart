import '../loginpage/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "loginborroso.png",
    "borrosaimagen2.jpg",
    "borrosaimagen3.jpg",
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
            child: Container(
              margin: const EdgeInsets.only(
                top: 150.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShowUpAnimation(
                        child: Center(child: Image.asset('assets/images/logologistix.png',height: 80,)),
                        // child: const AppText(text: "Tarabuco", size: 35.0),
                      ),
                      SizedBox(height: 20,),
                      ShowUpAnimation(
                        child: Text('Bienvenido a LogistiX',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.red,),),
                      ),
                      // const AppTitleText(text: "Vive la experiencia")),
                      
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: 250.0,
                        child: ShowUpAnimation(
                          child: Text('proyecto#42',style: TextStyle(color: Colors.white,),),
                          // child: const AppSubtitleText(
                          //     text:
                          //         'Conoce paisajes increibles e inolvidables'),
                        ),
                      ),
                      const SizedBox(height: 50.0),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> HomePage()));
                      //     // BlocProvider.of<AppCubits>(context).getData();
                      //   },
                      //   child: SizedBox(
                      //     height: ,
                      //     width: 200,
                      //     child: ShowUpAnimation(
                      //       child: Row(
                      //         children: [
                      //           ElevatedButton(onPressed:(){}, child:Text("Iniciar experiencia"))
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: ElevatedButton(
                          
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text(
                            "Siguiente",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Aun no estas registrado?",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: Text(
                                "Registrarme",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                  ShowUpAnimation(
                    child: Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2.0),
                          width: 10.0,
                          height: index == indexDots ? 25.0 : 8.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: index == indexDots
                                ? Colors.white
                                : Colors.red,
                          ),
                        );
                      }),
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
