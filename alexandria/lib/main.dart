import 'package:alexandria/providers/search_bar_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:alexandria/components/pages/select-database-page/select_database_page.dart';
import 'package:alexandria/providers/songs_provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SongsProvider()),
        ChangeNotifierProvider(create: (_) => SearchBarProvider()),
      ],
      child: const Alexandria(),
    ),
  );
}

class Alexandria extends StatefulWidget {
  const Alexandria({super.key});

  @override
  State<Alexandria> createState() => _AlexandriaState();
}

class _AlexandriaState extends State<Alexandria> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const SelectDatabasePage(),
    );
  }
}
