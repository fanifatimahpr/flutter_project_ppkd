import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/view/drawerday19.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/models/loginmodel.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/models/registermodel.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/preferences/preference_handler.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/service/api.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/views/profil_day33.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/views/register_day33.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SigninPageDay33 extends StatefulWidget {
  const SigninPageDay33({super.key});

  @override
  State<SigninPageDay33> createState() => _SigninPageDay33State();
}

class _SigninPageDay33State extends State<SigninPageDay33> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showPassword = false;
  bool _isLoading = false;
  LoginModel user =LoginModel();

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
    return Scaffold(body: Stack(children: [_buildBackground(), _buildLayer()]));
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

  SafeArea _buildLayer() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              //Logo App
              _buildLogoHeader(title: "Sign In"),
              height(45),

              //Form
              //Email
              _buildTextField(
                hintText: 'Email',
                prefixIcon: Icons.email_outlined,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email harus diisi";
                  } else if (!value.contains('@')) {
                    return "Email tidak valid";
                  } else if (!RegExp(
                    r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                  ).hasMatch(value)) {
                    return "Format Email tidak valid";
                  }
                  return null;
                },
              ),

              height(15),

              //Password
              _buildTextField(
                hintText: 'Password',
                prefixIcon: Icons.lock_outline,
                controller: _passwordController,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password harus diisi";
                  } else if (value.length < 6) {
                    return "Password minimal 6 karakter";
                  }
                  return null;
                },
              ),

              height(30),

              //Forgot Password
              _buildForgotPassword(),

              height(40),

              //Sign In Button
              _buildSigninButton(
                text: "Sign In",),

              height(40),

              //Divider
              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "Or Sign In With",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white70
                      ),
                    ),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),

              height(30),

              // Google Icon
              Center(
                child: Image.asset(
                  "assets/images/google2.png",
                  height: 40,
                  width: 40,
                ),
              ),

              height(25),

              //Dont Have Account
              _buildHaveAccount(
                labelText: "Don't have an account?",
                buttonText: "Sign Up",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupPageDay33()),
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

  Widget _buildForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
          const Text(
            "Forgot Password?",
            style: TextStyle(
              fontSize: 13,
              color: Color.fromARGB(255, 97, 97, 97),
              fontWeight: FontWeight.bold,
            ),
          ),
      ]
        );
  }

 Widget _buildSigninButton({
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
          color: Colors.black.withOpacity(0.3),
          blurRadius: 15,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    child: ElevatedButton(
      onPressed: _isLoading
          ? null
          : () async {
              if (!_formKey.currentState!.validate()) {
                _showValidationDialog();
                return;
              }

              setState(() => _isLoading = true);

              try {
                final result = await AuthAPI.loginUser(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                setState(() {
                  _isLoading = false;
                  user = result;
                });

                if (result.data?.token != null) {
                  await PreferenceHandlerDay33.saveToken(result.data!.token!);
                  await PreferenceHandlerDay33.saveLogin(true);

                  _showSuccessSnackbar(result.message ?? "Login berhasil");

                  if (!mounted) return;

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => ProfilDay33()),
                  );
                } else {
                  _showErrorSnackbar("Gagal mendapatkan token");
                }
              } catch (e) {
                _showErrorSnackbar(
                    e.toString().replaceAll("Exception: ", ""));
              } finally {
                if (mounted) {
                  setState(() => _isLoading = false);
                }
              }
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26),
        ),
      ),
      child: _isLoading
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
void _showErrorSnackbar(String message) {
  if (!mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red.shade800,
    ),
  );
}

void _showSuccessSnackbar(String message) {
  if (!mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.green.shade800,
    ),
  );
}

void _showValidationDialog() {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text("Validation Error"),
        content: const Text("Please fill all fields"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}
}

//Sized Box
SizedBox height(double h) => SizedBox(height: h);
SizedBox width(double w) => SizedBox(width: w);
