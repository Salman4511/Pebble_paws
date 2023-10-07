import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel{
  String? id;
  String? profile;
  String? eventName;
  String? venue;
  String? date;
  
EventModel({required this.id,required this.profile,required this.eventName,required this.venue,required this.date});
factory EventModel.fromMap(DocumentSnapshot map){
return EventModel(id: map['id'],eventName: map['eventName'], profile: map['profile'], venue: map['venue'],date:map['date']);
}
Map<String,dynamic>toMap(){
return {
     'id':id, 'eventName':eventName,"profile":profile,"venue":venue,"date":date
};
}
}