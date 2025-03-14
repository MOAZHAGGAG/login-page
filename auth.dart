// ignore_for_file: unused_import

import 'package:unimate/screens/chatList.dart';
import 'package:unimate/tests/home.dart';

import '../services/service.dart';

import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AuthScreenState();
  }
}

final List<String> universities = [
  "University of Helwan",
  "American University in Cairo",
  "Ain Shams University",
  // ... Add more universities as needed
];

final List<String> majors = [
  "commerce",
  "law",
  "engineering",
  // ... Add more universities as needed
];
final List<String> year = [
  "1",
  "2",
  "3",
  "4"
  // ... Add more universities as needed
];

class _AuthScreenState extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();
  void submit() {
    final isValid = _form.currentState!.validate();
    if (isValid) {
      _form.currentState!.save();
    }
  }

  var _isLogin = true;

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController usernameController =
      TextEditingController(); // Username controller
  final TextEditingController passwordController = TextEditingController();
  String? selectedUniversity;
  String? selectedMajor;
  String? selectedyear;
  UserService service = UserService();

  void onUniversitySelected(String? value) {
    setState(() {
      selectedUniversity = value;
    });
  }

  void onMajorSelected(String? value) {
    setState(() {
      selectedMajor = value;
    });
  }

  void onYearSelected(String? value) {
    setState(() {
      selectedyear = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 30, bottom: 20, left: 20, right: 20),
                width: 250,
                alignment: Alignment.center,
                child: Text(
                  "UniMate",
                  style: TextStyle(
                      fontSize: 50,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
              ),
              _isLogin
                  ? Card(
                      margin: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Form(
                            key: _form,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: "Phone number"),
                                  keyboardType: TextInputType.number,
                                  autocorrect: false,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return "please enter a valid phone number.";
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: "Password"),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().length < 6) {
                                      return "please enter a valid Password more than 6 characters.";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 30),
                                ElevatedButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       // builder: (context) => ChatScreen()),
                                    // );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _isLogin = !_isLogin;
                                      });
                                    },
                                    child: Text(_isLogin
                                        ? "Create an account"
                                        : "I already have an account"))
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Card(
                      margin: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Form(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  controller: phoneNumberController,
                                  decoration: const InputDecoration(
                                      labelText: "Phone number"),
                                  keyboardType: TextInputType.number,
                                  autocorrect: false,
                                ),
                                TextFormField(
                                  controller: usernameController,
                                  decoration: const InputDecoration(
                                      labelText: "Username"),
                                  keyboardType: TextInputType.name,
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  decoration: const InputDecoration(
                                      labelText: "Password"),
                                  obscureText: true,
                                ),
                                DropdownButtonFormField<String>(
                                  value:
                                      selectedUniversity, // Set the initial value here
                                  items: universities
                                      .map<DropdownMenuItem<String>>(
                                          (university) => DropdownMenuItem(
                                                value: university,
                                                child: Text(university),
                                              ))
                                      .toList(),
                                  hint: Text("Select University"),
                                  onChanged: (String? value) {
                                    onUniversitySelected(value);
                                  },
                                ),
                                DropdownButtonFormField<String>(
                                  value:
                                      selectedMajor, // Set the initial value here
                                  items: majors
                                      .map<DropdownMenuItem<String>>(
                                          (major) => DropdownMenuItem(
                                                value: major,
                                                child: Text(major),
                                              ))
                                      .toList(),
                                  hint: Text("Select major"),
                                  onChanged: (String? value) {
                                    onMajorSelected(value);
                                  },
                                ),
                                DropdownButtonFormField<String>(
                                  value:
                                      selectedyear, // Set the initial value here
                                  items: year
                                      .map<DropdownMenuItem<String>>(
                                          (year) => DropdownMenuItem(
                                                value: year,
                                                child: Text(year),
                                              ))
                                      .toList(),
                                  hint: Text("Select year"),
                                  onChanged: (String? value) {
                                    onYearSelected(value);
                                  },
                                ),
                                const SizedBox(height: 30),
                                ElevatedButton(
                                  onPressed: () async {
                                    try {
                                      await service.registerUser(
                                        phoneNumber: phoneNumberController.text,
                                        password: passwordController.text,
                                        username: usernameController.text,
                                        university: selectedUniversity ?? "",
                                        major: selectedMajor ?? "",
                                        year: selectedyear ?? "",
                                      );
                                      // Show a success message or navigate to another screen (after successful registration)
                                    } catch (error) {
                                      // Show an error message to the user (e.g., using a SnackBar)
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              "Registration failed: $error"),
                                        ),
                                      );
                                    }
                                  },
                                  // => _handleSignup(
                                  //   phoneNumberController.text,
                                  //   usernameController.text,
                                  //   passwordController.text,
                                  //   selectedUniversity!,
                                  //   selectedMajor!,
                                  //   selectedyear!,
                                  // ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer),
                                  child: Text("Signup"),
                                ),
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _isLogin = !_isLogin;
                                      });
                                    },
                                    child: Text(_isLogin
                                        ? "Create an account"
                                        : "I already have an account"))
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
