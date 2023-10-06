// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DonorsInfo extends StatelessWidget {
  final String name;
  final int age;
  final String email;
  final String address;
  final String bloodGroup;
  final String phoneNumber;
  final VoidCallback onBlockPressed;
  const DonorsInfo({
    Key? key,
    required this.name,
    required this.age,
    required this.email,
    required this.address,
    required this.bloodGroup,
    required this.phoneNumber,
    required this.onBlockPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              subtitle: Text('Age: $age years'),
              trailing: ElevatedButton(
                onPressed: onBlockPressed,
                child: Text('Block'),
              ),
            ),
          ),
          Divider(),
          Container(
            height: 40,
            child: ListTile(
              leading: Icon(Icons.email, color: Colors.red),
              title: GestureDetector(
                onTap: () async {
                  String mail = Uri.encodeComponent(email);
                  String subject = Uri.encodeComponent("Need Plasma");
                  String body = Uri.encodeComponent("Hi!");
                  Uri emailuri =
                      Uri.parse("mailto:$mail?subject=$subject&body=$body");
                  if (await launchUrl(emailuri)) {
                  } else {}
                },
                child: Text(
                  email,
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          Container(
            height: 40,
            child: ListTile(
              leading: Icon(Icons.location_on, color: Colors.green),
              title: Text(address),
            ),
          ),
          Divider(),
          Container(
            height: 40,
            child: ListTile(
              leading: Icon(Icons.favorite, color: Colors.red),
              title: Text('Blood Group: $bloodGroup'),
            ),
          ),
          Divider(),
          Container(
            height: 40,
            child: ListTile(
              leading: Icon(Icons.phone, color: Colors.blue),
              title: GestureDetector(
                onTap: () async {
                  Uri phoneno = Uri.parse('tel:+91$phoneNumber');
                  if (await launchUrl(phoneno)) {
                  } else {}
                },
                child: Text(
                  phoneNumber,
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
