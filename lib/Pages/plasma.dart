import 'dart:convert';
import 'package:covid_19/Pages/HomePage.dart';
import 'package:covid_19/Services/Utilities/appUrls.dart';
import 'package:covid_19/Services/Utilities/message.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Plasma extends StatefulWidget {
  @override
  _PlasmaState createState() => _PlasmaState();
}

class _PlasmaState extends State<Plasma> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  int age = 0;
  String bloodGroup = '';
  String address = '';
  String email = '';
  String phoneNumber = '';

  Future<void> addDonor() async {
    final url = Uri.parse(AppUrl.addDonor);
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': name,
          'email': email,
          'age': age,
          'bloodGroup': bloodGroup,
          'address': address,
          'phoneNumber': phoneNumber
        }),
      );
      if (response.statusCode == 201) {
        final responseBody = json.decode(response.body);
        final message = responseBody['message'];
        showSnackBar(context, message);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        showSnackBar(context, 'Failed to register!!!');
      }
    } catch (error) {
      showSnackBar(context, 'Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
        title: Text('Plasma Donor Registration'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Fill out the form below to register as a plasma donor.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 24.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // Rounded edges
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    name = value!;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // Rounded edges
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    age = int.parse(value!);
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Blood Group',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // Rounded edges
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your blood group';
                    }
                    // Add your custom validation logic for blood groups here
                    if (!_isValidBloodGroup(value)) {
                      return 'Invalid blood group';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    bloodGroup = value!;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // Rounded edges
                    ),
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    address = value!;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // Rounded edges
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value!;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // Rounded edges
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (!RegExp(r"^\d{10}$").hasMatch(value)) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    phoneNumber = value!;
                  },
                ),
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      addDonor();
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // Rounded edges
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isValidBloodGroup(String bloodGroup) {
    List<String> validBloodGroups = [
      'A+',
      'A-',
      'B+',
      'B-',
      'AB+',
      'AB-',
      'O+',
      'O-'
    ];
    return validBloodGroups.contains(bloodGroup.toUpperCase());
  }
}
