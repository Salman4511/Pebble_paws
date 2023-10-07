import 'package:flutter/material.dart';
import 'package:flutter_my_dog/db/user/user_db.dart';
import 'package:flutter_my_dog/screens/newevent.dart';
import 'package:flutter_my_dog/screens/saaved_events.dart';


class eventScreen extends StatefulWidget {
  const eventScreen({super.key});

  @override
  State<eventScreen> createState() => _eventScreenState();
}

class _eventScreenState extends State<eventScreen> {
 
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEventFromDB();
  }

  @override
  Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;

    return Scaffold(
           backgroundColor: Color.fromARGB(255, 236, 231, 231) ,

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              // SizedBox(height: 30,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Hero(
                    tag: kBackBtn,
                    child: Card(
                      color: Colors.blue,
                      elevation: 10,
                      shape: kBackButtonShape,
                      child: MaterialButton(
                        height: 50,
                        minWidth: 50,
                        elevation: 10,
                        shape: kBackButtonShape,
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: kBackBtn,
                      
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 50,
                  // ),
                 Hero(
                    tag: 'title',
                    transitionOnUserGestures: true,
                    child: Card(
                      color: Colors.blue,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child: InkWell(
                        
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 50,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                'Events',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white ,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
        
         Padding(
  padding:  EdgeInsets.only(top: size.height*0.15  ),
  child: InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => savedEvents()),
      );
    },
    child: Container(
      height: size.height*0.25 ,
      width: size.width*0.7 ,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 217, 103) ,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20),
        child: Column(
          children: [
            Row(
              children: [
               Image.network('https://cdn-icons-png.flaticon.com/128/3269/3269019.png',scale:1.1,),
                SizedBox(width: 30,),
                Column(
                  children: [
                    Text(
                      'Saved',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold 
                      ),
                    ),
                    Text(
                      'Events',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold 
                      ),
                    ),
                  
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ),
  ),
),
       Padding(
  padding: EdgeInsets.only(top: size.height*0.27),
  child:   ElevatedButton.icon(onPressed: (){Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => addEvent()),
      );}, icon: Icon(Icons.add,color: Colors.black ,),
   label: Text('Add Event',
  style:TextStyle(
    color: Colors.black 
  ) ,),
  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue))  ,),
)

            ]
          )
          ,)
          ,)
    );
  }
}

ShapeBorder kBackButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
  ),
);

Widget kBackBtn = Icon(
  Icons.arrow_back_ios,
  color: Colors.white,
);