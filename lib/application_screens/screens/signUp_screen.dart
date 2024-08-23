import 'package:flutter/material.dart';
import 'package:login_assignment/application_screens/screens/home_screen.dart';
import 'package:login_assignment/application_session/application_session.dart';
import 'package:login_assignment/application_ui/application_ui.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ApplicationUi.screenWidth = MediaQuery.of(context).size.width;
    ApplicationUi.screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ApplicationUi.pageBgColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 30, 20, 0),
          child: Form(
            key: _formKey,
            child: Center(
              child: SizedBox(
                width: ApplicationUi.screenWidth / 1.5,
                height: ApplicationUi.screenHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      validator: (text) => text?.isEmpty ?? false
                          ? "Email cannot be empty"
                          : null,
                      decoration: _buildInputDecoration("Email"),
                    ),
                    ApplicationUi.getsmallContentGap(),
                    TextFormField(
                      controller: _nameController,
                      validator: (text) => text?.isEmpty ?? false
                          ? "Name cannot be empty"
                          : null,
                      decoration: _buildInputDecoration("Name"),
                    ),
                    ApplicationUi.getsmallContentGap(),
                    TextFormField(
                      controller: _phoneController,
                      validator: (text) => text?.isEmpty ?? false
                          ? "Phone no cannot be empty"
                          : null,
                      decoration: _buildInputDecoration("Phone no"),
                    ),
                    ApplicationUi.getsmallContentGap(),
                    TextFormField(
                      controller: _passwordController,
                      validator: (text) => text?.isEmpty ?? false
                          ? "Password cannot be empty"
                          : null,
                      decoration: _buildInputDecoration("Password"),
                    ),
                    ApplicationUi.getbigContentGap(),
                    ApplicationUi.getAppButton(context, _signup, "Sign up"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: ApplicationUi.primaryColor),
        borderRadius: BorderRadius.circular(10));
  }

  _buildErrorBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10));
  }

  _buildInputDecoration(String hint) {
    return InputDecoration(
        hintText: hint,
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
        focusedErrorBorder: _buildErrorBorder(),
        errorBorder: _buildErrorBorder());
  }

  _signup() {
    if (_formKey.currentState!.validate()) {
      ApplicationSession.userName = _nameController.value.text;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    }
  }
}
