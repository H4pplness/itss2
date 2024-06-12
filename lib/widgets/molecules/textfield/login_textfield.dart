import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itss2/apis/login/login.dart';
import 'package:itss2/screens/home_screen/home_screen.dart';
import 'package:itss2/screens/signup_screen/signup_screen.dart';
import '../../atoms/buttons/primarybutton.dart';
import '../../atoms/checkboxs/checkbox.dart';
import '../../atoms/text_fields/email_textfield.dart';
import '../../atoms/text_fields/pass_textfield.dart';
import 'notifier/eye_password_notifier.dart';

class LoginTextField extends ConsumerStatefulWidget {
  LoginTextField({Key? key}) : super(key: key);

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends ConsumerState<LoginTextField> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool status = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final seePassword = ref.watch(eyePasswordNotifierProvider);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello there",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 30),
              Text("Username",style: Theme.of(context).textTheme.displayMedium,),
              TextFormField(
                controller: emailController,
              ),
              const SizedBox(height: 30),
              Text("Password",style: Theme.of(context).textTheme.displayMedium,),
              TextFormField(
                controller: passController,
                validator: (String? value){
                  return (value != null && value.length <8) ? 'Password at least 8 character' : null;
                },
                obscureText: !seePassword,
                decoration: InputDecoration(
                    suffixIcon: seePassword ? GestureDetector(
                      child: const Icon(Icons.visibility),
                      onTap: ()=>ref.read(eyePasswordNotifierProvider.notifier).swapState(),
                    ) : GestureDetector(
                      child: const Icon(Icons.visibility_off),
                      onTap: ()=>ref.read(eyePasswordNotifierProvider.notifier).swapState(),
                    )
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  const CheckBox(),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Remember me",
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Theme.of(context).dividerColor,
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password ?",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor),
                    )),
              ),
            ],
          ),
          PrimaryButton(
            onPressed: () async {
              if(_formKey.currentState!.validate()){
                final loginFuture = ref.read(loginProvider(LoginParams(
                  username: emailController.text,
                  password: passController.text,
                )).future);

                // Set loading status
                setState(() {
                  status = true;
                });

                loginFuture.then((result) {
                  if (result) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }
                }).catchError((error) {
                  // Handle error
                  setState(() {
                    status = false;
                  });
                  // Display error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login failed: $error')),
                  );
                });
              }
            },
            width: MediaQuery.of(context).size.width - 40,
            child: Center(
              child: status
                  ? CircularProgressIndicator()
                  : Text(
                "Sign in",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          )
        ],
      ),
    );
  }
}
