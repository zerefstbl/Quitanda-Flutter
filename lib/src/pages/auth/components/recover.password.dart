import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/src/pages/auth/controller/auth.controller.dart';
import 'package:quitanda/src/pages/common_widgets/custom.text.field.dart';
import 'package:quitanda/src/services/validators.dart';

class RecoverPassword extends StatelessWidget {
  final String email;

  RecoverPassword({
    Key? key,
    required this.email,
  }) : super(key: key) {
    emailController.text = email;
  }

  final _formFieldKey = GlobalKey<FormFieldState>();

  final authController = Get.find<AuthController>();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                textAlign: TextAlign.center,
                'Recuperar Senha',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: const Text(
                  'Digite seu Email para recuperar a senha',
                  textAlign: TextAlign.center,
                ),
              ),
              CustomTextField(
                formFieldKey: _formFieldKey,
                icon: Icons.email,
                label: 'Email',
                controller: emailController,
                validator: emailValidator,
                type: TextInputType.emailAddress,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formFieldKey.currentState!.validate()) {
                    authController.resetPassword(emailController.text);

                    Get.back(result: true);
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Recuperar',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
