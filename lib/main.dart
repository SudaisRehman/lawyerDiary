import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_diary/firebase_options.dart';
import 'package:lawyer_diary/ui/auth/login_screen/login_screen_provider.dart';
import 'package:lawyer_diary/ui/auth/siginUp_provider.dart';
import 'package:provider/provider.dart';
import 'package:lawyer_diary/ui/welcome/welcomeScreen.dart';

// Import other provider classes you want to use
// import 'package:lawyer_diary/providers/user_provider.dart';
// import 'package:lawyer_diary/providers/settings_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Add your providers here
        // Example:
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        // ChangeNotifierProvider(create: (context) => SettingsProvider()),
        ChangeNotifierProvider(create: ((context) => SignupProvider()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // Your theme data
          primarySwatch: Colors.blue,
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
