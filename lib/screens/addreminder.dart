import 'package:flutter/material.dart';
import 'package:flutter_my_dog/db/user/user_db.dart';
import 'package:flutter_my_dog/screens/editprofile.dart';

class addReminder extends StatefulWidget {
  const addReminder({super.key});

  @override
  State<addReminder> createState() => _addReminderState();
}

class _addReminderState extends State<addReminder> {
 String selectedIcon = 'Option 1';
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      color:Colors.blue,
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
                                'Add Reminder',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  // color: Colors.black54,
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
        padding: const EdgeInsets.only(top: 20 ,right: 140,left: 20),
        child: Column(
         children:[ Text('Set New Reminders',style: TextStyle(
        color: Colors.black ,
        fontSize: 30,
        fontWeight: FontWeight.bold 
      ),),
      Text('Here...',style: TextStyle(
        color: Colors.black ,
        fontSize: 28,
        fontWeight: FontWeight.bold 
      ),),
    ] )
      ),
              Padding(
  padding: EdgeInsets.only(top: 90,right: 40,left: 40),
  child:   Column(
  
    children: [
    //   Padding(
    //     padding: const EdgeInsets.only(),
    //     child: Column(
    //      children:[ Text('Set New Reminders',style: TextStyle(
    //     color: Colors.white 
    //   ),),
    //   Text('Here...',style: TextStyle(
    //     color: Colors.white 
    //   ),),
    // ] )
    //   ),
      // Text('Set New Reminders',style: TextStyle(
      //   color: Colors.white 
      // ),),
      // Text('Here...',style: TextStyle(
      //   color: Colors.white 
      // ),),
  
          TextField(
  
      
  
          decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(topRight:Radius.circular(50),bottomRight: Radius.circular(50),bottomLeft: Radius.circular(40))
          ),
      
           hintStyle :TextStyle (color: Color.fromARGB(255, 255, 255, 255),
           fontWeight: FontWeight.bold ) ,
          fillColor: const Color.fromARGB(255, 146, 145, 145),
          filled: true,
         hintText: '    Reminder'
         ,
  
      
  
          ),
  
      ),
      SizedBox(height: 10,),
       TextField(
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(topRight:Radius.circular(50),bottomRight: Radius.circular(50),bottomLeft: Radius.circular(40))
          ),
          hintStyle :TextStyle (color: Colors.white ,
           fontWeight: FontWeight.bold ) ,
          fillColor: const Color.fromARGB(255, 146, 145, 145),
          filled: true,
         hintText: '    Reminder Type'
          
  
        )
  
      ),
  SizedBox(height: 10,),
      TextField(
  
        decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(topRight:Radius.circular(50),bottomRight: Radius.circular(50),bottomLeft: Radius.circular(40))
          ),
          hintStyle :TextStyle (color: Colors.white ,
           fontWeight: FontWeight.bold ) ,
          fillColor: const Color.fromARGB(255, 146, 145, 145),
          filled: true,
         hintText: '    Date'
          
  
        )
  
      ),
  SizedBox(height: 10,),
       TextField(
  
        decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(topRight:Radius.circular(50),bottomRight: Radius.circular(50),bottomLeft: Radius.circular(40))
          ),
          hintStyle :TextStyle (color: Colors.white ,
           fontWeight: FontWeight.bold ) ,
          fillColor: const Color.fromARGB(255, 146, 145, 145),
          filled: true,
         hintText: '    Time'
  
        )
  
      ),
      SizedBox(height:20,),
   Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select shape',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black 
              ),
            ),
            DropdownButton(
              
              iconDisabledColor: const Color.fromARGB(255, 0, 0, 0) ,
              iconEnabledColor: const Color.fromARGB(255, 0, 0, 0) ,
              dropdownColor: Color.fromARGB(255, 255, 255, 255) ,
              value: selectedIcon,
              onChanged: (newValue) {
                setState(() {
                  selectedIcon = 's';
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'Option 1',
                  child: Icon(Icons.favorite,color: const Color.fromARGB(255, 255, 80, 80) ,),
                ),
                DropdownMenuItem(
                  value: 'Option 2',
                  child: Icon(Icons.star,color: Colors.blue ,),
                ),
              ],
            ),
          ],
        ),
        SizedBox(width:120,),
    Padding(
      padding: const EdgeInsets.only(top: 40),
      child: ElevatedButton(
        onPressed: () {

          Navigator.push(context, MaterialPageRoute(builder:(context)=>editProfile(user: thisUser!,)));
        },
        child: Text(
          'Add',
          style: TextStyle(color: const Color.fromARGB(255, 11, 11, 11),fontWeight: FontWeight.bold ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue ),
        ),
      ),
    ),
  ],
)

    ],
  
  ),
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
  color: Colors.black54,
);