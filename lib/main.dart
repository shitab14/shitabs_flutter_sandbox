import 'package:flutter/material.dart';
import 'package:shitabsfluttersandbox/myclasses/UtilClass.dart';
import 'package:speech_recognition/speech_recognition.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    UtilClass.setOrientationLandscapeLeftPortraitUp();
    UtilClass.setSystemStyle(Colors.red, Colors.redAccent, Brightness.light, Brightness.dark);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SandBox',
      theme: ThemeData(
        canvasColor: Colors.white,
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'SandBox'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  SpeechRecognition _speechRecognition;
  bool _isAvailable;
  bool _isListening;
  String resultText;

  void speechToText() {
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setAvailabilityHandler(
            (bool result) => setState(() => _isAvailable = result)
    );

    _speechRecognition.setRecognitionStartedHandler(
        () => setState(() => _isListening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
        (String speech) => setState(() => resultText = speech),
    );

    _speechRecognition.setRecognitionCompleteHandler(
          () => setState(() => _isListening = false),
    );
  }

  void _incrementCounter() {
    setState(() {
      //UtilClass.lumos(context);
     // UtilClass.showToast("Works");
      _counter++;
      UtilClass.showToast("$_counter", context);

    });
  }

  void _lumos() {
    setState(() {
      UtilClass.lumos(context);
    });
  }
  void _nox() {
    setState(() {
      UtilClass.nox(context);
    });
  }

  void _accio() {
    setState(() {
      UtilClass.accio("https://shitab14.github.io/jsons/jsonforretrofitimplementation.json");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            UtilClass.wingardiumLeviosa(
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            RaisedButton(
              onPressed: _lumos,
              child: Icon(Icons.flash_on),
            ),
            RaisedButton(
              onPressed: _nox,
              child: Icon(Icons.flash_off),
            ),
            RaisedButton(
              onPressed: _accio,
              child: Icon(Icons.add_call),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
