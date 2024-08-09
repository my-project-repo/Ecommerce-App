import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
class productPage extends StatelessWidget {
  const productPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height-280,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/bg/bg1.jpg"),fit: BoxFit.cover)
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(.75),
                                Colors.black.withOpacity(.2),
                              ])
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.favorite,color: Colors.white,),
                                SizedBox(width: 15,),
                                Icon(Icons.shopping_cart,color: Colors.white,)
                              ],
                            ),
                          ),
                           const SizedBox(height: 300,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Our New Products',style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 75),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('VIEW MORE',style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Colors.white),),
                                    const SizedBox(width: 8,),
                                    const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 17,)
                                  ],
                                ),
                              ),
                            ],
                          ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
                        ],
                      ),
                    ),
                  ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.arrow_back)).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 90,horizontal: 40),
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:  const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,size: 25,),
                        hintText: 'Search products',
                        hintStyle: TextStyle(fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
              ]),

              const SizedBox(height: 15,),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Categories',style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black87.withOpacity(.7)),),
                        Text('All',style: GoogleFonts.roboto(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black87.withOpacity(.7)),),
                      ],
                    ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
                    const SizedBox(height: 18,),
                    SizedBox(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          makeWidget(image: "assets/bg/home and furniture.jpg",data: "Furniture",aspectRatio: 2/2.5).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
                          const SizedBox(width: 20,),
                          makeWidget(image: "assets/bg/electronics.jpg",data: "Electronic",aspectRatio: 2/2.5).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
                          const SizedBox(width: 20,),
                          makeWidget(image: "assets/bg/skincare.jpg",data: "Skincare",aspectRatio: 2/2.5).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
                          const SizedBox(width: 20,),
                          makeWidget(image: "assets/bg/fasion2.jpg",data: "Fashion",aspectRatio: 2/2.5).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
              
              
                        ],
                      ),
                    ),
                    const SizedBox(height: 18,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Best selling',style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black87.withOpacity(.7)),),
                        Text('All',style: GoogleFonts.roboto(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black87.withOpacity(.7)),),
                      ],
                    ).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
                    const SizedBox(height: 18,),
                    SizedBox(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          makeWidget(image: "assets/bg/electronics.jpg",data: "Electronic",aspectRatio: 3/2.5).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
                          const SizedBox(width: 20,),
                          makeWidget(image: "assets/bg/skincare.jpg",data: "Skincare",aspectRatio: 3/2.5).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
                          const SizedBox(width: 20,),
                          makeWidget(image: "assets/bg/home and furniture.jpg",data: "Furniture",aspectRatio: 3/2.5).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
                          const SizedBox(width: 20,),
                          makeWidget(image: "assets/bg/fasion2.jpg",data: "Fashion",aspectRatio: 3/2.5).animate().move(delay: 400.ms, duration: 500.ms).fadeIn(),
              
              
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }

  AspectRatio makeWidget({image,data,aspectRatio}) {
    return AspectRatio(aspectRatio: aspectRatio,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover,),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                colors: [
                                  Colors.black.withOpacity(.75),
                                  Colors.black.withOpacity(.0),
                                ])
                          ),
                          child: Align(alignment: Alignment.bottomLeft,
                              child: Text(data,style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),)),
                        ),
                      ),);
  }
}
