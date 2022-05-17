import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/services/user_services.dart';
import '../widgets/snackBar_widget.dart';
import '../widgets/video_widget.dart';
import 'animated_intro.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final globalKey = GlobalKey<ScaffoldState>();

  TextEditingController firstName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      // backgroundColor: const Color(0xFFf5f5f5),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 8),
        children:  [
           Menu(),
          // MediaQuery.of(context).size.width >= 980
          //     ? Menu()
          //     : SizedBox(), // Responsive
          Body()
        ],
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              // _menuItem(title: 'Home'),
              // _menuItem(title: 'About us'),
              // _menuItem(title: 'Contact us'),
              // _menuItem(title: 'Help'),
            ],
          ),
          Row(
            children: [
              _menuItem(title: 'Register', isActive: true),
              // _registerButton()
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem({String title = 'Title Menu', isActive = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 75),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Column(
          children: [
            Text(
              '$title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.deepPurple : Colors.grey,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            isActive
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 10,
            blurRadius: 12,
          ),
        ],
      ),
      child: const Text(
        'Register',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
   Body({Key? key}) : super(key: key);

  TextEditingController firstName = TextEditingController();

  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 960,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to PAV Connect',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'And the journey to Belong and Become',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              const SizedBox(
                height: 10,
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
              Image.asset(
                'images/logo.png',
                width: 700,
              ),
            ],
          ),
        ),

        // Image.asset(
        //   'images/logo.png',
        //   width: 300,
        // ),
        // MediaQuery.of(context).size.width >= 1300 //Responsive
        //     ? Image.asset(
        //         'images/illustration-1.png',
        //         width: 300,
        //       )
        //     : SizedBox(),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 6),
          child: Container(
            width: 320,
            child: _formLogin(context),
          ),
        )
      ],
    );
  }

  Widget _formLogin(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          const Text(
            "Please Register",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 30),
          TextFormField(
            controller: firstName,
            decoration: InputDecoration(
              hintText: 'Enter First Name',
              // counterText: 'First Name',
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: const TextStyle(fontSize: 12),
              contentPadding: const EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 30),
          TextFormField(

            decoration: InputDecoration(
              hintText: 'Enter Surname',
              // counterText: 'Surname',
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: const TextStyle(fontSize: 12),
              contentPadding: const EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 30),
          TextFormField(
            controller: phoneNumber,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Phone Number',
              counterText: 'Phone Number',
              suffixIcon: const Icon(
                Icons.visibility_off_outlined,
                color: Colors.grey,
              ),
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: const TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.deepPurple,
                  spreadRadius: 10,
                  blurRadius: 20,
                ),
              ],
            ),
            child: ElevatedButton(
              child: Container(
                  width: double.infinity,
                  height: 50,
                  child: const Center(child: Text("Sign In"))),
              onPressed: () async {
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
                          message:
                          results['responseMessage'],
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
                                  const HomeScreen()));
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
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(children: [
            Expanded(
              child: Divider(
                color: Colors.grey[300],
                height: 50,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(""),
            ),
            Expanded(
              child: Divider(
                color: Colors.grey[400],
                height: 50,
              ),
            ),
          ]),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              // _loginWithButton(image: 'images/google.png'),
              // _loginWithButton(image: 'images/github.png', isActive: true),
              // _loginWithButton(image: 'images/facebook.png'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _loginWithButton({required String image, bool isActive = false}) {
    return Container(
      width: 90,
      height: 70,
      decoration: isActive
          ? BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 10,
                  blurRadius: 30,
                )
              ],
              borderRadius: BorderRadius.circular(15),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey),
            ),
      child: Center(
          child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 15,
                  )
                ],
              )
            : const BoxDecoration(),
        child: Image.asset(
          '$image',
          width: 35,
        ),
      )),
    );
  }
}
