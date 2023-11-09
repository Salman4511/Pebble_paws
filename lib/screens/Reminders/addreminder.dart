import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_dog/db/user/user_hive_db/user_hive_db.dart';
import 'package:flutter_my_dog/models/remainder_model.dart';
import 'package:intl/intl.dart';
import 'local_notification.dart';

class addReminder extends StatefulWidget {
  const addReminder({super.key});

  @override
  State<addReminder> createState() => _addReminderState();
}

class _addReminderState extends State<addReminder> {
  // final NotificationService _notificationService = NotificationService();
  final _formkey = GlobalKey<FormState>();
  final _formkey2= GlobalKey<FormState>();
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
        initialEntryMode: TimePickerEntryMode.input
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date.text="";
  }
   List<String> list = ["Vaccine","Medicine","Others"];
   String dropdownValue = "Vaccine";
   @override
  Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;

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
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child: InkWell(
                        
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 50,
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
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
        padding: EdgeInsets.only(top: size.height*0.09 ,right: size.width*0.3,left: size.width*0.05),
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
  padding:  EdgeInsets.only(top: size.height*0.16,right: 40,left: 40),
  child:   Form(
    key: _formkey,
    child: Column(
    
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
    TextFormField(
      validator:(value) {
        if (value!.isEmpty){
          return "reminder is required";
        }
        return null;
      },
    controller: reminder,
    decoration: const InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.only(topRight:Radius.circular(50),bottomRight: Radius.circular(50),bottomLeft: Radius.circular(40))
    ),
        
     hintStyle :TextStyle (color: Colors.black,
     fontWeight: FontWeight.bold ) ,
    fillColor: Color.fromARGB(255, 146, 145, 145),
    filled: true,
           hintText: '    Reminder'
           ,
    
        
    
    ),
    
        ),
    
        const SizedBox(height: 10,),
         Container(
          width:500 ,
          height: 65, 
          decoration: const BoxDecoration(
            color:  Color.fromARGB(255, 146, 145, 145),
             borderRadius: BorderRadius.only(topRight:Radius.circular(50),bottomRight: Radius.circular(50),bottomLeft: Radius.circular(40))
          ),
           child: Padding(
             padding:  EdgeInsets.only(right: size.width*0.2,left: 25,top: 10), 
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
    const SizedBox(height: 10,),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Date is required';
            }
            return null;
          },
          keyboardType: TextInputType.none,
        onTap: ()async {
        setState(() async{
           
         DateTime selectDate =await _selectDate(context);
         String formattedDate =
         DateFormat('dd-MM-yyyy - HH-mm-ss').format(selectDate);
         date.text=formattedDate;
        });
        },
        controller: date,
          decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.only(topRight:Radius.circular(50),bottomRight: Radius.circular(50),bottomLeft: Radius.circular(40))
            ),
            hintText: '    Date',
            hintStyle :TextStyle (color: Colors.black  ,
             fontWeight: FontWeight.bold ) ,
            fillColor: Color.fromARGB(255, 146, 145, 145),
            filled: true,
          
            
        
          )
        
        ),
    
        const SizedBox(height:20,),
     Row(
        children: [
          
           SizedBox(width:size.width*0.5,),
      Padding(
        padding:  EdgeInsets.only(top: 40, ),
        child: ElevatedButton(
          onPressed: ()async {
            if (_formkey.currentState!.validate()){
            RemainderModel remainder=RemainderModel( reminder: reminder.text, reminderType: dropdownValue, date: date.text);
            remainderAddToDB(remainder);
            var fullDate=date.text;
            var thisDate=fullDate.split('-');
            print(fullDate);
            print(thisDate);
          
            var data=thisDate.first.trim();
            var year=thisDate.elementAt(2).trim();
            var mnth=thisDate.elementAt(1).trim();
            var hour=thisDate.elementAt(3).trim();
            var min=thisDate.elementAt(4).trim();
            var sec=thisDate.last.trim();          
            Notify.scheduleNewNotification(data,mnth,year,hour,min,sec,reminder.text);
           Navigator.pop(context);
          }
  
          },
          child: const Text(
            'Add',
            style: TextStyle(color: Color.fromARGB(255, 11, 11, 11),fontWeight: FontWeight.bold ),
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
  ),
)
            ]
          )
          ,)
          ,)
    );
  }
}

ShapeBorder kBackButtonShape = const RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
  ),
);

Widget kBackBtn = const Icon(
  Icons.arrow_back_ios,
  color: Colors.black54,
);