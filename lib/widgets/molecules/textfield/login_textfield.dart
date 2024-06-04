import 'package:flutter/material.dart';
import 'package:itss2/screens/home_screen/home_screen.dart';
import 'package:itss2/screens/signup_screen/signup_screen.dart';
import '../../atoms/buttons/primarybutton.dart';
import '../../atoms/checkboxs/checkbox.dart';
import '../../atoms/text_fields/email_textfield.dart';
import '../../atoms/text_fields/pass_textfield.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({Key? key}) : super(key: key);

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  late bool status = false; // neu ma mat khau sai thi status = true
  @override
  Widget build(BuildContext context) {
    return Column(
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
            EmailTextField(
              controller: emailController,
            ),
            const SizedBox(height: 30),
            PassTextField(
              controller: passController,
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: Text(
                    "You don't have an account ?",
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          width: MediaQuery.of(context).size.width - 40,
          child: Center(
            child: Text(
              "Sign in",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        )
      ],
    );
  }
}
