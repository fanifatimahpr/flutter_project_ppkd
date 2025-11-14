import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2031/View/home_screen.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/models/registermodel.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/preferences/preference_handler.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/service/api.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/views/login_day33.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SignupPageDay33 extends StatefulWidget {
  const SignupPageDay33({super.key});

  @override
  State<SignupPageDay33> createState() => _SignupPageDay33State();
}

class _SignupPageDay33State extends State<SignupPageDay33> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;
  bool isLoading = false;
  RegisterModel user = RegisterModel();
  // RegisterModel? user;


  Widget _buildTextField({
    required String hintText,
    required TextEditingController controller,
    IconData? prefixIcon,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      obscureText: isPassword ? !_showPassword : false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: Colors.white70) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
        filled: true,
        fillColor: const Color(0xff0F1A3A), // Darker field
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: const BorderSide(color: Color(0xff3A75F2), width: 2),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _showPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.white70,
                ),
                onPressed: () => setState(() => _showPassword = !_showPassword),
              )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B1229), 
      body: Stack(children: [_buildBackground(), _buildLayer(context)]),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentGeometry.topLeft,
          end: AlignmentGeometry.bottomRight,
          colors: [Color(0xff00072d),
           Color(0xff0a2472), 
          //  Color(0xff1a43bf)
           ]
          )
      ),
      width: double.infinity,
      height: double.infinity,
    );
  }

  Widget _buildLayer(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 30),

              _buildLogoHeader(title: "Sign Up"),

              height(40),

              _buildTextField(
                hintText: "Full Name",
                controller: _fullnameController,
                prefixIcon: Icons.person_outline,
                validator: (val) => val!.isEmpty ? "Name must be filled" : null,
              ),
              height(15),

              _buildTextField(
                hintText: "Phone Number",
                controller: _phoneController,
                prefixIcon: Icons.phone_outlined,
                validator: (val) =>
                    val!.isEmpty ? "Phone number must be filled" : null,
              ),
              height(15),

              _buildTextField(
                hintText: "Email",
                controller: _emailController,
                prefixIcon: Icons.email_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email must be filled";
                  }
                  if (!RegExp(
                    r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                  ).hasMatch(value)) {
                    return "Email not valid";
                  }
                  return null;
                },
              ),
              height(15),

              _buildTextField(
                hintText: "Password",
                controller: _passwordController,
                prefixIcon: Icons.lock_outline,
                isPassword: true,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Password must be filled";
                  }
                  if (val.length < 6) return "Minimum 6 characters";
                  return null;
                },
              ),

              height(40),

              _buildSignUpButton(
                text: "Sign Up",
                // onPressed: (){},
              ),

              height(40),


              Row(
                children: [
                  Expanded(
                      child: Divider(color: Colors.white24, thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Or Sign Up With",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  Expanded(
                      child: Divider(color: Colors.white24, thickness: 1)),
                ],
              ),

              height(20),

              /// Google Button (logo tetap)
              Image.asset("assets/images/google2.png", height: 40),

              height(15),

              _buildHaveAccount(
                labelText: "Already have an account?",
                buttonText: "Sign In",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SigninPageDay33()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoHeader({required String title}) {
    return Column(
      children: [
        Icon(Icons.login_outlined, size: 70, color: Colors.white,),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
  
Widget _buildSignUpButton({
  required String text,
}) {
  return Container(
    height: 56,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Color(0xff123499),
          Color(0xff1a43bf),
        ],
      ),
      borderRadius: BorderRadius.circular(26),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
          blurRadius: 15,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    child: ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          setState(() => isLoading = true);

          try {
            /// contoh format sesuai LoginButton
            final result = await AuthAPI.registerUser(
              email: _emailController.text,
              name: _fullnameController.text,
              password: _passwordController.text,
            );

            setState(() {
              isLoading = false;
              user = result;
              PreferenceHandlerDay33.saveToken(user!.data!.token!);
            });

            Fluttertoast.showToast(msg: "Sign Up Successful");

            /// contoh redirect
            Navigator.pop(context);

          } catch (e) {
            setState(() => isLoading = false);

            Fluttertoast.showToast(msg: e.toString());
          }

        } else {
          /// Jika form kosong → tampilkan dialog error
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Validation Error"),
                content: const Text("Please fill all fields"),
                actions: [
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              );
            },
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26),
        ),
      ),
      child: isLoading
          ? const SizedBox(
              height: 28,
              width: 28,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: Colors.white,
              ),
            )
          : Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
    ),
  );
}


Widget _buildHaveAccount({
  required String labelText,
  required String buttonText,
  required VoidCallback onPressed,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        labelText,
        style: const TextStyle(fontSize: 13, color: Colors.white70),
      ),
      TextButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 13,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
}
/// SizedBox Helper
SizedBox height(double h) => SizedBox(height: h);
SizedBox width(double w) => SizedBox(width: w);
