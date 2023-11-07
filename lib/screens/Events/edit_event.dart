import 'package:flutter/material.dart';
import 'package:flutter_my_dog/db/user/user_db.dart';
import 'package:flutter_my_dog/models/event_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditEvent extends StatefulWidget {
   EditEvent({super.key,required this.event});
   EventModel event;
  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
TextEditingController namecontroller=TextEditingController();

TextEditingController venuecontroller=TextEditingController();

TextEditingController datecontroller=TextEditingController();

void _clearTextFields() {
    setState(() {
      namecontroller.clear();
      venuecontroller.clear();
      datecontroller.clear();
     
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    try {
      namecontroller.text=widget.event.eventName??"eventname";
      venuecontroller.text=widget.event.venue??"venue";
      datecontroller.text = widget.event.date ?? "date";

    } catch (e) {
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white  ,
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
                                'Edit Event',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  // color: Colors.white,
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
        padding: const EdgeInsets.only(top: 20 ,right: 190,left: 20),
        child: Column(
         children:[ Text('Make Changes',style: TextStyle(
        color: const Color.fromARGB(255, 0, 0, 0) ,
        fontSize: 30,
        fontWeight: FontWeight.bold 
      ),),
       Text(' in Events...',style: TextStyle(
        color: const Color.fromARGB(255, 0, 0, 0) ,
        fontSize: 28,
        fontWeight: FontWeight.bold 
      ),),
     
    ] )
      ),
             Padding(
  padding: const EdgeInsets.only(top: 20),
  child: Container(
    width: 250,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network('https://thumb.ac-illust.com/cf/cf96c7be7f75b8546ba073915764b302_t.jpeg'),
        ),
        IconButton(onPressed:
          () {
                     showDialog(context: context, builder: (context) {
              return AlertDialog(
            title: Text("Pick image"),
              actions: [IconButton(onPressed: ()async{
             await eventimgPick(ImageSource.gallery);
                              
             }, icon: Icon(Icons.browse_gallery)),IconButton(onPressed: (){
                eventimgPick(ImageSource.camera);}, icon: Icon(Icons.camera))],);
           },);
                                        
        }, icon: Icon(Icons.add_a_photo_outlined,),style: ButtonStyle(
          iconSize: MaterialStatePropertyAll(45)
        ),)
      ],
    ),
  ),
),
 Padding(
  padding: EdgeInsets.only(top: 30,right: 40,left: 40),
  child:   Column(
  
    children: [
  
          TextField(
           controller: namecontroller,
      
  
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
          border: UnderlineInputBorder()
           ,
      
  
            labelText:'    Event Name' ,
            labelStyle: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0) ,
              
              
            )
  
      
  
          ),
     onEditingComplete: () {
                FocusScope.of(context).nextFocus();
                            }  
      ),
  
      TextField(
         controller: venuecontroller,
        decoration: InputDecoration(
           fillColor: Colors.white,
            filled: true,
          border: UnderlineInputBorder(), 
          labelText:'    Event Venue',
          labelStyle: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0) 
            )
        ),
        onEditingComplete: () {
                FocusScope.of(context).nextFocus();
                            }  
  
      ),
  
       TextField(
         keyboardType: TextInputType.none,
                            onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));
 
                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    datecontroller.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              },
          controller: datecontroller,
        decoration: InputDecoration(
           fillColor: Colors.white,
            filled: true,
          labelText:'    Event Date',
          labelStyle: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0) 
            ) 
        ),
        onEditingComplete: () {
                FocusScope.of(context).unfocus();
                            }  
       
      ),
      SizedBox(height:20,),
      ElevatedButton(onPressed: () {
       updateEvent(widget.event.id!,namecontroller.text , venuecontroller.text, datecontroller.text,widget.event.profile!);
        // Navigator.push(context,MaterialPageRoute(builder:(context)=>addReminder() ));
      }, child: Text('Save Changes',style: TextStyle(
        color: const Color.fromARGB(255, 0, 0, 0)
      ),),style: ButtonStyle(backgroundColor:
        MaterialStatePropertyAll(Color.fromARGB(255, 33, 170, 255))),)
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