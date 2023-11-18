
import 'package:flutter/material.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter_my_dog/db/user/user_db.dart';
import 'package:flutter_my_dog/screens/Dogs/dog_diet_page.dart';
import 'package:flutter_my_dog/screens/home/timer.dart';
import 'package:flutter_my_dog/screens/User/userprofile.dart';

import 'videos.dart';
ValueNotifier<List<double>>dogsList=ValueNotifier([0.1]);
class homeScreen extends StatefulWidget {
  
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  // DogModel selectedIcon = DogModel(id: "id", profile: "profile", name: "name", dob: "dob", month: "month", breed: "breed", certificate: "certificate",training: [0.9]);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDogFromDB();
  }
  List<double>thisDogData=[];
  int dogNum=0;
  List<double>emty=[0.1];
forGetThisDog(){
  dogsList.value.clear();
  setState(() {
     for (var element in thisUserDogsList[dogNum].training!) {
                  dogsList.value.add(element.toDouble());
                }
  });
}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
     backgroundColor: Color.fromARGB(255, 236, 231, 231) ,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // SizedBox(height: 30,),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Hero(
                  tag: kBackBtn,
                  child: Card(
                    color: Colors.blue ,
                    elevation: 10,
                    shape: kBackButtonShape,
                    child: MaterialButton(
                      height: 50,
                      minWidth: 50,
                      elevation: 10,
                      shape: kBackButtonShape,
                      onPressed: (){
                        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => userProfile()),
                );
                      },
                      child: kBackBtn,
                    
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
               Hero(
                  tag: 'title',
                  transitionOnUserGestures: true,
                  child: Card(
                    color: Colors.blue,
                    elevation: 10 ,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    child: InkWell(
                      
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.55,
                        height: 50,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              'Home',
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
         SizedBox(height:size.height*0.02,),
   Padding(
     padding:EdgeInsets.only(left: size.width*0.08),
     child: Row(
        children: [
        Expanded(
          flex: 3 ,
          child: Container(
            // color: Colors.amber,
            height: size.height*0.07  ,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [Color.fromARGB(255, 74, 177, 246).withOpacity(0.5),Color.fromARGB(255, 212, 218, 222)]) ),
            child: ListView.builder(
              itemCount: thisUserDogsList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var dog=thisUserDogsList[index];
               
              return  GestureDetector(
                onTap: () {
                  setState(() {
                    dogNum=index;
                    forGetThisDog();
                  });
                },
                child:dogNum!=index? Container(
                  width: size.width*0.3,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 3,blurStyle: BlurStyle.outer)],
                    color: Colors.white ,
                    borderRadius: BorderRadius.circular(18), 
                  ),
                  child: Row(children: [
                   CircleAvatar(backgroundColor: Colors.black,backgroundImage: NetworkImage(dog.profile??"https://th.bing.com/th/id/OIP.0LvP1YUJ2stgbrp2srwnFQHaHa?pid=ImgDet&w=203&h=203&c=7&dpr=1.3"),),
                    Expanded(child: Text(dog.name??"name",overflow: TextOverflow.ellipsis,style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16
                    ),)),
                  ],),
                ): Container(
                  width: size.width*0.3,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.red ,blurRadius: 8,blurStyle: BlurStyle.outer)],
                    color: Colors.white ,
                    borderRadius: BorderRadius.circular(18), 
                  ),
                  child: Row(children: [
                   CircleAvatar(backgroundColor: Colors.black,backgroundImage: NetworkImage(dog.profile??"https://th.bing.com/th/id/OIP.0LvP1YUJ2stgbrp2srwnFQHaHa?pid=ImgDet&w=203&h=203&c=7&dpr=1.3"),),
                    Expanded(child: Text(dog.name??"name",overflow: TextOverflow.ellipsis,style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16
                    ),)),
                  ],),
                )
              );
            },),
          ),
        ),
        // SizedBox(width:size.width*0.5 ,),
      Expanded(
        flex: 1,
        child: Padding(
        padding: const EdgeInsets.only(),
        child: IconButton(onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StopWatchTimerPage()),
            );
        }, icon: Icon(Icons.timer,size: 35,))
        ),
      ),
     ],
     ),
   ),
   SizedBox(height: size.height*0.01,),
  Container(
    height: size.height*0.38,
    width: size.width*0.85,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
    children: [
      SizedBox(height: 8,),
      Text(
    'Training Activity',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Padding(
    padding: EdgeInsets.all(10),
    child: ValueListenableBuilder(
      valueListenable: dogsList,
      builder: (context, value, child) {
        return LineGraph(
        features: [
        Feature(
          color: Colors.red, 
          data:value
        ),
        ],
        size: Size(size.width*0.9 , size.height*0.3 ),
        labelX: ['D 1', 'D 2', 'D 3', 'D 4', 'D 5', 'D 6'],
        labelY: ['5', '10', '15', '20', '25', '30'],
        graphColor: Colors.black87,
      );
      },
      
    ), 
      ),
    ],
    ),
  )
,
SizedBox(height: size.height*0.02,),

Container(
  height: size.height*0.24  ,
  width: size.width*0.85 ,
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  color: Colors.white ,
  ),
  child: Column(
  children: [
    SizedBox(height: 10,),
    Text(
  'Training Programs',
  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 10,),
    Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Videos()),
      );
    },
    child: Container(
      height: size.height*0.16,
      width: size.width*0.35,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 222, 162),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        children: [
          Image.network('https://cdn-icons-png.flaticon.com/128/3900/3900369.png', scale:1.4 ,),
          Text('Trainings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
        ],
      ),
    ),
    ),
    InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyPdfViewer(pdfPath: "assets/documents/Pet Diet Chart.pdf")),
      );
    },
    child: Container(
     height: size.height*0.16,
      width: size.width*0.35,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 253, 135) ,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        children: [
          Image.network('https://cdn-icons-png.flaticon.com/128/8876/8876508.png', scale:1.4,),
          Text('Food Diet', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
        ],
      ),
    ),
    ),
  ],
    ),
  ],
  ),
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
  Icons.supervised_user_circle_outlined,
  color: Color.fromARGB(133, 61, 53, 53),
);
