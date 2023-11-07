import 'package:flutter/material.dart';
import 'package:flutter_my_dog/db/user/user_db.dart';
import 'package:flutter_my_dog/models/event_model.dart';
import 'package:flutter_my_dog/screens/Events/event_profile.dart';

class savedEvents extends StatefulWidget {
  const savedEvents({super.key});

  @override
  State<savedEvents> createState() => _savedEventsState();
}

class _savedEventsState extends State<savedEvents> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
           backgroundColor: Color.fromARGB(255, 236, 231, 231) ,

      body: SafeArea(
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
                              'Saved Events',
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
      thisUserEventsList.isEmpty?
      Center(
        heightFactor: 20,
        child: Column(
        children: [
      
          Text('No Events',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
        ],
      )):
       Expanded(
flex: 2,
        child:ListView.builder(
      scrollDirection: Axis.vertical,
        itemCount: thisUserEventsList.length,
        itemBuilder: (context, index) {
          EventModel event=thisUserEventsList[index];
         return  Padding(
  padding:  EdgeInsets.only(top: size.height*0.04),
  child: InkWell(
    onTap: () {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EventProfie(event: event)),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0 ),
      child: Container(
        height: size.height*0.16, 
        width: size.width*0.78  ,
        decoration: BoxDecoration(
        color: Colors.white ,
        borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
        padding:EdgeInsets.only(top:size.height*0.008 , left: 20),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(event.profile??"https://cdn.pixabay.com/photo/2012/04/26/19/43/profile-42914_1280.png"),
                  backgroundColor: Colors.black ,
                ),
                SizedBox(width: 20,),
                Column(
                  children: [
                    Text(
                      event.eventName??"name",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold 
                      ),
                    ),
                    Text(
                      event.venue??"venue",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                      ),
                    )
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
);
       })),
  
          ]
        )
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