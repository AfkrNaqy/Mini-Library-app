import 'package:flutter/material.dart';

class BorrowField extends StatefulWidget {
  const BorrowField({Key? key}) : super(key: key);

  @override
  State<BorrowField> createState() => _BorrowFieldState();
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Laki-Laki"), value: "Laki-Laki"),
    DropdownMenuItem(child: Text("Perempuan"), value: "Perempuan"),
  ];
  return menuItems;
}

class _BorrowFieldState extends State<BorrowField> {
  var _controllerUserName = TextEditingController();
  var _controllerPassword = TextEditingController();

  var _gender = "Laki-Laki";

  var selectedvalue = "Laki-Laki";

  DateTime _selectDate = DateTime.now();
  DateTime _selectDate2 = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 184, 234, 255),
      appBar: AppBar(
        title: Text("Borrow"),
        backgroundColor: Color.fromARGB(255, 0, 102, 128),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Text(
                  "Form User",
                  style: TextStyle(fontSize: 32),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Name",
                      labelStyle: TextStyle(),
                      // hintText: "Name",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Email",
                      labelStyle: TextStyle(),
                      // hintText: "Name",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Phone",
                      labelStyle: TextStyle(),
                      prefixIcon: Icon(Icons.phone_android),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  width: double.maxFinite,
                  child: DropdownButton(
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedvalue = newValue!;
                      });
                    },
                    items: dropdownItems,
                    value: selectedvalue,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: _selectDate.toString(),
                      prefixIcon: Icon(Icons.calendar_month_outlined),
                      suffixIcon: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(horizontal: 5)),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 0, 102, 128)),
                        ),
                        child: Text("First Date"),
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: _selectDate,
                            firstDate: DateTime(2001),
                            lastDate: DateTime(2045),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: _selectDate.toString(),
                      prefixIcon: Icon(Icons.calendar_month_outlined),
                      suffixIcon: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(horizontal: 5)),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 0, 102, 128)),
                        ),
                        child: Text("Last Date"),
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: _selectDate,
                            firstDate: DateTime(2001),
                            lastDate: DateTime(2045),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
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
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Color.fromARGB(255, 0, 102, 128)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
