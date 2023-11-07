
import 'package:flutter/material.dart';
import 'package:flutter_my_dog/db/user/user_db.dart';
import 'package:flutter_my_dog/models/dog_model.dart';
import 'package:flutter_my_dog/screens/Dogs/certificatepage.dart';
import 'package:flutter_my_dog/screens/Dogs/edit_dog.dart';
import 'package:flutter_my_dog/screens/Dogs/profilePicture.dart';

class DogProfile extends StatelessWidget {
   DogProfile({super.key,required this.dog});
final DogModel dog;
  @override
  Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;

    return  Scaffold(
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
                                'DogProfie',
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
             SizedBox(height: 50), // Add some space between the Row and the Card
    Container(
       width: 300,
       height: size.height*0.699,
      margin: EdgeInsets.symmetric(horizontal: 10), // Add margin for spacing
      child: Card(
        color: Colors.grey,
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              InkWell(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(dog.profile??"https://cdn.pixabay.com/photo/2012/04/26/19/43/profile-42914_1280.png"),
                  radius: 80,
                  
                ),
                onTap: () {
                    Navigator.push(
      context,
                 MaterialPageRoute(builder: (context) => profilePic(dog: dog)),
                    ); 
                },
              ),
              SizedBox(height: 50,)
              ,Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Pet Name:   ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          dog.name??"name",
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
                      'DOB: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      dog.dob??"DOB",
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
                      'Months:  ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      dog.month??'months',
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
                      'Breed:  ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      dog.breed??'breed',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                  ],
                ),
              ), Padding(
                padding: const EdgeInsets.only(right: 50),
                child: TextButton(onPressed: (){
                 Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Certificate(dog: dog)),
      );
                }, child: Text('Click to see certificate',style: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.bold 
                ),)),
              ), 
              Padding(
                padding: const EdgeInsets.only(left:140,top: 20),
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => editDog(dog: dog)),
      );
                    }, icon: Icon(Icons.edit_document)),
                    // IconButton(onPressed: (){
                    //   deleteDogFromDB(dog.id!);
                    // }, icon: Icon(Icons.delete )),
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text("Delete Dog"),
                              content: Text("Are you sure you want to delete?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx)
                                        .pop(); // Close the dialog
                                  },
                                  child: Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await deleteDogFromDB(dog.id!);
                                    Navigator.of(ctx)
                                        .pop(); // Close the dialog
                                   Navigator.pop(context);
                                   
                                    ScaffoldMessenger.of(ctx).showSnackBar(
                                        SnackBar(
                                            backgroundColor: Colors.red,
                                            content:
                                                Text("Deleted Successfully")));
                                  },
                                  child: Text("Ok"),
                                )
                              ],
                            ),
                          );
                        },
                        icon: Icon(Icons.delete),
                      ),

                  ],
                ),
              ),
             
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