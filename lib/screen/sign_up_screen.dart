import 'package:final_assignment/model/sign_up_model.dart';
import 'package:final_assignment/screen/login_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _signUp() {
    if (_formKey.currentState?.validate() ?? false) {
      String email = _emailController.text;
      String password = _passwordController.text;

      print('Sign Up successful');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(
            initialEmail: email,
            initialPassword: password,
          ),
        ),
      );
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 20,
            child: Image.asset(
              'assets/images/logo.png',
              width: 100,
              height: 100,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 150), // Space for the logo
                    const Text(
                      'Hello, Sign Up !',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(
                        labelText: 'First name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        final firstNameError = SignUpModel(
                          firstName: value ?? '',
                          lastName: '',
                          email: '',
                          password: '',
                          confirmPassword: '',
                        ).validateFirstName();
                        if (firstNameError != null) {
                          return firstNameError;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(
                        labelText: 'Last name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        final lastNameError = SignUpModel(
                          firstName: '',
                          lastName: value ?? '',
                          email: '',
                          password: '',
                          confirmPassword: '',
                        ).validateLastName();
                        if (lastNameError != null) {
                          return lastNameError;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email address',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        final emailError = SignUpModel(
                          firstName: '',
                          lastName: '',
                          email: value ?? '',
                          password: '',
                          confirmPassword: '',
                        ).validateEmail();
                        if (emailError != null) {
                          return emailError;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        final passwordError = SignUpModel(
                          firstName: '',
                          lastName: '',
                          email: '',
                          password: value ?? '',
                          confirmPassword: '',
                        ).validatePassword();
                        if (passwordError != null) {
                          return passwordError;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(
                        labelText: 'Confirm password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        final confirmPasswordError = SignUpModel(
                          firstName: '',
                          lastName: '',
                          email: '',
                          password: _passwordController.text,
                          confirmPassword: value ?? '',
                        ).validateConfirmPassword();
                        if (confirmPasswordError != null) {
                          return confirmPasswordError;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _signUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign In',
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
                            // Action
                          },
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage('assets/images/facebook.png'),
                          ),
                        ),
                        const SizedBox(width: 40),
                        GestureDetector(
                          onTap: () {
                            // Action
                          },
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage('assets/images/gmail.png'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 150),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
