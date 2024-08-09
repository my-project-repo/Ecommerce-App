import 'package:flutter/material.dart';
import 'package:login_page/Main%20Page/Ecommerce.dart';
// main function
void main()=>runApp(const Myapp());
// space
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EcommercePage(),
    );
  }
}