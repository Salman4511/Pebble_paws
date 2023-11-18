import 'package:flutter/material.dart';
import 'package:flutter_my_dog/db/user/user_hive_db/user_hive_db.dart';
import 'package:flutter_my_dog/models/remainder_model.dart';
import 'package:flutter_my_dog/screens/Reminders/addreminder.dart';
import 'package:flutter_my_dog/screens/Reminders/new.dart';
import 'package:flutter_my_dog/screens/Others/navbar.dart';
import 'package:hive_flutter/adapters.dart';

class reminderScreen extends StatefulWidget {
  const reminderScreen({super.key});

  @override
  State<reminderScreen> createState() => _reminderScreenState();
}

class _reminderScreenState extends State<reminderScreen> {

  late Box<RemainderModel>remainderBox;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    remainderBox=Hive.box(auth.currentUser!.uid);
  }
  List reminderLists=[ReminderVaccineType(),ReminderMedicine(),ReminderOthers()];
  int typeIndex=0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                        Navigator.pushReplacement(
                       context,
                       MaterialPageRoute(builder: (context) => navPage()),
                           );

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
                                'Reminders',
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
              SizedBox(height: size.height*0.02,),
              Container(
                height: size.height*0.19  ,
                width: size.width*0.9   ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white ,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Text(
                      'Reminder Types',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              typeIndex=0;
                            });
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => addDog()),
                            // );
                          },
                          child: Container(
                            height: size.height*0.12  ,
                            width: size.width*0.24  ,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 243, 220, 151),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: size.height*0.01),
                                  child: Image.network('https://cdn-icons-png.flaticon.com/128/4191/4191422.png', scale:2.1 ,),
                                ),
                                Text('vaccine', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              typeIndex=1;
                            });
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => addDog()),
                            // );
                          },
                          child: Container(
                            height: size.height*0.12  ,
                            width: size.width*0.24  ,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 249, 164, 151),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(top:size.height*0.02), 
                                  child: Image.network('https://cdn-icons-png.flaticon.com/128/655/655968.png', scale:2.4  ,),
                                ),
                                Text('medicine', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
                              ],
                            ),
                          ),
                        ),
                         InkWell(
                          onTap: () {
                            setState(() {
                              typeIndex=2;
                            });
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => addDog()),
                            // );
                          },
                          child: Container(
                            height: size.height*0.12  ,
                            width: size.width*0.24  ,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 178, 251, 255),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child:  Column(
                              children: [
                                Padding(
                                  padding:EdgeInsets.only(top: size.height*0.015),
                                  child: Image.network('https://cdn-icons-png.flaticon.com/128/4787/4787175.png', scale:2.2,),
                                ),
                                Text('others', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height*0.02,),
Container(

  height: size.height*0.43     ,

  width: size.width*0.9   ,


  decoration: BoxDecoration(

    color: Colors.white ,

    borderRadius: BorderRadius.circular(20)

  ),
  child: Column(
    children: [
      SizedBox(height: 10,),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 110 ),
            child: Text(
              'Reminder List',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: size.width*0.1,),
          TextButton(onPressed: (){
            Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => reminderListScreen()),
    );
          }, child: Text('SeeAll'))
        ],
      ),
      Expanded(child: reminderLists[typeIndex])
    ],
  ),

),
SizedBox(height: size.height*0.02,),
ElevatedButton.icon(onPressed: (){
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => addReminder()),
    );
}, icon: Icon(Icons.add,color: Colors.black ,), label: Text('Add Reminder',
style:TextStyle(
  color: Colors.black 
) ,),
style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue))  ,)
            ]
          )
          ,)
          ,)
    );
  }
}

class ReminderVaccineType extends StatelessWidget {
  const ReminderVaccineType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: remainderNotifiList,
      builder: (context, remainderList, child) {
        List<RemainderModel> vaccineType=remainderList.where((element) => element.reminderType=="Vaccine").toList();
        return ListView.builder(
          itemCount: vaccineType.length,
          itemBuilder: (context, index) {
          var remainder=vaccineType[index];
             var fullDate=remainder.date??"d";
            var thisDate=fullDate.split('-');
            var month= thisDate.elementAt(1);
            if(month=='01'){
             month='Jan';
            }
            if (month=='02') {
              month='Feb';
            }
            if (month == '03') {
              month='Mar';
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
                              
           var datee=thisDate.first +' '+month+' '+thisDate.elementAt(2);
        return Card(child: ListTile(title: Text(remainder.reminder??"remainder",style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(datee),
               trailing: IconButton(
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
               leading: Icon(Icons.access_time_outlined ,color: Colors.red ,),),
        );
      },);
      },
    
    );
  }
}
class ReminderMedicine extends StatelessWidget {
  const ReminderMedicine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: remainderNotifiList,
      builder: (context, remainderList, child) {
        List<RemainderModel> vaccineType=remainderList.where((element) => element.reminderType=="Medicine").toList();
        return ListView.builder(
          itemCount: vaccineType.length,
          itemBuilder: (context, index) {
          var remainder=vaccineType[index];
             var fullDate=remainder.date??"d";
            var thisDate=fullDate.split('-');
            var month= thisDate.elementAt(1);
            if(month=='01'){
             month='Jan';
            }
            if (month=='02') {
              month='Feb';
            }
            if (month == '03') {
              month='Mar';
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
                              
           var datee=thisDate.first +' '+month+' '+thisDate.elementAt(2);
        return Card(child: ListTile(title: Text(remainder.reminder??"remainder",style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(datee),
               trailing: IconButton(
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
               leading: Icon(Icons.access_time_outlined ,color: Colors.red ,),),
        );
      },);
      },
    
    );
  }
}
class ReminderOthers extends StatelessWidget {
  const ReminderOthers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: remainderNotifiList,
      builder: (context, remainderList, child) {
        List<RemainderModel> vaccineType=remainderList.where((element) => element.reminderType=="Others").toList();
        return ListView.builder(
          itemCount: vaccineType.length,
          itemBuilder: (context, index) {
          var remainder=vaccineType[index];
             var fullDate=remainder.date??"d";
            var thisDate=fullDate.split('-');
            var month= thisDate.elementAt(1);
            if(month=='01'){
             month='Jan';
            }
            if (month=='02') {
              month='Feb';
            }
            if (month == '03') {
              month='Mar';
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
                              
           var datee='${thisDate.first} $month ${thisDate.elementAt(2)}';
        return Card(child: ListTile(title: Text(remainder.reminder??"remainder",style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(datee),
               trailing: IconButton(
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
               leading: Icon(Icons.access_time_outlined ,color: Colors.red ,),),
        );
      },);
      },
    
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