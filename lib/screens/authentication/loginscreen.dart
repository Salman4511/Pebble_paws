import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginscreen extends StatefulWidget {
  final Function()? onPressed;
  const loginscreen({super.key, required this.onPressed});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final formkey =GlobalKey<FormState>();
  bool isloading=false;
     TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    bool showPassword = false;
  signInWithEmailAndPassword()async{
     try {
      setState(() {
        isloading=true;
      });
  await FirebaseAuth.instance.signInWithEmailAndPassword(
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
  if (e.code == 'user-not-found') {
    
    
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('No User Found'),),
    );
  } else if (e.code == 'wrong-password') {
     ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        
        content: Text('wrong password'),),
    );
  }
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
                      color: Color.fromARGB(255, 34, 34, 34) ,
                      elevation: 30,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(150),
                        ),
                      ),
                      child: InkWell(
                        
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 200,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30,top: 50),
                              child: Column(
                                children: [
                                  Text('HELLO', style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,color: Colors.white 
                                      // color: Colors.black54,
                                    ),),
                                  Text(
                                    'Welcome Back...',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,color: Colors.white
                                      // color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                 
                child: Form(
                  key: formkey,
                  child:Padding(
                    padding:  EdgeInsets.only(left: 30,right: 30,
                    top: size.height*0.1 ),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailcontroller,
                          validator: (text) {
                            if (text==null || text.isEmpty){
                              return "Email is Empty";
                            }
                             final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

                            if (!emailRegExp.hasMatch(text)) {
                              return 'Invalid Email';
                               }
                            return null;
                          },
                           style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            
                             prefixIcon: Icon(Icons.person,color: Colors.white,),
                            hintText: 'Email ID',
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)
                            ),
                        fillColor: Colors.grey.shade900,
                        focusColor: Colors.white,
                        filled: true,
                          ),
                         onEditingComplete: () {
                FocusScope.of(context).nextFocus();
                            }  
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: passwordcontroller,
                          validator: (text) {
                            if (text==null || text.isEmpty){
                              return "Password is Empty";
                            }
                            return null;
                          
                          },
                            
                            obscureText: showPassword ? false : true,
                                               
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.security,color: Colors.white,),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.grey.shade900,
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
                                  color: Colors.white,
                                ),
                              ),
                          ),
                          onEditingComplete: () {
                FocusScope.of(context).unfocus();
                            } 
                          
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ElevatedButton.icon(onPressed:
                          (){ if (formkey.currentState!.validate()){
                            signInWithEmailAndPassword();
                          }
                          },
                             icon:isloading? Text(''): Icon(Icons.check_circle_outline_outlined,color: Colors.white,),
                              label:isloading? CircularProgressIndicator(color: Colors.white,strokeWidth: 2,)
                              : Text('Login',style: TextStyle(color: Colors.white),),
                              style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.grey.shade900)
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40,top: 120),
                          child: Row(
                            children: [
                              Text('Does not have an account?'),
                              TextButton(onPressed: widget.onPressed,
                            //     Navigator.push(context,
                            // MaterialPageRoute(builder:(context)=>const signUppage()));
                            child:Text('SignUp',style: TextStyle(decoration: TextDecoration.underline),))
                            ],
                          ),
                        )
                      ],
                       
                    ),
                  ), 
                 
                ) ,
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
  color: Colors.black54,
);