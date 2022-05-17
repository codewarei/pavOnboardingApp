import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:inspirze_onboarding_app/ui/admin/views/dashboard/home_view.dart';
import 'package:inspirze_onboarding_app/ui/screens/slides_screen.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constant/constants.dart';
import '../../../../core/providers/shared_pref.dart';
import '../../../../core/services/user_services.dart';
import '../../../screens/register_screen.dart';
import '../../../shared/const_color.dart';
import '../../../widgets/snackBar_widget.dart';


class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Container(
          height: double.maxFinite,
          decoration: gradient_box,
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: MyCustomForm(),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CryptoTechSingleLogin()));
        },
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: cryptocolor3,
            border: Border(
              top: BorderSide(width: 1.0, color: Colors.white.withOpacity(0.5)),
            ),
          ),
          child: Center(child: Text("Login as Employee", style: Theme.of(context).textTheme.subtitle1?.merge(TextStyle(color: cryptocolor1, letterSpacing: 1.65, fontWeight: FontWeight.w400)))),
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final globalKey = GlobalKey<ScaffoldState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _obscureText = true;
  bool isLoading = false, isdialogloading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/logo.png',
            width: 300,
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Center(
                child: Text(
                  'Welcome to PAV Connect',
                  style:     TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.35,
                      fontWeight: FontWeight.w400,
                      fontSize: 25
                  ),
                ),
              ),
              Center(
                child: Text(
                  'And the journey to Belong and Become',
                  style:     TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.35,
                      fontWeight: FontWeight.w400,
                      fontSize: 15
                  ),
                ),
              ),
              // SizedBox(
              //   height: 30,
              // ),

              SizedBox(
                height: 40,
              ),
              // Row(
              //   children: [
              //     const Text(
              //       "You can",
              //       style: TextStyle(
              //           color: Colors.black54, fontWeight: FontWeight.bold),
              //     ),
              //     const SizedBox(width: 15),
              //     GestureDetector(
              //       onTap: () {
              //         print(MediaQuery.of(context).size.width);
              //       },
              //       child: const Text(
              //         "Register here!",
              //         style: TextStyle(
              //             color: Colors.deepPurple,
              //             fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //   ],
              // ),

            ],
          ),
          // Text("Signin to continue with your mobile number",
          //     textAlign: TextAlign.center,
          //     style: Theme.of(context).textTheme.subtitle2?.merge(
          //       TextStyle(
          //         color: Colors.white,
          //         letterSpacing: 1.35,
          //         fontWeight: FontWeight.w400,
          //       ),
          //     )),
          Container(alignment: Alignment.centerLeft, child: Text("Name", style: Theme.of(context).textTheme.subtitle1?.merge(TextStyle(color: Colors.white)))),
          TextFormField(
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              hintText: 'Enter email',
              focusedBorder: outlineborderedittext,
              disabledBorder: outlineborderedittext,
              enabledBorder: outlineborderedittext,
              errorBorder: outlineborderedittext,

              hoverColor: Colors.white,
              fillColor: Colors.white,
              focusColor: Colors.white,
              //isDense: true,
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.yellowAccent,
              ),
            ),
            // keyboardType: TextInputType.emailAddress,
            // validator: (val) => Constant.validateEmail(val),
            controller: email,
          ),
          const SizedBox(
            height: 20,
          ),

          Container(alignment: Alignment.centerLeft, child: Text("Password", style: Theme.of(context).textTheme.subtitle1?.merge(TextStyle(color: Colors.white)))),

          TextFormField(
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              hintText: 'Password',
              focusedBorder: outlineborderedittext,
              disabledBorder: outlineborderedittext,
              enabledBorder: outlineborderedittext,
              errorBorder: outlineborderedittext,

              hoverColor: Colors.white,
              fillColor: Colors.white,
              focusColor: Colors.white,
              //isDense: true,
              prefixIcon: const Icon(
                Icons.phone,
                color: Colors.yellowAccent,
              ),
            ),
            // keyboardType: TextInputType.emailAddress,
            // validator: (val) => Constant.validateEmail(val),
            controller: password,
          ),
          GestureDetector(
            onTap: () async {


                if (email.text == "" ||
                    password.text == "") {
                  showSnackBar(
                      context: context,
                      message:
                      "Enter Your email & password!!!",
                      color: Colors.red);
                } else {
                  http.Response? res = await UserService()
                      .adminLogin(
                      email.text,
                      password.text,
                      context);

                  if (res == null) {
                    showSnackBar(
                        context: context,
                        message: "Error occurred!!!",
                        color: Colors.red);
                  } else {
                    var results = jsonDecode(res.body);
                    print(results);
                    if (res.statusCode != 200) {
                      showSnackBar(
                          context: context,
                          message: 'Please contact service',

                          color: Colors.red);
                    } else {
                      // SharedPreferences pref =
                      // await SharedPreferences
                      //     .getInstance();
                      // pref.setString(Constants.USER_TOKEN,
                      //     results['results']);
                      print(results['token']);
                      await AppCache.set(Constants.USER_TOKEN, results['token']);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const HomeView()));
                    }
                  }
                }

                // if (_formKey.currentState!.validate()) {
                //   var response;
                //
                //   http.Response? res = await UserService()
                //       .signIn(email.text,
                //       password.text);
                //   SharedPreferences pref =
                //       await SharedPreferences.getInstance();
                //
                //   if (res!.statusCode == 200) {
                //     setState(() {
                //       var data = json.decode(res.body);
                //       var token = data['token'];
                //
                //       pref.setString('authorization', token);
                //       Navigator.of(context).push(
                //           MaterialPageRoute(
                //               builder: (context) =>
                //                   HomeScreen()));
                //     });
                //   } else {
                //     setState(() {
                //       var loginMessage =
                //       json.decode(res.body);
                //       print(loginMessage['message']);
                //
                //       Scaffold.of(context)
                //           .showSnackBar(SnackBar(
                //           content: Text(
                //             loginMessage['message'],
                //           )));
                //     });
                //   }
                // }
                // submit();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomeScreen()),
                // );


              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //         const HomeView()));

              //After successful login we will redirect to profile page. Let's create profile page now

              //we can change the validation later
              // if (email.text == "" ||
              //     password.text == "") {
              //   showSnackBar(
              //       context: context,
              //       message:
              //       "Enter Your Name, Surname & phone number!!!",
              //       color: Colors.red);
              // } else {
              //   http.Response? res = await UserService()
              //       .signIn(
              //       email.text,
              //       password.text,
              //       context);
              //   if (res == null) {
              //     showSnackBar(
              //         context: context,
              //         message: "Error occurred!!!",
              //         color: Colors.red);
              //   } else {
              //     var results = jsonDecode(res.body);
              //     //print(results);
              //     if (res.statusCode != 200) {
              //       showSnackBar(
              //           context: context,
              //           message: 'Please contact service',
              //
              //           color: Colors.red);
              //     } else {
              //       // SharedPreferences pref =
              //       // await SharedPreferences
              //       //     .getInstance();
              //       // pref.setString(Constants.USER_TOKEN,
              //       //     results['results']);
              //       Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) =>
              //                   const HomeView()));
              //     }
              //   }
              // }

              /**if (formKey.currentState!.validate()) {
                  print(emailController.text);
                  http.Response res = await UserService()
                  .signIn(emailController.text,
                  passwordController.text);
                  SharedPreferences pref =
                  await SharedPreferences
                  .getInstance();
                  if (res.statusCode == 200) {
                  setState(() {
                  var data = jsonDecode(res.body);
                  var token = data['token'];

                  pref.setString('userToken', token);
                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                  builder: (context) =>
                  HomeScreen()));
                  });
                  } else {
                  setState(() {
                  var loginMessage = json.decode(res.body);
                  print(loginMessage['message']);
                  Scaffold.of(context).showSnackBar(
                  SnackBar(
                  content: Text(loginMessage[
                  'message'])));
                  });
                  }
                  }*/

              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CryptoTechHome()));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.only(top: 30),
              //padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Container(

                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Text(
                  "Submit",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6?.merge(TextStyle(
                    color: cryptocolor2,
                    letterSpacing: 1.65,
                    fontWeight: FontWeight.w700,
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
