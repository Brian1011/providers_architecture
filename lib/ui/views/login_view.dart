import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_architecture/core/viewmodels/login_model.dart';
import 'package:providers_architecture/locator.dart';

import '../../core/enums/view_state.dart';
import '../widgets/login_header.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      create: (context) => locator<LoginModel>(),
      child: Consumer<LoginModel>(
        builder: (context, model, child) => Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginHeader(
                controller: controller,
                validationMessage: model.errorMessage,
              ),
              const SizedBox(height: 50),
              model.state == ViewState.busy
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () async {
                        var loginSuccess = await model.login(controller.text);
                        if (loginSuccess) {
                          if (context.mounted) {
                            Navigator.pushNamed(context, '/');
                          }
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
