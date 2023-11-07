import 'dart:async';
import 'package:flutter/material.dart';

import '../../db/user/user_db.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

ValueNotifier<String>thisDogID=ValueNotifier('');
class StopWatchTimerPage extends StatefulWidget {
  @override
  _StopWatchTimerPageState createState() => _StopWatchTimerPageState();
}

class _StopWatchTimerPageState extends State<StopWatchTimerPage> {
  static const countdownDuration = Duration(minutes: 0);
  Duration duration = Duration();
  Timer? timer;
int currntTrynTym=0;
  bool countDown =true;
int today=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reset();
  }

  void reset(){
    if (countDown){
      setState(() =>
        duration = countdownDuration);
    } else{
      setState(() =>
        duration = Duration());
    }
  }

  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1),(_) => addTime());
  }

  void addTime(){
    final addSeconds = countDown ? 1 : -1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0){
        timer?.cancel();
      } else{
        duration = Duration(seconds: seconds);
        currntTrynTym=seconds;
print("the current time is  ${seconds.toString()}");
      }
    });
  }

  void stopTimer({bool resets = true}){
    if (resets){
      tymUpdateToDataBase(currntTrynTym);
      reset();
    }
    setState(() => timer?.cancel());
  }

  int dogNum=0;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
    backgroundColor: Colors.orange[50],
    appBar: AppBar(
      title: Text("StopWatch",style: TextStyle(fontWeight: FontWeight.bold),),
      centerTitle: true,
      backgroundColor: Colors.blue,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          dogsList(size),
          SizedBox(height: 60,),
          buildTime(),
          SizedBox(height: 80,),
          buildButtons()
        ],
      ),
    ),
  );} 
Widget dogsList(Size size,){
  return Container(
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
           thisDogID.value=dog.id??"id";
           print(thisDogID.value);
       thisDogID.notifyListeners();
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
  );
}
  Widget buildTime(){
    String twoDigits(int n) => n.toString().padLeft(2,'0');
    final hours =twoDigits(duration.inHours);
    final minutes =twoDigits(duration.inMinutes.remainder(60));
    final seconds =twoDigits(duration.inSeconds.remainder(60));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTimeCard(time: hours, header:'HOURS'),
        SizedBox(width: 8,),
       buildTimeCard(time: minutes, header:'MINUTES'),
       SizedBox(width: 8,),
       buildTimeCard(time: seconds, header:'SECONDS'),
    ]
    );
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text(
            time, style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.black,fontSize: 50),),
          ),
          SizedBox(height: 24,),
          Text(header,style: TextStyle(color: Colors.black45)),
        ],
      );

  Widget buildButtons(){
    final isRunning = timer == null? false: timer!.isActive;
    final isCompleted = duration.inMinutes == 30;
     return isRunning || isCompleted
         ? Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         ButtonWidget(
             text:'STOP',
             onClicked: (){
               if (isRunning){
                 stopTimer(resets: false);
               }
             }),
         SizedBox(width: 12,),
         ButtonWidget(
             text: "CANCEL",
             onClicked: stopTimer
         ),
       ],
     )
         : ButtonWidget(
         text: "Start Timer!",
         color: Colors.black,
         backgroundColor: Colors.white,
         onClicked: (){
           startTimer();
         });

  }
  tymUpdateToDataBase(int currentTrynTym)async{
    
  String id=thisDogID.value;
  String currnetTym=DateFormat('dd-MM-yyyy').format(DateTime.now());
  updateTrainingOfDog(currentTrynTym,id,currnetTym);
}
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onClicked;

  const ButtonWidget({Key? key, required this.text, required this.onClicked,
    this.color = Colors.white, this.backgroundColor = Colors.black}) : super(key: key);
  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16)
    ),
      onPressed: onClicked,
      child: Text(text,style: TextStyle(fontSize: 20,color: color),)
  );



}