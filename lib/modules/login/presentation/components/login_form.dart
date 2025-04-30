import 'package:flutter/material.dart';
import 'package:gs3_app/main.dart';
import 'package:gs3_app/modules/home/routes/home_routes.dart';

import '../../../../design_system/ds.dart';
import '../../vm/login_viewmodel.dart';
import 'login_button_animated.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final LoginViewModel vm = inject<LoginViewModel>();

  final TextEditingController cpfController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool obscureText = true;

  @override
  void initState() {
    cpfController.addListener(() {
      if (_formKey.currentState!.validate()) {
        vm.setEnabled(true);
      } else {
        vm.setEnabled(false);
      }
    });

    passwordController.addListener(() {
      if (_formKey.currentState!.validate()) {
        vm.setEnabled(true);
      } else {
        vm.setEnabled(false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppTypography(
              title: 'Seja bem-vindo(a)!',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            const AppTypography(
              title: 'Digite sua senha do aplicativo.',
              fontSize: 16,
            ),
            AppInput(
              hintText: 'CPF',
              controller: cpfController,
              validator: (dynamic value) {
                value = value as String?;

                if (value != null && value.isEmpty) {
                  return 'Preencha o campo!';
                }

                return null;
              },
            ),
            AppInput(
              hintText: 'Senha',
              obscureText: obscureText,
              controller: passwordController,
              validator: (dynamic value) {
                value = value as String?;

                if (value != null && value.isEmpty) {
                  return 'Preencha o campo!';
                }

                return null;
              },
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.remove_red_eye_outlined,
                  color: Colors.black54,
                ),
                onPressed: () => setState(() => obscureText = !obscureText),
              ),
            ),
            StreamBuilder<bool>(
              stream: vm.loading,
              builder: (context, snapshot) {
                final bool isLoading = snapshot.data ?? false;

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  child: StreamBuilder<bool>(
                    stream: vm.enabled,
                    builder: (context, snapshot) {
                      final bool isEnabled = snapshot.data ?? false;

                      return LoginButtonAnimated(
                        title: 'Confirmar',
                        loading: isLoading,
                        enabled: isEnabled,
                        onTap: () async {
                          final bool isValid =
                              _formKey.currentState!.validate();

                          if (isValid) {
                            final String cpf = cpfController.text;
                            final String password = passwordController.text;

                            final bool canAccess = await vm.makeLogin(
                              cpf: cpf,
                              password: password,
                            );

                            if (canAccess) {
                              router.navigateTo(
                                context,
                                HomeRoutesPath.home.path,
                                clearStack: true,
                              );
                            }
                          }
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
