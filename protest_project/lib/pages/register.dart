import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:protest_project/components/my_button.dart';
import 'package:protest_project/components/user_textfield.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text Editing Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void registerUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        showErrorMessage("Passwords Don't Match");
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      // * Email Enumeration Protection Enabled *
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00000000),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),

                // Logo
                const Icon(
                  Icons.lock,
                  size: 75,
                ),

                const SizedBox(height: 25),

                // Greeting
                Text(
                  "Create an Account",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // Username
                UserTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // Password
                UserTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // Confirm Password
                UserTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                
                const SizedBox(height: 25),

                // Sign In
                MyButton(
                  text: "Sign Up",
                  onTap: registerUser,
                ),

                const SizedBox(height: 25),

                // Or Continue With...
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Or Continue With",
                            style: TextStyle(color: Colors.grey[700])),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // Google Sign In
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google Button
                    Image.asset(
                      './lib/images/google_light_sq_icon.png',
                      height: 70,
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login Now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
