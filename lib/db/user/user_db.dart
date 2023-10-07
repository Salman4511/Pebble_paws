

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_my_dog/models/dog_model.dart';
import 'package:flutter_my_dog/models/event_model.dart';
import 'package:flutter_my_dog/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

FirebaseAuth auth=FirebaseAuth.instance;
FirebaseFirestore firestore=FirebaseFirestore.instance;
FirebaseStorage _storage=FirebaseStorage.instance;
String userprofile='';
String dogprofile='';
String certificate='';
String eventpicture='';
UserModel? thisUser;

// USER FUNCTION 

addUSerToDB(String name,String secondname,String address, String phone,)async{
List fullname=[name,secondname];
String newName=fullname.join(' ');
String id=auth.currentUser!.uid;
UserModel user=UserModel(id: id,fullname: newName, address: address, profile: userprofile, phone: phone);
print(newName);
try {
    print("the function is called");

await firestore.collection("users").doc(id).set(user.toMap());
}on Exception catch (e) {
  print("the error is found $e");
}
}


getUSerFromDB()async{
  try {
   QuerySnapshot<Map<String, dynamic>> user =await firestore.collection("users").get();
  
   for (var element in user.docs ) {
     if (element['USerId']==auth.currentUser!.uid) {
       thisUser=UserModel.fromMap(element);
       print("function is called");
     }
   }

  }on Exception catch (e) {
  print("the error is found $e");
}
}
updateUser(String name,String secondname,String address, String phone,String userProfile)async{
List fullname=[name,secondname];
String newName=fullname.join(' ');
String id=auth.currentUser!.uid;
String profile='';
userprofile==''?profile=userProfile:profile=userprofile;
UserModel user=UserModel(id: id,fullname: newName, address: address, profile: profile, phone: phone);
try {
  await firestore.collection("users").doc(id).update(user.toMap());
  getUSerFromDB();
} catch (e) {
  print("the error is $e");
}
}

// DOG FUNCTIONS

addDogToDB(String name,String dob, String month,String breed,)async{
  String id=DateTime.now().microsecondsSinceEpoch.toString();
DogModel dog= DogModel( id: id,profile: dogprofile, name: name, dob: dob, month: month, breed: breed, certificate: certificate);
try {
    print("the function is called");

await firestore.collection("dogs").doc(auth.currentUser?.uid).collection('thisUsersDogs').doc(id).set(dog.toMap());
}on Exception catch (e) {
  print("the error is found $e");
}
}
List<DogModel> thisUserDogsList=[];
getDogFromDB()async{
  
  try {
  print("function is called");
   final dog =await firestore.collection("dogs").doc(auth.currentUser?.uid).collection('thisUsersDogs').get();
thisUserDogsList.clear();
for (var element in dog.docs) {
  thisUserDogsList.add(DogModel.fromMap(element));
}
  } on Exception catch (e) {
  print("the error is found $e");
}
}
deleteDogFromDB(String id)async{
  try {
    await firestore.collection("dogs").doc(auth.currentUser?.uid).collection('thisUsersDogs').doc(id).delete();
  } catch (e) {
    
  }
}

updateDog(String id, String name,String dob,String month, String breed,String dogProfile,String Certificate)async{


  String dogcertificate='';
String profile='';
certificate==''? dogcertificate=Certificate:dogcertificate=certificate;
dogprofile==''? profile=dogProfile:profile=dogprofile;
DogModel dog= DogModel( id: id,profile: profile, name: name, dob: dob, month: month, breed: breed, certificate: dogcertificate);
try {
  print('function called');
    await firestore.collection("dogs").doc(auth.currentUser?.uid).collection('thisUsersDogs').doc(id).update(dog.toMap());
  getDogFromDB();
} catch (e) {
  print("the error is $e");
}
}

// EVENT FUNCTIONS

addEventToDB(String eventName,String venue, String date)async{
  String id=DateTime.now().microsecondsSinceEpoch.toString();

EventModel event = EventModel(id: id,profile: eventpicture, eventName:eventName, venue: venue, date: date);
try {
    print("the function is called");
await firestore.collection("events").doc(auth.currentUser?.uid).collection('thisUsersEvent').doc(id).set(event.toMap());

}on Exception catch (e) {
  print("the error is found $e");
}
}


List<EventModel> thisUserEventsList=[];

getEventFromDB()async{
  
  try {
  print("function is called");
   final event =await firestore.collection("events").doc(auth.currentUser?.uid).collection('thisUsersEvent').get();
thisUserEventsList.clear();
for (var element in event.docs) {
  thisUserEventsList.add(EventModel.fromMap(element));
}
  } on Exception catch (e) {
  print("the error is found $e");
}
}

deleteEventFromDB(String id)async{
  try {
    print("function is called");
    await firestore.collection("events").doc(auth.currentUser?.uid).collection('thisUsersEvent').doc(id).delete();
  } catch (e) {
    print('error on $e');
  }
}

updateEvent(String id, String name,String venue,String date,String eventProfile)async{

String profile='';
eventpicture==''? profile=eventProfile:profile=eventpicture;
EventModel event= EventModel( id: id,profile: profile, eventName: name, venue: venue,date: date);
try {
  print('function called');
    await firestore.collection("events").doc(auth.currentUser?.uid).collection('thisUsersEvent').doc(id).update(event.toMap());
  getDogFromDB();
} catch (e) {
  print("the error is $e");
}
}

// IMAGE PICKER FUNCTIONS


Uint8List?_imgage;
var imgFile='';

  userimgPick(
    ImageSource source,
  ) async {
   
     _imgage = await pickImage(source);
     if (_imgage!=null) {
      userprofile =await upLoadImageToStorage('userprofile',_imgage!);
     }
  }

  dogimgPick(
    ImageSource source,
  ) async {
   
     _imgage = await pickImage(source);
     if (_imgage!=null) {
      dogprofile =await upLoadImageToStorage('dogprofile',_imgage!);
     }
  }

  certificateimgPick(
    ImageSource source,
  ) async {
   
     _imgage = await pickImage(source);
     if (_imgage!=null) {
      certificate =await upLoadImageToStorage('certificate',_imgage!);
     }
  }


   eventimgPick(
    ImageSource source,
  ) async {
   
     _imgage = await pickImage(source);
     if (_imgage!=null) {
      eventpicture =await upLoadImageToStorage('eventpicture',_imgage!);
     }
  }
  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      imgFile = _file.path;
     
      return await _file.readAsBytes();
    }
    
  }

  Future<String> upLoadImageToStorage(String childName, Uint8List file) async {
    var unique = DateTime.now().millisecondsSinceEpoch;
    print('the current time is $unique');
    Reference ref = _storage.ref().child(childName).child(unique.toString());
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    String downLoadUrl = await snap.ref.getDownloadURL();
    return downLoadUrl;
  }