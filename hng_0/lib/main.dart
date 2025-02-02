import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HNG-0',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromRGBO(153, 214, 240, 1),
              primary: Color.fromRGBO(13, 121, 216, 1)),
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(38, 155, 255, 1),
              minimumSize: const Size(double.infinity, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          )),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'HNG-0'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _launchUrl(link) async {
    final Uri url = Uri.parse(link as String);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                // debugPrint('button 1 pressed');
                _launchUrl('https://github.com/Ayo-Oni-515/stage-0-mobile');
              },
              child: Text(
                'GitHub Repo',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              )),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                // debugPrint('button 2 pressed');
                _launchUrl('http://hng.tech/hire/flutter-developers');
              },
              child: Text(
                'Hire Flutter Developer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ))
        ]),
      ),
    );
  }
}
