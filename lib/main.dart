import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Test'),
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
  TextEditingController textConroller = TextEditingController();
  String? errorText;
  String? textOnDisplay;

  @override
  void initState() {
    super.initState();

    textConroller.addListener(() {
      if (textConroller.text.isNotEmpty) {
        setState(() {
          errorText = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: textConroller,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.close,
                ),
                onPressed: () {
                  textConroller.clear();
                },
              ),
              errorText: errorText,
              errorStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () {
              if (textConroller.text.isEmpty) {
                setState(() {
                  errorText = 'Поле не может быть пустым';
                });
              } else {
                setState(() {
                  textOnDisplay = textConroller.text;
                  textConroller.clear();
                });
              }
            },
            child: const Text('View text'),
          ),
          Center(
            child: Text(
              textOnDisplay ?? '',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
