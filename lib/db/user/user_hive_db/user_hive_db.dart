import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_dog/models/remainder_model.dart';
import 'package:hive_flutter/adapters.dart';

FirebaseAuth auth=FirebaseAuth.instance;
ValueNotifier<List<RemainderModel>>remainderNotifiList=ValueNotifier([]);
remainderAddToDB(RemainderModel remainder)async{
  print("the function is called");
  final remander_db=await Hive.openBox<RemainderModel>(auth.currentUser!.uid);
  int _id=await remander_db.add(remainder);
remainder.id=_id;
remander_db.put(_id, remainder);
print("is added to the data base is $_id");
remainderGetFromDB();
}
remainderGetFromDB()async{
final remainder_db=await Hive.openBox<RemainderModel>(auth.currentUser!.uid);
remainderNotifiList.value.clear();
remainderNotifiList.value.addAll(remainder_db.values);
remainderNotifiList.notifyListeners();
}
remainderDelete(int id)async{
  final remainder_db=await Hive.openBox<RemainderModel>(auth.currentUser!.uid);
  remainder_db.delete(id);
  remainderGetFromDB();

}
remainderEdit(RemainderModel item){
  print("the functionis called");
  final remainder_db=Hive.box<RemainderModel>(auth.currentUser!.uid);
  int key=item.id??0;
  remainder_db.put(key, item);
  remainderGetFromDB();
}