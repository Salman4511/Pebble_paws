import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_dog/db/user/user_hive_db/user_hive_db.dart';
import 'package:flutter_my_dog/models/remainder_model.dart';
import 'package:flutter_my_dog/screens/Reminders/new.dart';
import 'package:flutter_my_dog/screens/Reminders/reminderpage.dart';
import 'package:intl/intl.dart';



class editReminder extends StatefulWidget {
   editReminder({super.key,required this.remainder});
  RemainderModel remainder;

  @override
  State<editReminder> createState() => _editReminderState();
}

class _editReminderState extends State<editReminder> {
  DateTime selectedDate = DateTime.now();
  DateTime fullDate = DateTime.now();
TextEditingController date=TextEditingController();
TextEditingController remindertype = TextEditingController();
TextEditingController reminder = TextEditingController();
  Future<DateTime> _selectDate(BuildContext context) async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        initialDate: selectedDate,
        lastDate: DateTime(2100));
    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDate),
      );
      if (time != null) {
        setState(() {
          fullDate = DateTimeField.combine(date, time);
        });
        //TODO
        //schedule a notification
      }
      return DateTimeField.combine(date, time);
    } else {
      return selectedDate;
    }
  }
   String dropdownValue = "Vaccine";

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    try {
      reminder.text=widget.remainder.reminder??"reminder";
     dropdownValue =widget.remainder.reminderType??"remindertype";
      date.text = widget.remainder.date ?? "date";

    } catch (e) {
      
    }
  }
   List<String> list = ["Vaccine","Medicine","Others"];
  
   
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
                                'Edit Reminder',
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
         children:[ Text('Edit your Reminder',style: TextStyle(
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
          controller: reminder,
          decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(topRight:Radius.circular(50),bottomRight: Radius.circular(50),bottomLeft: Radius.circular(40))
          ),
      
           hintStyle :TextStyle (color: Colors.black,
           fontWeight: FontWeight.bold ) ,
          fillColor: const Color.fromARGB(255, 146, 145, 145),
          filled: true,
         hintText: '    Reminder'
         ,
  
      
  
          ),
  
      ),
      SizedBox(height: 10,),
       Container(
        width:500 ,
        height: 65, 
        decoration: BoxDecoration(
          color:  const Color.fromARGB(255, 146, 145, 145),
           borderRadius: BorderRadius.only(topRight:Radius.circular(50),bottomRight: Radius.circular(50),bottomLeft: Radius.circular(40))
        ),
         child: Padding(
           padding: const EdgeInsets.only(right: 190,left: 25,top: 10), 
           child: DropdownButton<String>( 
               value: dropdownValue,
               icon: const Icon(Icons.arrow_downward,color: Colors.black  ,),
               elevation: 16,
               style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16  ),
            //    underline: Container(
            // height: 2,
            // color: Colors.deepPurpleAccent,
            //    ),
               onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;
            });
               },
               items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
               }).toList(),
             ),
         ),
       ),
      //  TextField(
      //   controller: remindertype,
        
      //   decoration: InputDecoration(
      //   border: OutlineInputBorder(
      //       borderRadius: BorderRadius.only(topRight:Radius.circular(50),bottomRight: Radius.circular(50),bottomLeft: Radius.circular(40))
      //     ),
      //     hintStyle :TextStyle (color: Colors.white ,
      //      fontWeight: FontWeight.bold ) ,
      //     fillColor: const Color.fromARGB(255, 146, 145, 145),
      //     filled: true,
      //    hintText: '    Reminder Type'
          
  
      //   )
  
      // ),
  SizedBox(height: 10,),
      TextField(
      onTap: ()async {
      setState(() async{
         DateTime selectDate =await _selectDate(context);
       String formattedDate =
       DateFormat('yyyy-MM-dd/hh:mm').format(selectDate);
       date.text=formattedDate;
      });
      },
      controller: date,
        decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(topRight:Radius.circular(50),bottomRight: Radius.circular(50),bottomLeft: Radius.circular(40))
          ),
          hintText: '    Date',
          hintStyle :TextStyle (color: Colors.black  ,
           fontWeight: FontWeight.bold ) ,
          fillColor: const Color.fromARGB(255, 146, 145, 145),
          filled: true,
        
          
      
        )
      
      ),
      SizedBox(height:20,),
   Row(
      children: [
       
        SizedBox(width:220,),
    Padding(
      padding: const EdgeInsets.only(top: 40),
      child: ElevatedButton(
        onPressed: ()async {
          RemainderModel remainder=RemainderModel(id: widget.remainder.id, reminder: reminder.text, reminderType: dropdownValue, date: date.text);
          remainderEdit(remainder);
          // remainderAddToDB(remainder);
          Navigator.pop(context);
        },
        child: Text(
          'Save',
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