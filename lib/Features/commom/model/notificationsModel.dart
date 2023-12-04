import 'package:hive/hive.dart';
part 'notificationsModel.g.dart';



@HiveType(typeId: 0)
class NotificationsModel extends HiveObject {

  @HiveField(0)
  final String title;


  @HiveField(1)
  final String contant;


  @HiveField(2)
  final bool IsReaded;


  NotificationsModel(
      { required this.title, required this.contant, required this.IsReaded});
}