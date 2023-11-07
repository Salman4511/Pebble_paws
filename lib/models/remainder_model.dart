import 'package:hive_flutter/adapters.dart';
part 'remainder_model.g.dart';

@HiveType(typeId: 1)
class RemainderModel{
  @HiveField(0)
  int ?id;
  @HiveField(1)
  String ? reminder;
  @HiveField(2)
  String ? reminderType;
  @HiveField(3)
  String ? date;
  RemainderModel({ this.id,required this.reminder,required this.reminderType,required this.date});
}
