import 'package:flutter/material.dart';
import 'package:flutter_my_dog/screens/landing/landingscreen3.dart';

class Landing2 extends StatelessWidget {
  const Landing2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromARGB(255, 152, 177, 218),
     body: Container(
  
       decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage('https://i.pinimg.com/736x/e1/d7/d9/e1d7d917c09716f4255c1e126adb406a.jpg'))
      ),
       child: SafeArea(child: 
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 70,top: 100),
              child: Text('Complete Lessons to',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 100),
              child: Row(
                children: [
                  Text('Train',style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),
              Text(' your Dog',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))
            
                ],
              ),
            ),
           Padding(
             padding: const EdgeInsets.only(top: 460,left: 18),
             child: Row(
               children: [
                 TextButton(onPressed: (){}, child: Text('Skip'),),
                 SizedBox(width: 180,),
                 ElevatedButton(onPressed: (){Navigator.push(context,
                      MaterialPageRoute(builder:(context)=>Landing3()));}, child: Text('Next'))
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