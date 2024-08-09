import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/Second%20Page/create_page.dart';
import 'package:login_page/Service/service.dart';
import 'package:login_page/success_page/success_page.dart';
class signInPage extends StatefulWidget {
  const signInPage({super.key});

  @override
  State<signInPage> createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  Service serve = Service();


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
              image: DecorationImage(image: AssetImage("assets/bg/asset12.png"),opacity: 0.75,),
            ),
          ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
          IconButton(onPressed: ()
          {
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back)).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
          loginText(context),
          textFormFields(context),
            redirectImp(context)
        ],
      ) ,
    );

  }

  Column redirectImp(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 26,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account ?" ,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  ),).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder:
                      (context) => const CreatePage(),
                      )
                      );
                    },
                      child: const Text('Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),)).animate().move(delay: 400.ms, duration: 500.ms).fadeIn()
                ],
              ),
            ),
          ],
        );
  }

  Animate loginText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30 ,horizontal: 30),
      child: Text('Welcome Back',
        style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 34,
            color: Colors.black87.withOpacity(.68),
            letterSpacing: 1.9,

        ),),
    ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn();
  }

   textFormFields(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 55,
            width: MediaQuery.of(context).size.width-20,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(244, 158, 89, 180),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: TextFormField(
              controller:_emailController ,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                  prefixIcon: Icon(Icons.mail)
              ),
            ),
          ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
          const SizedBox(height: 18,),
          Container(
            height: 55,
            width: MediaQuery.of(context).size.width-20,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(244, 158, 89, 180),
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
          const SizedBox(height: 18,),
          Container(
            padding: const EdgeInsets.only(left: 100,bottom: 100),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(25),
                shadowColor: Colors.transparent,
                backgroundColor: const Color.fromRGBO(244, 158, 89, 180),// Adjust padding as needed
              ),

              onPressed: () {
                Future<void> verify () async
                {
                  final bool value = await serve.verifyData(_emailController.text.trim(), _passController.text.trim());
                  if (value)
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:
                            (context)=>  successPage(email:_emailController.text.trim(),password: _passController.text.trim()),
                        )
                    );
                  }

                }
                // serve.saveUser(_emailController.text.trim(), _passController.text.trim());
                verify();
              }, child: const Icon(Icons.arrow_forward,color: Colors.black54,),
            ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
          ),
        ],
      ),
    );
  }
}
