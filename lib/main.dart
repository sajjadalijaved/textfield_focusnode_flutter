import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  TextEditingController textEditingControllerUserName = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  String data = '';
  String mytext = '';
  late FocusNode _focusnodeUsername;
  late FocusNode _focusnodeUserPassword;
  @override
  void initState() {
    _focusnodeUsername = FocusNode();
    _focusnodeUserPassword = FocusNode();
    textEditingControllerUserName.addListener(() {
      setState(() {
        mytext = textEditingControllerUserName.text;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    textEditingControllerUserName.dispose();
    textEditingControllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 30,
            ),
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    const Spacer(
                      flex: 20,
                    ),
                    Expanded(
                        flex: 60,
                        child: TextField(
                          controller: textEditingControllerUserName,
                          textCapitalization: TextCapitalization.sentences,
                          autofocus: true,
                          focusNode: _focusnodeUsername,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 5,
                                      color: Colors.black,
                                      style: BorderStyle.solid)),
                              labelText: 'User Name',
                              hintText: 'Enter user name',
                              prefixIcon: Icon(
                                Icons.person_rounded,
                              ),
                              hoverColor: Colors.amber,
                              filled: true),
                        )),
                    const Spacer(
                      flex: 20,
                    ),
                  ],
                )),
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    const Spacer(
                      flex: 20,
                    ),
                    Expanded(
                        flex: 60,
                        child: TextField(
                          obscureText: true,
                          textCapitalization: TextCapitalization.sentences,
                          controller: textEditingControllerPassword,
                          focusNode: _focusnodeUserPassword,
                          decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.remove_red_eye_rounded),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 5,
                                      color: Colors.black,
                                      style: BorderStyle.solid)),
                              labelText: 'User Password',
                              hintText: 'Enter user password',
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                              ),
                              hoverColor: Colors.amber,
                              filled: true),
                        )),
                    const Spacer(
                      flex: 20,
                    ),
                  ],
                )),
            Text(data),
            Text(mytext),
            const Spacer(
              flex: 40,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _focusnodeUsername.requestFocus;
              _focusnodeUserPassword.skipTraversal = false;
              setState(() {
                data = textEditingControllerUserName.text;
              });
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              // _focusnodeUserPassword.requestFocus;
              // _focusnodeUserPassword.skipTraversal = false;
              setState(() {
                textEditingControllerUserName.clear();
              });
            },
            child: const Icon(Icons.clear_rounded),
            tooltip: 'clear',
          )
        ],
      ),
    );
  }
}
