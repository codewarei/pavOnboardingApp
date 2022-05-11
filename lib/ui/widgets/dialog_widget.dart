// import 'dart:convert';
//
// import 'package:cspa/core/config/constants.dart';
// import 'package:cspa/core/services/user.service.dart';
// import 'package:cspa/ui/shared/theme.helper.dart';
// import 'package:cspa/ui/views/authentication/registration.screen.dart';
// import 'package:cspa/ui/widgets/bottom.menu.dart';
// import 'package:cspa/ui/widgets/header.widget.dart';
// import 'package:cspa/ui/widgets/snackBar.widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../home.screen.dart';
// import 'forgot.password.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   UserService get service => GetIt.I<UserService>();
//
//   double _headerHeight = 250;
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final globalKey = GlobalKey<ScaffoldState>();
//
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: globalKey,
//       backgroundColor: Theme.of(context).dialogBackgroundColor,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: _headerHeight,
//               child: HeaderWidget(_headerHeight, true,
//                   Icons.login_rounded), //let's create a common header widget
//             ),
//             SafeArea(
//               child: Container(
//                   padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
//                   margin: EdgeInsets.fromLTRB(
//                       20, 10, 20, 10), // This will be the login form
//                   child: Column(
//                     children: [
//                       Text(
//                         'Login',
//                         style: TextStyle(
//                             fontSize: 60, fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         'Signin into your account',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                       SizedBox(height: 30.0),
//                       Form(
//                           key: formKey,
//                           child: Column(
//                             children: [
//                               Container(
//                                 child: TextFormField(
//                                   controller: emailController,
//                                   decoration: ThemeHelper().textInputDecoration(
//                                       'User Name', 'Enter your user name'),
//                                 ),
//                                 decoration:
//                                 ThemeHelper().inputBoxDecorationShaddow(),
//                               ),
//                               SizedBox(height: 30.0),
//                               Container(
//                                 child: TextFormField(
//                                   controller: passwordController,
//                                   obscureText: true,
//                                   decoration: ThemeHelper().textInputDecoration(
//                                       'Password', 'Enter your password'),
//                                 ),
//                                 decoration:
//                                 ThemeHelper().inputBoxDecorationShaddow(),
//                               ),
//                               SizedBox(height: 15.0),
//                               Container(
//                                 margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
//                                 alignment: Alignment.topRight,
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               ForgotPasswordPage()),
//                                     );
//                                   },
//                                   child: Text(
//                                     "Forgot your password?",
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 decoration:
//                                 ThemeHelper().buttonBoxDecoration(context),
//                                 child: ElevatedButton(
//                                     style: ThemeHelper().buttonStyle(),
//                                     child: Padding(
//                                       padding:
//                                       EdgeInsets.fromLTRB(40, 10, 40, 10),
//                                       child: Text(
//                                         'Sign In'.toUpperCase(),
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                     ),
//                                     onPressed: () async {
//                                       //After successful login we will redirect to profile page. Let's create profile page now
//
//                                       //we can change the validation later
//                                       if (emailController.text == "" ||
//                                           passwordController.text == "") {
//                                         showSnackBar(
//                                             context: context,
//                                             message:
//                                             "Enter username & password!!!",
//                                             color: Colors.red);
//                                       } else {
//                                         http.Response? res = await UserService()
//                                             .signIn(
//                                             emailController.text,
//                                             passwordController.text,
//                                             context);
//                                         if (res == null) {
//                                           showSnackBar(
//                                               context: context,
//                                               message: "Error occurred!!!",
//                                               color: Colors.red);
//                                         } else {
//                                           var results = jsonDecode(res.body);
//                                           //print(results);
//                                           if (res.statusCode != 200) {
//                                             showSnackBar(
//                                                 context: context,
//                                                 message:
//                                                 results['responseMessage'],
//                                                 color: Colors.red);
//                                           } else {
//                                             SharedPreferences pref =
//                                             await SharedPreferences
//                                                 .getInstance();
//                                             pref.setString(Constants.USER_TOKEN,
//                                                 results['results']);
//                                             Navigator.pushReplacement(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         BottomNav()));
//                                           }
//                                         }
//                                       }
//
//                                       /**if (formKey.currentState!.validate()) {
//                                           print(emailController.text);
//                                           http.Response res = await UserService()
//                                           .signIn(emailController.text,
//                                           passwordController.text);
//                                           SharedPreferences pref =
//                                           await SharedPreferences
//                                           .getInstance();
//                                           if (res.statusCode == 200) {
//                                           setState(() {
//                                           var data = jsonDecode(res.body);
//                                           var token = data['token'];
//
//                                           pref.setString('userToken', token);
//                                           Navigator.pushReplacement(
//                                           context,
//                                           MaterialPageRoute(
//                                           builder: (context) =>
//                                           HomeScreen()));
//                                           });
//                                           } else {
//                                           setState(() {
//                                           var loginMessage = json.decode(res.body);
//                                           print(loginMessage['message']);
//                                           Scaffold.of(context).showSnackBar(
//                                           SnackBar(
//                                           content: Text(loginMessage[
//                                           'message'])));
//                                           });
//                                           }
//                                           }*/
//                                     }),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
//                                 //child: Text('Don\'t have an account? Create'),
//                                 child: Text.rich(TextSpan(children: [
//                                   TextSpan(text: "Don\'t have an account? "),
//                                   TextSpan(
//                                     text: 'Create',
//                                     recognizer: TapGestureRecognizer()
//                                       ..onTap = () {
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     RegistrationPage()));
//                                       },
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: Theme.of(context).primaryColor),
//                                   ),
//                                 ])),
//                               ),
//                             ],
//                           )),
//                     ],
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
