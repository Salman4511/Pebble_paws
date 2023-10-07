
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String? id;
  String? fullname;
  String? address;
  String? profile;
  String? phone;
UserModel({required this.id,required this.fullname,required this.address,required this.profile,required this.phone,});
factory UserModel.fromMap(DocumentSnapshot map){
return UserModel(id: map['USerId'],fullname: map['Full Name'], address: map['Adress'], profile: map['Profile'], phone: map['Phone']);
}
Map<String,dynamic>toMap(){
return {'USerId':id,
  'Full Name':fullname,"Adress":address,"Profile":profile,"Phone":phone
};
}
}