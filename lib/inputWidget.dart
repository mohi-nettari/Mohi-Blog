import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputWidget extends StatefulWidget {

   final Function(String) callback;

   TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final conrotller = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    conrotller.dispose();
  }

void click (){
  widget.callback(conrotller.text);
  conrotller.clear();
  FocusScope.of(context).unfocus();
}

  @override
  Widget build(BuildContext context) {
    return 
      TextField(
        controller : this.conrotller,
      decoration : InputDecoration(prefixIcon:Icon(Icons.message)
    ,labelText: "Send a message :", 
    suffixIcon : IconButton(icon : Icon(Icons.send),
    color: Colors.black,
    tooltip: "Send",
    splashColor: Colors.deepOrange,
    onPressed: this.click )  ));   

  }
}
