import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inspirze_onboarding_app/ui/screens/slides_screen.dart';

import '../../core/services/user.services.dart';
import '../shared/const_color.dart';
import '../widgets/snackBar_widget.dart';
import '../widgets/video_widget.dart';
import 'package:http/http.dart' as http;


class CryptoTechSingleLogin extends StatefulWidget {
  const CryptoTechSingleLogin({Key? key}) : super(key: key);

  @override
  _CryptoTechSingleLoginState createState() => _CryptoTechSingleLoginState();
}

class _CryptoTechSingleLoginState extends State<CryptoTechSingleLogin> {



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
      // bottomNavigationBar: GestureDetector(
      //   onTap: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => Container()));
      //   },
      //   child: Container(
      //     height: 55,
      //     decoration: BoxDecoration(
      //       color: cryptocolor3,
      //       border: Border(
      //         top: BorderSide(width: 1.0, color: Colors.white.withOpacity(0.5)),
      //       ),
      //     ),
      //     child: Center(child: Text("Create New Account", style: Theme.of(context).textTheme.subtitle1?.merge(TextStyle(color: cryptocolor1, letterSpacing: 1.65, fontWeight: FontWeight.w400)))),
      //   ),
      // ),
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

  TextEditingController firstName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

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
              hintText: 'Enter First Name',
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
            controller: firstName,
          ),
          const SizedBox(
            height: 20,
          ),
           Container(alignment: Alignment.centerLeft, child: Text("Surname", style: Theme.of(context).textTheme.subtitle1?.merge(TextStyle(color: Colors.white)))),
          TextFormField(

            // controller: edtpsw,
            // validator: (val) => val.isEmpty ? '${StringsRes.enter_password}' : null,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              hintText: 'Enter Surname',
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
              // suffixIcon: GestureDetector(
              //   onTap: () {
              //     // setState(() {
              //     //   _obscureText = !_obscureText;
              //     // });
              //   },
              //   child: Icon(
              //     _obscureText ? Icons.visibility : Icons.visibility_off,
              //     color: Colors.white,
              //   ),
              // ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(alignment: Alignment.centerLeft, child: Text("Phone Number", style: Theme.of(context).textTheme.subtitle1?.merge(TextStyle(color: Colors.white)))),

          TextFormField(
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              hintText: 'Phone Number',
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
            controller: phoneNumber,
          ),
          GestureDetector(
            onTap: () async {

              //After successful login we will redirect to profile page. Let's create profile page now

              //we can change the validation later
              if (firstName.text == "" ||
                  phoneNumber.text == "") {
                showSnackBar(
                    context: context,
                    message:
                    "Enter Your Name, Surname & phone number!!!",
                    color: Colors.red);
              } else {
                http.Response? res = await UserService()
                    .signIn(
                    firstName.text,
                    phoneNumber.text,
                    context);
                if (res == null) {
                  showSnackBar(
                      context: context,
                      message: "Error occurred!!!",
                      color: Colors.red);
                } else {
                  var results = jsonDecode(res.body);
                  //print(results);
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                             IntroSlider()));
                  }
                }
              }

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
