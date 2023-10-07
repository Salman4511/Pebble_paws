import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_dog/db/user/user_db.dart';
import 'package:flutter_my_dog/screens/editprofile.dart';
import 'package:flutter_my_dog/screens/userprofile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _addReminderState();
}

class _addReminderState extends State<MenuScreen> {
 String selectedIcon = 'Option 1';
 final user = FirebaseAuth.instance.currentUser;
   @override
  Widget build(BuildContext context) {
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
                                'Menu',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white,
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
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(right: 180),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(40),bottomRight: Radius.circular(40))
                  ),
                  child: Column(
                    children:[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(thisUser?.profile??"https://cdn.pixabay.com/photo/2012/04/26/19/43/profile-42914_1280.png"),
                      radius: 25,
                    ), // Icon for the first tile
                    title: Text(thisUser?.fullname??"name",style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(user!.email.toString()),
                    onTap: () {
                      // setState(() {
                      //   selectedIcon = 'Option 1';
                      // });
                      // Handle the click event here
                    },
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.edit), 
                    title: Text('Edit Profile'),
                    onTap: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => editProfile(user: thisUser!,)),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.user), 
                    title: Text('My Profile'),
                    onTap: () {
                      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => userProfile()),
                );
                    },
                  ),
                  SizedBox(height: 220,),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.signOut), 
                    title: Text('Log Out'),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text('About Us'),
                    onTap: () {
                      
                    },
                  ),
                            ]),
                ),
              )
            ],
          ),
        ),
      ),
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