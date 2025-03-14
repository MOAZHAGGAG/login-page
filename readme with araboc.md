# **Detailed Documentation for the AuthScreen Code (Explanation in English and Arabic)**

This documentation provides a **detailed explanation** of the `AuthScreen` code in **both English and Arabic**. It is designed to help beginners understand the code and make necessary changes without modifying the code itself. Each section is explained in **English** followed by its **Arabic translation**.

---

## **Table of Contents**
1. **Overview / نظرة عامة**
2. **Imports / الاستيرادات**
3. **AuthScreen Widget / ويدجت AuthScreen**
4. **Global Variables / المتغيرات العامة**
5. **_AuthScreenState Class / فئة _AuthScreenState**
6. **Login and Signup Logic / منطق تسجيل الدخول والتسجيل**
7. **UserService Integration / تكامل UserService**
8. **Customization and Extensions / التخصيص والإضافات**
9. **Conclusion / الخلاصة**

---

## **1. Overview / نظرة عامة**

### **English**
The `AuthScreen` widget is a **user authentication screen** that allows users to either **log in** or **sign up**. It includes:
- A **login form** for existing users to log in with their phone number and password.
- A **signup form** for new users to register by providing their phone number, username, password, university, major, and year of study.
- Dropdown menus for selecting **university**, **major**, and **year**.
- Integration with a `UserService` class to handle user registration.

### **Arabic**
واجهة `AuthScreen` هي **شاشة مصادقة المستخدم** التي تسمح للمستخدمين إما **تسجيل الدخول** أو **التسجيل**. تتضمن:
- **نموذج تسجيل الدخول** للمستخدمين الحاليين لتسجيل الدخول باستخدام رقم الهاتف وكلمة المرور.
- **نموذج التسجيل** للمستخدمين الجدد للتسجيل عن طريق تقديم رقم الهاتف، اسم المستخدم، كلمة المرور، الجامعة، التخصص، وسنة الدراسة.
- قوائم منسدلة لتحديد **الجامعة**، **التخصص**، و **السنة**.
- تكامل مع فئة `UserService` للتعامل مع تسجيل المستخدم.

---

## **2. Imports / الاستيرادات**

### **English**
The code imports the following packages and files:
- `chatList.dart` and `home.dart`: For navigation (currently unused).
- `service.dart`: Contains the `UserService` class for user registration.
- `material.dart`: Flutter's material design library for UI components.

### **Arabic**
يستورد الكود الحزم والملفات التالية:
- `chatList.dart` و `home.dart`: للتنقل (غير مستخدمة حاليًا).
- `service.dart`: يحتوي على فئة `UserService` لتسجيل المستخدم.
- `material.dart`: مكتبة تصميم Material الخاصة بـ Flutter لمكونات واجهة المستخدم.

---

## **3. AuthScreen Widget / ويدجت AuthScreen**

### **English**
The `AuthScreen` widget is a **StatefulWidget**, meaning it can maintain state and update its UI dynamically. It consists of:
- A `createState` method that returns an instance of `_AuthScreenState`.
- A `_AuthScreenState` class that manages the widget's state.

### **Arabic**
واجهة `AuthScreen` هي **StatefulWidget**، مما يعني أنها يمكنها الحفاظ على الحالة وتحديث واجهة المستخدم ديناميكيًا. تتكون من:
- طريقة `createState` التي تُرجع مثيلًا من `_AuthScreenState`.
- فئة `_AuthScreenState` التي تدير حالة الويدجت.

---

## **4. Global Variables / المتغيرات العامة**

### **English**
The following lists are defined globally to store options for universities, majors, and years:
- `universities`: A list of universities.
- `majors`: A list of majors.
- `year`: A list of years.

These lists populate the dropdown menus in the signup form.

### **Arabic**
يتم تعريف القوائم التالية بشكل عام لتخزين الخيارات للجامعات، التخصصات، والسنوات:
- `universities`: قائمة بالجامعات.
- `majors`: قائمة بالتخصصات.
- `year`: قائمة بالسنوات.

هذه القوائم تُملأ القوائم المنسدلة في نموذج التسجيل.

---

## **5. _AuthScreenState Class / فئة _AuthScreenState**

### **English**
This class manages the state of the `AuthScreen` widget. It includes:
- A `GlobalKey` for form validation.
- Controllers for input fields (phone number, username, password).
- Methods to handle dropdown selections (university, major, year).
- A `build` method to construct the UI.

### **Arabic**
تدير هذه الفئة حالة واجهة `AuthScreen`. تتضمن:
- `GlobalKey` للتحقق من صحة النموذج.
- وحدات تحكم لحقول الإدخال (رقم الهاتف، اسم المستخدم، كلمة المرور).
- طرق للتعامل مع تحديدات القوائم المنسدلة (الجامعة، التخصص، السنة).
- طريقة `build` لبناء واجهة المستخدم.

---

## **6. Login and Signup Logic / منطق تسجيل الدخول والتسجيل**

### **English**
The UI toggles between login and signup forms using the `_isLogin` boolean:
- **Login Form**: Validates phone number and password.
- **Signup Form**: Collects additional details like username, university, major, and year.

### **Arabic**
تتبدل واجهة المستخدم بين نماذج تسجيل الدخول والتسجيل باستخدام المتغير `_isLogin`:
- **نموذج تسجيل الدخول**: يتحقق من صحة رقم الهاتف وكلمة المرور.
- **نموذج التسجيل**: يجمع تفاصيل إضافية مثل اسم المستخدم، الجامعة، التخصص، والسنة.

---

## **7. UserService Integration / تكامل UserService**

### **English**
The `UserService` class is used to handle user registration. It sends user data to the backend and displays a `SnackBar` if registration fails.

### **Arabic**
تُستخدم فئة `UserService` للتعامل مع تسجيل المستخدم. ترسل بيانات المستخدم إلى الخادم وتعرض `SnackBar` في حالة فشل التسجيل.

---

## **8. Customization and Extensions / التخصيص والإضافات**

### **English**
- **Add More Options**: Add more universities, majors, or years to the lists.
- **Modify Validation**: Update the `validator` functions in the `TextFormField` widgets.
- **Styling**: Customize the UI by modifying `TextStyle`, `colors`, and `padding`.

### **Arabic**
- **إضافة المزيد من الخيارات**: أضف المزيد من الجامعات، التخصصات، أو السنوات إلى القوائم.
- **تعديل التحقق**: قم بتحديث وظائف `validator` في وحدات `TextFormField`.
- **التصميم**: قم بتخصيص واجهة المستخدم عن طريق تعديل `TextStyle`، `colors`، و `padding`.

---

## **9. Conclusion / الخلاصة**

### **English**
This `AuthScreen` widget provides a robust foundation for user authentication in a Flutter app. By following this documentation, beginners can easily understand, customize, and extend the code to fit their specific requirements. Happy coding! 🚀

### **Arabic**
توفر واجهة `AuthScreen` أساسًا قويًا لمصادقة المستخدم في تطبيق Flutter. باتباع هذه الوثائق، يمكن للمبتدئين بسهولة فهم، تخصيص، وتوسيع الكود ليتناسب مع متطلباتهم الخاصة. تمنياتي بالبرمجة الممتعة! 🚀

---

If you have any questions or need further assistance, feel free to ask! / إذا كان لديك أي أسئلة أو تحتاج إلى مساعدة إضافية، فلا تتردد في السؤال!
