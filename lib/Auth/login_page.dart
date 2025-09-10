import 'package:bhansa_ghar/Auth/signup_page.dart';
import 'package:flutter/material.dart';

class login_page extends StatefulWidget {
   login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            padding:  EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  "assets/logo.png",
                  width: 350,
                  height: 350,
                ),
                 SizedBox(height: 40),

                // Email
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter your Email",
                    prefixIcon:  Icon(Icons.email_outlined),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide:  BorderSide(color: Colors.blue),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                 SizedBox(height: 16),

                // Password
                TextFormField(
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: "Enter your Password",
                    prefixIcon:  Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide:  BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                 SizedBox(height: 24),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: add login logic
                    },
                    style: ElevatedButton.styleFrom(
                      padding:  EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child:  Text(
                      "Login",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                 SizedBox(height: 16),

                // Signup text
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                  },
                  child:  Text("Don’t have an account? Sign up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
