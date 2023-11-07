import 'package:flutter/material.dart';
import 'package:flutter_my_dog/db/user/user_hive_db/user_hive_db.dart';
import 'package:flutter_my_dog/models/remainder_model.dart';
import 'package:flutter_my_dog/screens/Reminders/edit_reminder.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

class reminderListScreen extends StatefulWidget {
  reminderListScreen({super.key});

  @override
  State<reminderListScreen> createState() => _reminderListScreenState();
}

class _reminderListScreenState extends State<reminderListScreen> {

  late Box<RemainderModel>remainderBox;
  List<RemainderModel>searchList=[];
  List<RemainderModel>allRemainder=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    remainderBox=Hive.box(auth.currentUser!.uid);
    allRemainder= remainderBox.values.toList();
  
  }
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;
 
    return Scaffold(
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
                              'Upcoming',
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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
               
                onChanged: (value)async {
                  
                   searchRemainder(value);
                  
                },
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search Reminders...',
                  fillColor: Colors.white,
                  filled: true ,
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(icon: Icon(Icons.calendar_month_outlined),onPressed:() async {
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
                      DateFormat('dd-MM-yyyy').format(pickedDate);
                      
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                 
                   searchRemainder( searchController.text =
                                formattedDate); //set output date to TextField value.
                  
                } else {}
              }),
                  border: OutlineInputBorder(
                    
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
            ), 

       Expanded(
         child: Padding(
         padding: const EdgeInsets.only(top: 10,right: 20,left: 20),
         child:   Container(
         
           height: size.height*1      ,
         
           width: size.width*0.9   ,
       
         
           decoration: BoxDecoration(
         
             color: Colors.white ,
         
             borderRadius: BorderRadius.circular(20)
         
           ),
           child: 
             searchController.text==''?ValueListenableBuilder(
          valueListenable: remainderNotifiList,
          builder: (context, remainderList, child) {
            return ListView.builder(
     physics: BouncingScrollPhysics(),
     itemCount: remainderList.length,
     itemBuilder: (context, index) {
     var remainder=remainderList[index];
        var fullDate=remainder.date??"d";
            var thisDate=fullDate.split('-');
            var month= thisDate.elementAt(1);
            if (month == '01') {
                                month = 'Jan';
                              }
                              if (month == '02') {
                                month = 'Feb';
                              }
                              if (month == '03') {
                                month = 'Mar';
                              }
                              if (month == '04') {
                                month = 'Apr';
                              }
                              if (month == '05') {
                                month = 'May';
                              }
                              if (month == '06') {
                                month = 'Jun';
                              }
                              if (month == '07') {
                                month = 'Jul';
                              }
                              if (month == '08') {
                                month = 'Aug';
                              }
                              if (month == '09') {
                                month = 'Sep';
                              }
                              if (month == '10') {
                                month = 'Oct';
                              }
                              if (month == '11') {
                                month = 'Nov';
                              }
                              if (month == '12') {
                                month = 'Dec';
                              }
                               
                                var hourr = thisDate.elementAt(3);
                              dynamic AP;

                              if (hourr == ' 13' ||
                                  hourr == ' 14' ||
                                  hourr == ' 15' ||
                                  hourr == ' 16' ||
                                  hourr == ' 17' ||
                                  hourr == ' 18' ||
                                  hourr == ' 19' ||
                                  hourr == ' 20' ||
                                  hourr == ' 21' ||
                                  hourr == ' 22' ||
                                  hourr == ' 23' ||
                                  hourr == ' 24') {
                                AP = 'PM';
                              } else {
                                AP = 'AM';
                              }

                              var hour = thisDate.elementAt(3);
                              if (hour == ' 13') {
                                hour = '01';
                              } else if (hour == ' 14') {
                                hour = '02';
                              } else if (hour == ' 15') {
                                hour = '03';
                              } else if (hour == ' 16') {
                                hour = '04';
                              } else if (hour == ' 17') {
                                hour = '05';
                              } else if (hour == ' 18') {
                                hour = '06';
                              } else if (hour == ' 19') {
                                hour = '07';
                              } else if (hour == ' 20') {
                                hour = '08';
                              } else if (hour == ' 21') {
                                hour = '09';
                              } else if (hour == ' 22') {
                                hour = '10';
                              } else if (hour == ' 23') {
                                hour = '11';
                              } else if (hour == ' 00') {
                                hour = '12';
                              }
                              
                              

                              
           var datee='${thisDate.first} $month ${thisDate.elementAt(2)} ${hour.trim()}:${thisDate.elementAt(4)} $AP';
            return Card(child: ListTile(title: Text(remainder.reminder??"remainder",style: TextStyle(fontWeight: FontWeight.bold),),
         subtitle: Text(datee),
         trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => editReminder(remainder: remainder)),
      );
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text("Delete Reminder"),
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
                                    remainderDelete(remainder.id!);
                                    Navigator.of(ctx)
                                        .pop(); // Close the dialog
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
          leading: Icon(Icons.access_time_outlined ,color: Colors.red ,),),
            );
          },);
          },
    
    ):ListView.builder(
     physics: BouncingScrollPhysics(),
     itemCount: searchList.length,
     itemBuilder: (context, index) {
     var remainder=searchList[index];
        var fullDate=remainder.date??"d";
            var thisDate=fullDate.split('-');
            var month= thisDate.elementAt(1);
            if (month == '01') {
                            month = 'Jan';
                          }
                          if (month == '02') {
                            month = 'Feb';
                          }
                          if (month == '03') {
                            month = 'Mar';
                          }
                          if (month == '04') {
                            month = 'Apr';
                          }
                          if (month == '05') {
                            month = 'May';
                          }
                          if (month == '06') {
                            month = 'Jun';
                          }
                          if (month == '07') {
                            month = 'Jul';
                          }
                          if (month == '08') {
                            month = 'Aug';
                          }
                          if (month == '09') {
                            month = 'Sep';
                          }
                          if (month == '10') {
                            month = 'Oct';
                          }
                          if (month == '11') {
                            month = 'Nov';
                          }
                          if (month == '12') {
                            month = 'Dec';
                          }

                                 var hourr = thisDate.elementAt(3);
                          dynamic AP;

                          if (hourr == ' 13' ||
                              hourr == ' 14' ||
                              hourr == ' 15' ||
                              hourr == ' 16' ||
                              hourr == ' 17' ||
                              hourr == ' 18' ||
                              hourr == ' 19' ||
                              hourr == ' 20' ||
                              hourr == ' 21' ||
                              hourr == ' 22' ||
                              hourr == ' 23' ||
                              hourr == ' 24') {
                            AP = 'PM';
                          } else {
                            AP = 'AM';
                          }

                          var hour = thisDate.elementAt(3);
                          if (hour == ' 13') {
                            hour = '01';
                          } else if (hour == ' 14') {
                            hour = '02';
                          } else if (hour == ' 15') {
                            hour = '03';
                          } else if (hour == ' 16') {
                            hour = '04';
                          } else if (hour == ' 17') {
                            hour = '05';
                          } else if (hour == ' 18') {
                            hour = '06';
                          } else if (hour == ' 19') {
                            hour = '07';
                          } else if (hour == ' 20') {
                            hour = '08';
                          } else if (hour == ' 21') {
                            hour = '09';
                          } else if (hour == ' 22') {
                            hour = '10';
                          } else if (hour == ' 23') {
                            hour = '11';
                          } else if (hour == ' 00') {
                            hour = '12';
                          }
                              
                              
           var datee=thisDate.first +' '+month+' '+thisDate.elementAt(2)+'-'+thisDate.elementAt(3)+':'+thisDate.elementAt(4);
            return Card(child: ListTile(title: Text(remainder.reminder??"remainder",style: TextStyle(fontWeight: FontWeight.bold),),
         subtitle: Text(datee),
          trailing:  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => editReminder(remainder: remainder)),
      );
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text("Delete Reminder"),
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
                                    remainderDelete(remainder.id!);
                                    Navigator.of(ctx)
                                        .pop(); // Close the dialog
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
          leading: Icon(Icons.access_time_outlined ,color: Colors.red ,),),
            );
          },)
            
         
         ),
         
       ),
       ),  
          ]
        )
        ,)
    );
  }
  searchRemainder(String value)async{
setState(() {
  searchList=allRemainder.where((element) => element.reminder!.toLowerCase().startsWith(value.toLowerCase())||element.date!.startsWith(value)).toList();
}); }
}

ShapeBorder kBackButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
  ),
);

Widget kBackBtn = Icon(
  Icons.arrow_back_ios,
  color: const Color.fromARGB(255, 0, 0, 0),
);