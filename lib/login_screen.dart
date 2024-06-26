import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/compCollections.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Container(
                height: 350,
                width: double.infinity,
                color:Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0,top: 80),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Login",style: GoogleFonts.lilitaOne(
                        textStyle:const TextStyle(
                          fontSize: 70,
                          color: Colors.black,
                        ),
                      )),
                      Text("Enter your Information",style: GoogleFonts.aBeeZee(
                        textStyle:const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),),
                    ],
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(top: 250.0),
                child: Container(

                    decoration:const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                      ),

                    ),
                    child:Column(

                      children: [
                        const SizedBox(height: 30,),
                        Container(
                          height: 200,
                          width: 200,
                          child: const Image(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/images/login.png"
                            ),

                          ),
                        ),
                        const   SizedBox(height: 10,),
                        UseAbleComp.customTextFormField(
                            controller: emailController,
                            text: "Email",
                            iconData: Icons.email,
                            toHide: false),
                        UseAbleComp.customTextFormField(
                            controller: passwordController,
                            text: "Password",
                            iconData: Icons.lock,
                            toHide: true),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Forgot Password?", style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),)
                            ],
                          ),
                        ),


                        const  SizedBox(height: 30,),

                        UseAbleComp.customButton("Login", () {



                        }),
                        const  SizedBox(height: 10,),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account? "),
                              Text("Sign up",style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold


                              ),),
                            ],
                          ),
                        ),

                      ],


                    )

                ),
              )
            ],
          ),
        )
    );
  }
}
