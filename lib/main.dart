import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter platform channel testing '),
    );
  }
}

// ===================== code to modify ==========================

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('samples.grassrootengineer.com');
  String result = '';
  bool showText = false;

  Future<void> _getVersionFromNative() async {
    try {
      final String data = await platform.invokeMethod('getVersion');
      result = data;
    } on PlatformException catch (e) {
      result = 'Failed to get version: ${e.message}';
    }
    showText = !showText;
    showText ? setState(() => result = result) : setState(() => result = '');
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
              result,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getVersionFromNative,
        tooltip: 'Get OS Version',
        child: Icon(Icons.change_history),
      ),
    );
  }
}
