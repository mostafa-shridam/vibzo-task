import 'package:company_task/featurs/auth/presentation/views/widgets/general_scaffold_auth.dart';
import 'package:company_task/featurs/auth/presentation/views/widgets/phone_text_field.dart';
import 'package:company_task/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/my_text_filed.dart';
import '../../../personalisation/presentation/personalisation .dart';
import 'create_password.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({super.key});
  static const routeName = '/login-with-phone';
  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  final _form = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: _form,
      child: GeneralScaffoldAuth(
        title: 'Log In to your account',
        child: Column(
          spacing: 12,
          children: [
            const SizedBox(height: 100),
            PhoneTextField(phoneController: _phoneController),
            ValueListenableBuilder(
              valueListenable: hidePassword,
              builder: (context, value, child) {
                return MyTextField(
                  labelText: 'Your Password',
                  hintText: '******',
                  controller: _passController,
                  obscureText: hidePassword.value,
                  suffixIcon: IconButton(
                    onPressed: () {
                      hidePassword.value = !hidePassword.value;
                    },
                    icon: Icon(
                      hidePassword.value
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8) {
                      return 'Password must be 8 characters at least';
                    }
                    return null;
                  },
                );
              },
            ),
            const Spacer(),
            ValueListenableBuilder(
              valueListenable: valueListenable,
              builder: (context, value, child) {
                return CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    'Remember Me Next Time',
                    style: theme.textTheme.bodyLarge,
                  ),
                  value: value,
                  onChanged: (v) {
                    valueListenable.value = v!;
                  },
                );
              },
            ),
            CustomButton(
              text: 'Cotinue',
              icon: Assets.images.svgs.loginArrow,
              onPressed: () {
                if (_form.currentState!.validate()) {
                  context.go(PersonalisationPage.routeName);
                }
              },
              textColor: AppColors.white,
            ),

            TextButton(
              onPressed: () {},
              child: Text(
                'Forget your password?',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.brightness == Brightness.dark
                      ? AppColors.white
                      : AppColors.black,
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

final ValueNotifier<bool> valueListenable = ValueNotifier(false);
