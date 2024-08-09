import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/Sign In/sign_in_home.dart';
import 'package:login_page/Main Page/product_page.dart';
class EcommercePage extends StatefulWidget {
  const EcommercePage({super.key});

  @override
  State<EcommercePage> createState() => _EcommercePageState();
}

class _EcommercePageState extends State<EcommercePage> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/bg/ecomm01.jpg"),fit: BoxFit.cover),

        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
                colors: [
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.25)
            ])
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Shop smarter,\nsmile wider',style:
                GoogleFonts.roboto(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
              const SizedBox(height: 5,),
              Text('Find everything you need, delivered fast',style:
              GoogleFonts.roboto(
                  color: Colors.white,
              ),).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
              const SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  Future.delayed(const Duration(milliseconds: 100),(){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> const productPage()
                        )
                    );
                  });
                  setState(() {
                    _isSelected = !_isSelected; });
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width-50,
                  decoration: BoxDecoration(
                    color: _isSelected? Colors.transparent:Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(child: Text('Get started',style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 15,color: _isSelected?Colors.white:Colors.black),)),
                ),
              ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
              const SizedBox(height: 30,),
              GestureDetector(
                onTap:(){
                  Future.delayed(const Duration(milliseconds: 100),(){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> const signInPage()
                        )
                    );
                  });

                  setState( () {
                  _isSelected = !_isSelected; } );
                  },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width-50,
                  decoration: BoxDecoration(
                    color: _isSelected?Colors.white:Colors.transparent,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(child: Text('Sign in',style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 15,color: _isSelected? Colors.black : Colors.white,letterSpacing: 1),)),
                ),
              ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
    );
  }
}
