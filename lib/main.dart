import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(NativeViewCommunication());

class NativeViewCommunication extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NativeViewCommunication();
  }
}

class _NativeViewCommunication extends State<NativeViewCommunication> {
  static const platform =
      const MethodChannel('example.flutter.dev/nativeViewCommunication');

  var result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result = "";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("NativeViewCommunication"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: Text(result)),
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    _getResultFromNativeView();
                  },
                  child: Text("Invoke Native View"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Get Result From Android / iOS Native Views
  Future _getResultFromNativeView() async {
    try {
      String result = await platform
          .invokeMethod('getResult', {"message": "Passed Argument"});
      _setResultValue(result);
    } on PlatformException catch (e) {
      _setResultValue('Error: $e');
    } catch (e) {
      _setResultValue('Error: $e');
    }
  }

  // Set Result Value To State
  _setResultValue(String value) {
    setState(() {
      result = value;
    });
  }
}
