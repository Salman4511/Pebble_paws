import 'package:flutter/material.dart';
import 'package:flutter_my_dog/db/user/user_db.dart';
import 'package:flutter_my_dog/models/dog_model.dart';
import 'package:flutter_my_dog/screens/adddogscreen.dart';
import 'package:flutter_my_dog/screens/dog_profile.dart';

class kennelPage extends StatefulWidget {
  const kennelPage({super.key});

  @override
  State<kennelPage> createState() => _kennelPageState();
}

class _kennelPageState extends State<kennelPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDogFromDB();
  }
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
                              'Kennel',
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

       Expanded(
flex: 2,
        child:ListView.builder(
      scrollDirection: Axis.vertical,
        itemCount: thisUserDogsList.length,
        itemBuilder: (context, index) {
          DogModel dog=thisUserDogsList[index];
         return  Padding(
  padding:  EdgeInsets.only(top: size.height*0.04),
  child: InkWell(
    onTap: () {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DogProfile(dog: dog)),
      );
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 25,right: 25 ),
      child: Container(
        height: size.height*0.16, 
        width: size.width*0.78  ,
        decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 210, 163) ,
        borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(dog.profile??"https://cdn.pixabay.com/photo/2012/04/26/19/43/profile-42914_1280.png"),
                  backgroundColor: Colors.black ,
                ),
                SizedBox(width: 20,),
                Column(
                  children: [
                    Text(
                      dog.name??"name",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold 
                      ),
                    ),
                    Text(
                      dog.breed??"breed",
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
       Padding(
  padding: const EdgeInsets.only(top: 50),
  child:   ElevatedButton.icon(onPressed: (){Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => addDog()),
      );}, icon: Icon(Icons.add,color: Colors.black ,),
   label: Text('Add Dog',
  style:TextStyle(
    color: Colors.black 
  ) ,),
  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue))  ,),
)
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