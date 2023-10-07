
import 'package:flutter/material.dart';
import 'package:file_case/file_case.dart';
import 'package:flutter_my_dog/db/user/user_db.dart';
import 'package:flutter_my_dog/models/dog_model.dart';
import 'package:image_picker/image_picker.dart';


class editDog extends StatefulWidget {
   editDog({super.key,required this.dog});
   DogModel dog;

  @override
  State<editDog> createState() => _editState();
}

class _editState extends State<editDog> {
  final FileCaseController firstController = FileCaseController(
      filePickerOptions:
          FilePickerOptions(type: FileType.any, allowMultiple: true),
      tag: 'controller1');

TextEditingController namecontroller=TextEditingController();

TextEditingController dobcontroller=TextEditingController();

TextEditingController monthcontroller=TextEditingController();

TextEditingController breedcontroller=TextEditingController();

void _clearTextFields() {
    setState(() {
      namecontroller.clear();
      dobcontroller.clear();
      monthcontroller.clear();
      breedcontroller.clear();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    try {
       namecontroller.text=widget.dog.name??"name";
    dobcontroller.text=widget.dog.dob??"dob";
    monthcontroller.text=widget.dog.month??"month";
    breedcontroller.text = widget.dog.breed??"breed";
    } catch (e) {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white   ,
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets\images\8l94k255.png'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: SingleChildScrollView(
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
                                  'Edit Dog',
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
                  padding: const EdgeInsets.only(top: 90,left: 30,right: 30),
                  child: Container(
                    child: Form(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: CircleAvatar(backgroundImage: 
                              NetworkImage('https://us.123rf.com/450wm/yuliarudenko/yuliarudenko1903/yuliarudenko190300122/122602687-dog-symbol-icon-round-flat-vector-art-design-color-circle.jpg?ver=6')
                                            ,radius: 70,
                                        child: IconButton(onPressed:() {
                                           showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                title: Text("Pick image"),
                                actions: [IconButton(onPressed: ()async{
                               await dogimgPick(ImageSource.gallery);
                              
                              }, icon: Icon(Icons.browse_gallery)),IconButton(onPressed: (){
                                dogimgPick(ImageSource.camera);}, icon: Icon(Icons.camera))],);
                              },);
                                        },icon:Icon(Icons.add_a_photo,color: Colors.black ,),)
                                            ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                  
                                    controller: namecontroller,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                      focusColor: Colors.white,
                      filled: true,
                                      hintText: '  Pet Name',
                                       hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0))
                                    ),
                                   onEditingComplete: () {
                FocusScope.of(context).nextFocus();
                            }  
                                  ),
                                ),
                              
                              ],
                            ),
                            SizedBox(height: 4,),
                           TextFormField(
                            controller: dobcontroller,
                                    decoration: InputDecoration(
                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                  
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                      focusColor: Colors.white,
                      filled: true,
                                      hintText: '  DOB',
                                       hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0))
                                    ),
                                    onEditingComplete: () {
                FocusScope.of(context).nextFocus();
                            }  
                                  ),
                             SizedBox(height: 4,),
                            TextFormField(
                              controller: monthcontroller,
                                    decoration: InputDecoration(
                                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                   
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                      focusColor: Colors.white,
                      filled: true,
                                      hintText: '  Months',
                                       hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0))
                                    ),
                                    onEditingComplete: () {
                FocusScope.of(context).nextFocus();
                            }  
                                  ),
                             SizedBox(height: 4,),
                             TextFormField(
                              controller: breedcontroller,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                    
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                      focusColor: Colors.white,
                      filled: true,
                                      hintText: '  Breed',
                                       hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0))
                                    ),
                                    onEditingComplete: () {
                FocusScope.of(context).unfocus();
                            }  
                                  ),
                             SizedBox(height: 4,),
                          
                             SizedBox(height: 4,),
                
                            Padding(
                              padding: const EdgeInsets.only(left: 90),
                              child: Row(
                                children: [
                                
                                Text('Upload Certificate',style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.w500),),
                                IconButton(onPressed: (){
                                   showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                title: Text("Pick image"),
                                actions: [IconButton(onPressed: (){
                                certificateimgPick(ImageSource.gallery);
                              }, icon: Icon(Icons.browse_gallery)),IconButton(onPressed: (){
                                certificateimgPick(ImageSource.camera);}, icon: Icon(Icons.camera))],);
                              },);
                                }, icon: Icon(Icons.file_copy_outlined)),
                                SizedBox(width: 1,),
                                 
                                ],
                              ),
                            ),
                             ElevatedButton(onPressed: (){
                              // getUSerFromDB();
                         updateDog(widget.dog.id!,namecontroller.text, dobcontroller.text, monthcontroller.text, breedcontroller.text,widget.dog.profile!,widget.dog.certificate!);
                         Navigator.pop(context);
                        }, 
                        child:Text('Save Changes',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold),),
                        style:ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.blue)) ,),
                          ],
                        ),
                                     ),
                                     
                  ),
                  
                ),
               
              ],
              
            ),
            
          
          ),
        ),
      ),
      
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

