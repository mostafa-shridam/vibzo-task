import 'package:company_task/featurs/auth/presentation/views/login_with_phone.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/my_text_filed.dart';
import '../../../../gen/assets.gen.dart';
import 'widgets/general_scaffold_auth.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({super.key});
  static const routeName = '/create-password-page';

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: GeneralScaffoldAuth(
        title: 'Create your password',
        child: Column(
          spacing: 12,
          children: [
            SizedBox(height: 100),
            ValueListenableBuilder(
              valueListenable: hidePassword,
              builder: (context, value, child) {
                return MyTextField(
                  labelText: 'Your Password',
                  hintText: '******',
                  controller: passwordController,
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
            Row(
              spacing: 8,
              children: [
                Icon(Icons.info_outline),
                Text(
                  'Password must be 8 characters at least',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),

            const Spacer(),
            CustomButton(
              icon: Assets.images.svgs.loginArrow,
              text: 'Continue',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.pushNamed(LoginWithPhone.routeName);
                }
              },
              textColor: AppColors.white,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

final ValueNotifier<bool> hidePassword = ValueNotifier<bool>(true);
