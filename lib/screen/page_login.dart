import 'package:flutter/material.dart';
import 'package:app_mini_project/screen/page_category.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FieldLogin(),
    );
  }
}

class FieldLogin extends StatefulWidget {
  const FieldLogin({Key? key}) : super(key: key);

  @override
  State<FieldLogin> createState() => FieldLoginState();
}

class FieldLoginState extends State<FieldLogin> {
  // ==== VARIABLE ===
  // Duration get loginTime => Duration(milliseconds: 2250);
  var _userName = "username@gmail.com";
  var _password = "username123";
  var _controllerEmail = TextEditingController();
  var _controllerPassword = TextEditingController();
  bool _hideText = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 184, 234, 255),
      body: Container(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            // TAMBAH 2 ROW BUAT GAMBAR SAMA TEXT FIELD
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/Image_1.png',
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              SizedBox(
                height: 28,
              ),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Form(
                // key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        controller: _controllerEmail,
                        validator: (value) {
                          if (value!.isEmpty) {
                          } else {
                            print("Nice");
                          }
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 0, 102, 128),
                            border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2)),
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            suffixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        controller: _controllerPassword,
                        style: TextStyle(color: Colors.white),
                        obscureText: _hideText,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 0, 102, 128),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white),
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2)),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye_rounded,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                if (_hideText) {
                                  _hideText = false;
                                } else {
                                  _hideText = true;
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              OutlinedButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(
                      width: 2, color: Color.fromARGB(255, 0, 102, 128))),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 100, vertical: 15)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      side: BorderSide(width: 10),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(),
                    ),
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Color.fromARGB(255, 0, 102, 128)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: SizedBox(
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
