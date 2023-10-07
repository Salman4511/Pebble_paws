import 'package:cloud_firestore/cloud_firestore.dart';

class DogModel{
  String? id;
  String? profile;
  String? name;
  String? dob;
  String? month;
  String? breed;
  String? certificate;
DogModel({required this.id,required this.profile,required this.name,required this.dob,required this.month,required this.breed,required this.certificate});
factory DogModel.fromMap(DocumentSnapshot map){
return DogModel(id: map['id'],name: map['Name'], profile: map['profile'], dob: map['dob'],month:map['month'], breed: map['breed'],certificate: map['certificate']);
}
Map<String,dynamic>toMap(){
return {
  'id':id,'Name':name,"profile":profile,"dob":dob,"month":month,"breed":breed,"certificate":certificate
};
}
}