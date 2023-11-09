import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_dog/db/user/user_db.dart';
import 'package:flutter_my_dog/screens/authentication/loginscreen.dart';
import 'package:flutter_my_dog/screens/landing/landingscreen1.dart';
import 'package:image_picker/image_picker.dart';

class signUppage extends StatefulWidget {
  final Function()? onPressed;
  const signUppage({super.key,required this.onPressed});

  @override
  State<signUppage> createState() => _loginscreenState();
}

class _loginscreenState extends State<signUppage> {
  bool showPassword=false;
 final formkey =GlobalKey<FormState>();
  bool isloading=false;
     TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController firstnamecontroller=TextEditingController();
    TextEditingController lastnamecontroller=TextEditingController();
    TextEditingController addresscontroller=TextEditingController();
    TextEditingController phonecontroller=TextEditingController();
  createUserWithEmailAndPassword() async {
    try {
      setState(() {
        isloading=true;
      });
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailcontroller.text,
    password: passwordcontroller.text
  );
  setState(() {
    isloading=false;
  });
} on FirebaseAuthException catch (e) {
  setState(() {
    isloading=false;
  });
  if (e.code == 'weak-password'){
     ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Password is too week'),),
    );
  } else if (e.code == 'email-already-in-use') {
    ScaffoldMessenger.of( context ).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Email Already in Use'),),
    );  }
} catch (e) {
  setState(() {
    isloading=false;
  });
  print(e);

}
   
  }

 @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Hero(
                      tag: kBackBtn,
                      child: Card(
                        color: const Color.fromARGB(255, 0, 0, 0) ,
                        elevation: 10,
                        shape: kBackButtonShape,
                        child: MaterialButton(
                          height: 50,
                          minWidth: 50,
                          elevation: 10,
                          shape: kBackButtonShape,
                          onPressed:  () {
                          // widget.onPressed;
                          },
                          child: kBackBtn,
                        ),
                      ),
                    ),
                    Hero(
                      tag: 'title',
                      transitionOnUserGestures: true,
                      child: Card(
                        color: const Color.fromARGB(255, 0, 0, 0) ,
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
                                  'signup',
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
              Padding(
                padding: EdgeInsets.only(top: size.height*0.09),
                child: Container(
                  child: Form(
                    key: formkey,
                    child:Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30,
                      top: 20),
                      child: Column(
                        children: [
                          CircleAvatar(
                          
                              backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.0LvP1YUJ2stgbrp2srwnFQHaHa?pid=ImgDet&w=203&h=203&c=7&dpr=1.3'),
                              radius: 70,
                              child: IconButton(onPressed: (){
                                 showDialog(context: context, builder: (context) {
                                  return AlertDialog(
                                  title: Text("Pick image"),
                                  actions: [IconButton(onPressed: (){
                                  userimgPick(ImageSource.gallery);
                                }, icon: Icon(Icons.browse_gallery)),IconButton(onPressed: (){
                                  userimgPick(ImageSource.camera);}, icon: Icon(Icons.camera))],);
                                },);
                              }, icon: Icon(Icons.add_a_photo,color: Colors.white ,)),
                            ),
                             SizedBox(height: 15,), 
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: firstnamecontroller,
                                     validator: (text) {
                              if (text==null || text.isEmpty){
                                return "Name is Empty";
                              }
                              return null;
                            },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      filled: true,
                                      fillColor: Color.fromARGB(255, 222, 222, 222),
                                      focusColor: Colors.white,
                                      hintText: '  First Name',
                                      hintStyle: TextStyle(color: Colors.black),
                                    ),
                                    onEditingComplete: () {
                  FocusScope.of(context).nextFocus();
                              }  
                                  ),
                                ),
                                SizedBox(width: 00),
                                Expanded(
                                  child: TextFormField(
                                    controller: lastnamecontroller,
                                     validator: (text) {
                              if (text==null || text.isEmpty){
                                return "LastName is Empty";
                              }
                              return null;
                            },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      filled: true,
                                      fillColor: Color.fromARGB(255, 222, 222, 222),
                                      focusColor: Colors.white,
                                      hintText: '  Last Name',
                                      hintStyle: TextStyle(color: Colors.black),
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
                              controller: addresscontroller,
                                   validator: (text) {
                              if (text==null || text.isEmpty){
                                return "Address is Empty";
                              }
                              return null;
                            },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                filled: true,
                                fillColor: Color.fromARGB(255, 222, 222, 222),
                                focusColor: Colors.white,
                                hintText: 'Address',
                                hintStyle: TextStyle(color: Colors.black),
                                prefixIcon: Icon(Icons.app_registration_rounded,color: Colors.black,),
                              ),
                              onEditingComplete: () {
                  FocusScope.of(context).nextFocus();
                              }  
                            ),
                            SizedBox(height: 4,),
                            TextFormField(
                              controller: phonecontroller,
                              keyboardType: TextInputType.phone,
                                   validator: (text) {
                              if (text==null || text.isEmpty){
                                return "Phone is Empty";
                              }
                              return null;
                            },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                filled: true,
                                fillColor: Color.fromARGB(255, 222, 222, 222),
                                focusColor: Colors.white,
                                hintText: 'Phone',
                                hintStyle: TextStyle(color: Colors.black),
                                prefixIcon: Icon(Icons.phone,color:  Colors.black,),
                              ),
                              onEditingComplete: () {
                  FocusScope.of(context).nextFocus();
                              }  
                            ),
                                                    SizedBox(height: 4,),
                  
                          TextFormField(
                            controller: emailcontroller,
                            validator: (text) {
                              if (text==null || text.isEmpty){
                                return "Email is Empty";
                              }
                              //  final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
              
                              // if (!emailRegExp.hasMatch(text)) {
                              //   return 'Invalid Email';
                              // }
                              return null;
                            },
                             style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                            decoration: InputDecoration(
                              
                               prefixIcon: Icon(Icons.person,color: const Color.fromARGB(255, 0, 0, 0),),
                              hintText: 'Email ID',
                              hintStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)
                              ),
                                fillColor: Color.fromARGB(255, 222, 222, 222),
                          focusColor: Colors.white,
                          filled: true,
                            ),
                           onEditingComplete: () {
                  FocusScope.of(context).nextFocus();
                              }  
                          ),
                            SizedBox(height: 4,),
                          TextFormField(
                            controller: passwordcontroller,
                            validator: (text) {
                              if (text==null || text.isEmpty){
                                return "Password is Empty";
                              }
                              return null;
                            
                            },
                              
                              obscureText: showPassword ? false : true,
                                                 
                            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.security,color: const Color.fromARGB(255, 0, 0, 0),),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                              filled: true,
                                fillColor: Color.fromARGB(255, 222, 222, 222),
                          focusColor: Colors.white,
                            suffixIcon:  InkWell(
                                  onTap: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  child: Icon(
                                    showPassword
                                        ? Icons.visibility_off
                                        : Icons.remove_red_eye,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                            ),
                            onEditingComplete: () {
                  FocusScope.of(context).unfocus();
                              } 
                            
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: ElevatedButton.icon(onPressed:
                            ()async{ if (formkey.currentState!.validate()){
                             await createUserWithEmailAndPassword();
                             addUSerToDB(firstnamecontroller.text, lastnamecontroller.text, addresscontroller.text, phonecontroller.text);
                        //       Navigator.pushReplacement(
                        //  context,
                        //  MaterialPageRoute(builder: (context) => const Landing1()),
                        //      );
                            }
              
                            },
                               icon:isloading? Text(''): Icon(Icons.check_circle_outline_outlined,color: Colors.white,),
                                label:isloading? CircularProgressIndicator(color: Colors.white,strokeWidth: 2,)
                                : Text('SignUp',style: TextStyle(color: Colors.white),),
                                style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.grey.shade900)
                            ),),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: size.width*0.15 ,top: 0),
                            child: Row(
                              children: [
                                Text('Already have an account?'),
                                TextButton(onPressed:
                                  widget.onPressed
                              // Navigator.push(context,
                              // MaterialPageRoute(builder:(context)=>const loginscreen()));
                              , child:Text('Login',style: TextStyle(decoration: TextDecoration.underline),))
                              ],
                            ),
                          )
                        ],
                         
                      ),
                    ), 
                   
                  ) ,
                ),
              )
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
  color: Colors.white ,
);
