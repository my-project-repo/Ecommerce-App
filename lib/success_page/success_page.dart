import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/Second Page/create_page.dart';
class successPage extends StatelessWidget {
  String email;
  String password;
   successPage({super.key,required this.email,required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/bg/green tik_00000.png"),scale: 3),
        ),
      ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
           IconButton(onPressed: (){
             Navigator.pop(context,
             MaterialPageRoute(builder: (context) => const CreatePage(),
             ));
           },
               icon: const Icon(Icons.arrow_back)),
           Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Center(
                child: Text('Success',
                style: GoogleFonts.roboto(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 3.5,
                  color: Colors.black54
                ),).animate().move(delay: 300.ms, duration: 600.ms).fadeIn() // uses `Animate.defaultDuration`
                )),
    ]),
    );
  }
}
