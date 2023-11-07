import 'package:flutter/material.dart';
import 'package:flutter_my_dog/screens/landing/landingscreen2.dart';

class Landing1 extends StatelessWidget {
  const Landing1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromARGB(255, 223, 223, 223),
     body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage('https://cdn.wallpapersafari.com/49/36/PbrGgl.jpg'))
      ),
       child: SafeArea(child: 
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 100,top: 90),
              child: Text('Maintain Proper',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  Text('Health',style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),
              Text(' of your Dog',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))
            
                ],
              ),
            ),
           Padding(
             padding: const EdgeInsets.only(top: 470,left: 18),
             child: Row(
               children: [
                 TextButton(onPressed: (){}, child: Text('Skip'),),
                 SizedBox(width: 180,),
                 ElevatedButton(onPressed: (){Navigator.push(context,
                      MaterialPageRoute(builder:(context)=>Landing2()));}, child: Text('Next'))
               ],
             ),
           ),
          ],
        ),
        
        ),
     ),
    );
  }
}