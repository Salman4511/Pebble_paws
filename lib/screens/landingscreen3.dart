import 'package:flutter/material.dart';
import 'package:flutter_my_dog/screens/navbar.dart';

class Landing3 extends StatelessWidget {
  const Landing3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromARGB(255, 222, 218, 217),
     body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage('https://e1.pxfuel.com/desktop-wallpaper/779/723/desktop-wallpaper-10-best-mongrel-%C2%B7-mongrel-dog-thumbnail.jpg'))
      ),
       child: SafeArea(child: 
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 250,top: 100),
              child: Text('ADD',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60),
              child: Text('Reminders,Events',style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(' and more..',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            ),
           Padding(
             padding: const EdgeInsets.only(top: 420,left: 18),
             child: Row(
               children: [
                 TextButton(onPressed: (){}, child: Text('Skip'),),
                 SizedBox(width: 180,),
                 ElevatedButton(onPressed: (){Navigator.push(context,
                      MaterialPageRoute(builder:(context)=>navPage()));}, child: Text('Next'))
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