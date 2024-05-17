import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo or Image
              Image.asset(
                'assets/images/logo.png',
                height: 80,
              ),
              const SizedBox(height: 20),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text('Sign In'),
              ),
              const SizedBox(height: 20),
              // Sign Up Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      // Navigate to sign up screen
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
