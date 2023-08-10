import 'package:fin_ease/services/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

class FinancialPage extends StatefulWidget {
  const FinancialPage({super.key});

  @override
  State<FinancialPage> createState() => _FinancialPageState();
}

class _FinancialPageState extends State<FinancialPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  int _age = 0;
  String _incomeType = 'Student';
  String _gender = 'Male';
  bool _isStudent = false;
  bool _isMarried = false;
  String _ethnicity = 'Asian';
  String _email = '';
  List<String> _genders = ['Male', 'Female', "Others"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Container(
              color: Colors.black54,
              child: Form(
                  key: _formKey,
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                                //    crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Some more info about your finances',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 228, 107, 249),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 8, top: 8),
                                    child: Text(
                                      'Your Income type',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 228, 107, 249),
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField(
                                      dropdownColor: Colors.black,
                                      decoration: InputDecoration(),
                                      value: _incomeType,
                                      items: [
                                        DropdownMenuItem(
                                          child: Text(
                                            'Businessman',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          value: 'Businessman',
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            'Commercial associate',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          value: 'Commercial associate',
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            'Maternity leave',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          value: 'Maternity leave',
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            'Pensioner',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          value: 'Pensioner',
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            'State servant',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          value: 'State servant',
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            'Student',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          value: 'Student',
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            'Unemployed',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          value: 'Unemployed',
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            'Working',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          value: 'Working',
                                        ),
                                      ],
                                      onChanged: (value) {
                                        _incomeType = value!;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Gender',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 228, 107, 249),
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RadioGroup<String>.builder(
                                      textStyle: TextStyle(color: Colors.white),
                                      groupValue: _gender,
                                      onChanged: (value) => setState(() {
                                        _gender = value!;
                                      }),
                                      items: _genders,
                                      itemBuilder: (item) => RadioButtonBuilder(
                                        item,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Are you a student?',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17),
                                        ),
                                        Checkbox(
                                          focusColor: Colors.white,
                                          value: _isStudent,
                                          onChanged: (value) {
                                            setState(() {
                                              _isStudent = value!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Are you married?',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17),
                                        ),
                                        Checkbox(
                                          value: _isMarried,
                                          onChanged: (value) {
                                            setState(() {
                                              _isMarried = value!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 8, top: 8),
                                    child: Text(
                                      'Ethinicty',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 228, 107, 249),
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField(
                                        dropdownColor: Colors.black,
                                        onChanged: (value) {},
                                        value: _ethnicity,
                                        items: [
                                          DropdownMenuItem(
                                            child: Text(
                                              'Caucasian',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            value: 'Caucasian',
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                              'Asian',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            value: 'Asian',
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                              'African American',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            value: 'African American',
                                          )
                                        ]),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                elevation: 5,
                                shadowColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Calculate Risk2',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ))))),
    );
  }
}
