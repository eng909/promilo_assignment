import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:promilo_assignment/second_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Added GlobalKey for form validation

  bool _loading = false; // Added to show loading indicator during login

  void login(String email, password) async {
    setState(() {
      _loading = true; // Show loading indicator
    });
    try {
      Response response = await post(Uri.parse('https://reqres.in/api/login'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print('account created successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        _loading = false; // Hide loading indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promilo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: _loading
            ? Center(child: CircularProgressIndicator()) // Show loading indicator
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Set form key
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const Center(
                  child: const Text(
                    'Hi, Welcome Back!',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please Sign in to Continue',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter Email or Mob No',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Sign With OTP',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: false, // Set initial value accordingly
                      onChanged: (bool? value) {
                        // Handle checkbox state change
                      },
                    ),
                    Text('Remember Me'),
                    const Spacer(),
                    Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      login(_emailController.text.toString(),
                          _passwordController.text.toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondScreen()),
                      );
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Submit',
                        style:
                        TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Expanded(child: Divider(color: Colors.grey)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('or'),
                    ),
                    Expanded(child: Divider(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/facebook.svg",
                      width: 50,
                      height: 40,
                    ),
                    SvgPicture.asset(
                      "assets/instagram-logo.svg",
                      width: 50,
                      height: 50,
                    ),
                    SvgPicture.asset(
                      "assets/twitter.svg",
                      width: 50,
                      height: 40,
                    ),
                    SvgPicture.asset(
                      "assets/whatsapp-logo.svg",
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Business User?'),
                    const Spacer(),
                    const Text('Don\'t have an account'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Handle login navigation
                      },
                      child: const Text(
                        'Login Here',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        // Handle sign up navigation
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "By Continuing, you agree to Promilo's Term Use & Privacy Policy ",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
