import "package:flutter/material.dart";

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusScopeNode _node = FocusScopeNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
          height: 800,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          padding: const EdgeInsets.all(10),
          child: FocusScope(
            node: _node,
            child: Column(
              children: <Widget>[
                TextFormField(
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => _node.nextFocus(),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => _node.nextFocus(),
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _node.nextFocus(),
                ),
              ],
            ),
          )),
    );
  }
}
