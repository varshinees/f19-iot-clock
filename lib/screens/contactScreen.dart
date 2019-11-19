
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  @override
  ContactScreenState createState() {
    return ContactScreenState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class ContactScreenState extends State<ContactScreen> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();

  final emergencyFirstNameController = TextEditingController();
  final emergencyLastNameController = TextEditingController();
  final emergencyPhoneController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    firstNameController.dispose();
    lastNameController.dispose();
    //phoneController.dispose();
    emergencyFirstNameController.dispose();
    emergencyLastNameController.dispose();
    emergencyPhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SIGN UP", 
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        )
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person_outline),
                  hintText: 'First Name',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                controller: firstNameController,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person_outline),
                  hintText: 'Last Name',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                controller: lastNameController,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person_outline),
                  hintText: 'Phone Number',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                controller: phoneController,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              child: Text(
                'Emergency Contact',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0
                )
              )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person_outline),
                  hintText: 'First Name',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                controller: emergencyFirstNameController,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person_outline),
                  hintText: 'Last Name',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                controller: emergencyLastNameController,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person_outline),
                  hintText: 'Phone Number',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                controller: emergencyPhoneController,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: ButtonTheme(
                  minWidth: 300,
                  height: 50,
                  buttonColor: Color.fromRGBO(66, 69, 148, 0.96),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false
                      // otherwise.
                      if (_formKey.currentState.validate()) {
                        Navigator.pushNamed(context, '/welcome', arguments:
                        ContactInfo(
                          firstNameController.text,
                          lastNameController.text,
                          phoneController.text,
                          emergencyFirstNameController.text,
                          emergencyLastNameController.text,
                          emergencyPhoneController.text
                          )
                        );
                      }
                    },
                    child: Text(
                      'Complete', 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}

class ContactInfo {
  final String firstName;
  final String lastName;
  final String phone;

  final String emergencyFirstName;
  final String emergencyLastName;
  final String emergencyPhone;

  ContactInfo(this.firstName, this.lastName, this.phone, this.emergencyFirstName, this.emergencyLastName, this.emergencyPhone);
}