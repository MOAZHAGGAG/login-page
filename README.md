# login-page


# **Documentation for the AuthScreen Code**

This documentation provides a detailed explanation of the `AuthScreen` code, which is a Flutter widget designed to handle user authentication (login and signup). The code is structured to allow users to either log in with their phone number and password or sign up by providing additional details such as their username, university, major, and year of study. This guide is designed to help beginners understand and modify the code.

---

## **Table of Contents**
1. **Overview**
2. **Imports**
3. **AuthScreen Widget**
   - StatefulWidget Structure
   - State Management
4. **Global Variables**
   - Universities, Majors, and Years Lists
5. **_AuthScreenState Class**
   - Form Key and Validation
   - Controllers for Input Fields
   - Dropdown Selection Handlers
   - UI Components
6. **Login and Signup Logic**
   - Login Form
   - Signup Form
   - Navigation and State Management
7. **UserService Integration**
   - Registration Logic
8. **Customization and Extensions**
   - Adding More Universities, Majors, or Years
   - Modifying Validation Logic
   - Styling the UI
9. **Conclusion**

---

## **1. Overview**
The `AuthScreen` is a Flutter widget that provides a user interface for authentication. It includes:
- A **login form** for existing users to log in with their phone number and password.
- A **signup form** for new users to register by providing their phone number, username, password, university, major, and year of study.
- Dropdown menus for selecting university, major, and year.
- Integration with a `UserService` class to handle user registration.

---

## **2. Imports**
The code imports the following packages and files:
```dart
import 'package:unimate/screens/chatList.dart'; // For navigation (currently unused)
import 'package:unimate/tests/home.dart'; // For navigation (currently unused)
import '../services/service.dart'; // Contains UserService for registration
import 'package:flutter/material.dart'; // Flutter's material design library
```
- **Unused Imports**: The `chatList.dart` and `home.dart` imports are currently unused. You can remove them if not needed.
- **UserService**: This is a custom service class that handles user registration. Ensure this class is properly implemented in your project.

---

## **3. AuthScreen Widget**
The `AuthScreen` widget is a `StatefulWidget`, meaning it can maintain state and update its UI dynamically.

### **StatefulWidget Structure**
```dart
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AuthScreenState();
  }
}
```
- **Purpose**: Creates an instance of the `AuthScreen` widget.
- **`createState`**: Returns an instance of `_AuthScreenState`, which manages the widget's state.

---

## **4. Global Variables**
The following lists are defined globally to store options for universities, majors, and years:
```dart
final List<String> universities = [
  "University of Helwan",
  "American University in Cairo",
  "Ain Shams University",
  // Add more universities as needed
];

final List<String> majors = [
  "commerce",
  "law",
  "engineering",
  // Add more majors as needed
];

final List<String> year = [
  "1",
  "2",
  "3",
  "4"
  // Add more years as needed
];
```
- **Purpose**: These lists populate the dropdown menus in the signup form.
- **Customization**: Add or remove items as needed.

---

## **5. _AuthScreenState Class**
This class manages the state of the `AuthScreen` widget.

### **Form Key and Validation**
```dart
final _form = GlobalKey<FormState>();
void submit() {
  final isValid = _form.currentState!.validate();
  if (isValid) {
    _form.currentState!.save();
  }
}
```
- **`_form`**: A global key used to manage the form state.
- **`submit`**: Validates the form and saves the data if valid.

### **Controllers for Input Fields**
```dart
final TextEditingController phoneNumberController = TextEditingController();
final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
```
- **Purpose**: These controllers manage the input values for the phone number, username, and password fields.

### **Dropdown Selection Handlers**
```dart
String? selectedUniversity;
String? selectedMajor;
String? selectedyear;

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
```
- **Purpose**: These methods update the selected values for university, major, and year when the user makes a selection.

### **UI Components**
The `build` method constructs the UI using Flutter widgets like `Scaffold`, `Card`, `TextFormField`, and `DropdownButtonFormField`.

---

## **6. Login and Signup Logic**
The UI toggles between login and signup forms using the `_isLogin` boolean.

### **Login Form**
- **Fields**: Phone number and password.
- **Validation**: Ensures the phone number is not empty and the password is at least 6 characters long.
- **Button**: Triggers the `submit` method.

### **Signup Form**
- **Fields**: Phone number, username, password, university, major, and year.
- **Dropdowns**: Allow users to select from predefined lists.
- **Button**: Calls the `registerUser` method from `UserService` to register the user.

---

## **7. UserService Integration**
The `UserService` class is used to handle user registration:
```dart
UserService service = UserService();

await service.registerUser(
  phoneNumber: phoneNumberController.text,
  password: passwordController.text,
  username: usernameController.text,
  university: selectedUniversity ?? "",
  major: selectedMajor ?? "",
  year: selectedyear ?? "",
);
```
- **Purpose**: Sends user data to the backend for registration.
- **Error Handling**: Displays a `SnackBar` if registration fails.

---

## **8. Customization and Extensions**
### **Adding More Universities, Majors, or Years**
- Simply add more items to the `universities`, `majors`, or `year` lists.

### **Modifying Validation Logic**
- Update the `validator` functions in the `TextFormField` widgets to enforce custom rules.

### **Styling the UI**
- Modify the `TextStyle`, `colors`, and `padding` properties to match your app's design.

---

## **9. Conclusion**
This `AuthScreen` widget provides a robust foundation for user authentication in a Flutter app. By following this documentation, beginners can easily understand, customize, and extend the code to fit their specific requirements. Happy coding! 🚀

--- 

If you have any questions or need further assistance, feel free to ask!
