import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_dog/models/remainder_model.dart';
import 'package:flutter_my_dog/screens/Others/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // await NotificationService().init(); 
  AwesomeNotifications().initialize(
    null, [
    NotificationChannel(channelKey: 'instant_notification', channelName:'basic instant notification',
     channelDescription: 'notification channel triggers notification instantly',
     channelGroupKey: 'reminders',
     defaultColor: Colors.amber,
     ledColor: Colors.blue)
    ]);
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
if (!Hive.isAdapterRegistered(RemainderModelAdapter().typeId)) {
  Hive.registerAdapter(RemainderModelAdapter());
  
}
  runApp(const MyApp());
  // Hive.openBox<RemainderModel>('remainder_db');
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        cardTheme: CardTheme(color: Colors.white),
        datePickerTheme: DatePickerThemeData(backgroundColor: Colors.white ),
        timePickerTheme: TimePickerThemeData(backgroundColor: Colors.white,
        dayPeriodColor:const Color.fromARGB(255, 221, 60, 60),
        dialBackgroundColor: Colors.amber,
          hourMinuteColor: Color.fromARGB(255, 255, 255, 255),
          hourMinuteTextColor: Colors.black,
            ),
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const splashscreen(),
    );
  }
}


