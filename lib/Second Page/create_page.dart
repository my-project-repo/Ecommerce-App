import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/Service/service.dart';
import 'package:login_page/success_page/success_page.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passController = TextEditingController();
  Service serve = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body:Stack(
          children: [
            Container(
             height: MediaQuery.of(context).size.height-250,
             width: double.infinity,
             margin: const EdgeInsets.symmetric(vertical: 0),
             decoration: const BoxDecoration(
               color:Colors.white,
               image: DecorationImage(image: AssetImage("assets/bg/pic asset_2_00000.png"),opacity: 0.75,),
             ),
                            ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
            IconButton(onPressed: (){
              Navigator.pop(context);
            },
                icon: const Icon(Icons.arrow_back)),
            loginText(context),
            textFormFields(context),
          ],
        ) ,
      );

  }

  Animate loginText(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
            child: Text('Create Your Account',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 29,
                  color: Colors.black87.withOpacity(.68),
                  letterSpacing: 1.7
              ),),
          ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn();
  }

  Padding textFormFields(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(vertical: 70),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(width: 10,),
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width-220,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(208, 209, 254, 85),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        // First Name
                        child: TextFormField(
                          controller:_firstNameController ,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                            hintText: 'First Name',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                            border: UnderlineInputBorder(borderSide: BorderSide.none),
                            prefixIcon: Icon(Icons.supervised_user_circle)
                          ),
                        ),
                      ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width-220,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(208, 209, 254, 85),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          //Last Name
                          child: TextFormField(
                            controller:_lastNameController ,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                                hintText: 'Last Name',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                                border: UnderlineInputBorder(borderSide: BorderSide.none),
                                prefixIcon: Icon(Icons.supervised_user_circle)
                            ),
                          ),
                        ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
                      ),
                      const SizedBox(width: 10,),
                    ],
                  ),
                  const SizedBox(height: 18,),
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width-20,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(208, 209, 254, 85),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child:TextFormField(
                      controller: _passController,
                  decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                hintText: 'Password',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                border: UnderlineInputBorder(borderSide: BorderSide.none),
                    prefixIcon: Icon(Icons.key)
            ),
          ),
                  ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
                  const SizedBox(height: 35,),
                  Padding(
                    padding: const EdgeInsets.only(right: 180),
                    child: Text('Sign up',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 1.3,
                        color: Colors.black87.withOpacity(.7)
                    ),),
                  ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
                  Container(
                    padding: const EdgeInsets.only(left: 150),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(25),
                          shadowColor: Colors.transparent,
                          backgroundColor: const Color.fromRGBO(208, 209, 254, 95),// Adjust padding as needed
                        ),

                        onPressed: () {
                          int generateRandom ()
                          {
                            Random rand = Random();
                            return rand.nextInt(900)+100;
                          }
                          final String emailText = "${_firstNameController.text.trim()}${_lastNameController.text.trim()}${generateRandom()}@dev";
                          final String password = _passController.text.trim();
                          print(emailText);
                          serve.saveUser(emailText, password);
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => successPage(email: emailText,password: password,)
                          ));
                        },child: const Icon(Icons.arrow_forward,color: Colors.black54,),
                    ),
                  ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
                ],
              ),
            ),
          );
  }
}
