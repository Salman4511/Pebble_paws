import 'package:flutter/material.dart';
import 'package:flutter_my_dog/db/user/user_db.dart';
import 'package:flutter_my_dog/models/user_model.dart';
import 'package:image_picker/image_picker.dart';


class editProfile extends StatefulWidget {
   editProfile({super.key,required this.user});
UserModel user;
  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
 TextEditingController firstName=TextEditingController();
 TextEditingController lastName=TextEditingController();
 TextEditingController address=TextEditingController();
 TextEditingController phone=TextEditingController();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    var fullname=widget.user.fullname!.split(' ');
try {
  print(fullname);

print(fullname[1]);
    firstName.text=fullname[0];
    lastName.text=fullname[1];
    address.text=widget.user.address??"adress";
    phone.text = widget.user.phone??"phone";
} catch (e) {
  print("the error is $e");
}
  }


  @override
  Widget build(BuildContext context) {
            final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white ,
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
                                'Edit Profile',
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
                padding: EdgeInsets.only(top: size.height*0.15,left: 30,right: 30),
                child: Container(
                  child: Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: CircleAvatar(backgroundImage: 
                            NetworkImage('https://th.bing.com/th/id/OIP.0LvP1YUJ2stgbrp2srwnFQHaHa?pid=ImgDet&w=203&h=203&c=7&dpr=1.3')
                                          ,radius: 70,
                                      child: IconButton(onPressed: (){
                                        showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                title: Text("Pick image"),
                                actions: [IconButton(onPressed: (){
                                userimgPick(ImageSource.gallery);
                              }, icon: Icon(Icons.browse_gallery)),IconButton(onPressed: (){
                                userimgPick(ImageSource.camera);}, icon: Icon(Icons.camera))],);
                              },);
                                      }
                                      ,icon:Icon(Icons.add_a_photo,color: Colors.white,)),
                                          ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  controller: firstName,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                        fillColor: Colors.grey.shade900,
                    focusColor: Colors.white,
                    filled: true ,
                                    hintText: '  First Name',
                                     hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))
                                  ),
                                ),
                              ),
                            
                            ],
                          ),
                          SizedBox(height: 4,),
                         TextFormField(
                          controller:lastName,
                           style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                
                        fillColor: Colors.grey.shade900,
                    focusColor: Colors.white,
                    filled: true,
                                    hintText: '  Last Name',
                                     hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))
                                  ),
                                ),
                           SizedBox(height: 4,),
                          TextFormField(
                            controller: address,
                             style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                 
                        fillColor: Colors.grey.shade900,
                    focusColor: Colors.white,
                    filled: true,
                                    hintText: '  Address',
                                     hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))
                                  ),
                                ),
                           SizedBox(height: 4,),
                           TextFormField(
                            controller:phone,
                             style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                  
                        fillColor: Colors.grey.shade900,
                    focusColor: Colors.white,
                    filled: true,
                                    hintText: '  Phone',
                                     hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))
                                  ),
                                ),
                           SizedBox(height: 4,),
                        
                           SizedBox(height: 4,),
              
                       
                           ElevatedButton(onPressed: (){
                            updateUser(firstName.text, lastName.text, address.text, phone.text,widget.user.profile!);
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

