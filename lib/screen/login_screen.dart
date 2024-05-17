import 'package:final_assignment/screen/sign_up_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Positioned Logo
          Positioned(
            top: 40,
            left: 20,
            child: Image.asset(
              'assets/images/logo.png',
              width: 100,
              height: 100,
            ),
          ),
          // Centered Column for Login Form
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Welcome Text
                  const Text(
                    'Welcome Back, Login !',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Email TextField
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter your email below:',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  // Password TextField
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Password:',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  // Sign In Button
                  ElevatedButton(
                    onPressed: () {
                      // Add sign in logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown, // Button color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                    ),
                    child: const Text('Sign In',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 20),
                  // Sign Up Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.brown),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text('or', selectionColor: Colors.grey),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //Action
                        },
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/facebook.png'),
                          // backgroundColor: Colors.transparent,
                        ),
                      ),
                      const SizedBox(width: 40), // Adjust spacing as needed
                      GestureDetector(
                        onTap: () {
                          //Action
                        },
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/gmail.png'),
                          // backgroundColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
