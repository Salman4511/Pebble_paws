import 'package:flutter/material.dart';
import 'package:flutter_my_dog/db/user/user_db.dart';

class userProfile extends StatelessWidget {
  const userProfile({super.key});

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
                                'UserProfie',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white
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
             SizedBox(height: 80), // Add some space between the Row and the Card
    Container(
       width: 300,
       height: 500,
      margin: EdgeInsets.symmetric(horizontal: 10), // Add margin for spacing
      child: Card(
        color: Colors.grey,
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(thisUser?.profile??"https://cdn.pixabay.com/photo/2012/04/26/19/43/profile-42914_1280.png"),
                radius: 80,
              ),
              SizedBox(height: 50,)
              ,Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Name:   ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          thisUser?.fullname??"name",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  
                
                SizedBox(height: 20),
                           Row(
                  children: [
                    Text(
                      'Adress: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      thisUser?.address??"adress",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text(
                      'Phone:  ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      thisUser?.phone??'phone',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:140,top: 60),
                child: IconButton(onPressed: (){}, icon: Icon(Icons.edit_document)),
              )
            ],
          ),
          
        ),
        
      ),
      
    ),
    ElevatedButton(onPressed: (){
      Navigator.pop(context);
    }, child: Text('OK',style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue)),)

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
  color: Colors.black54,
);