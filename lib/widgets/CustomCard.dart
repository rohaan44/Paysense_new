import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysense/widgets/file.dart';

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [Container(
          height: 400,
          color: Colors.black,
              child: Container(
                height: double.infinity,
                child: Stack(
                  children:[
                  Positioned(
                  top:-6,
                  right: 10,
                  child:ElevatedButton(onPressed: (){}, child: Text("Rohaan")),) ,
                     ClipPath(
                    clipper: CustomShapeClipper(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xff55a3fe),
                              spreadRadius: 5,
                              blurRadius: 15,
                            ),
                          ],
                          color: const Color(0xff55a3fe),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: double.infinity,
                        height: 230,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
      ]),
      );
  }
}