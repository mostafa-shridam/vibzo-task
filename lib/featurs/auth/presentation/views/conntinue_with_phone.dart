import 'dart:developer';

import 'package:company_task/core/theme/app_colors.dart';
import 'package:company_task/core/widgets/app_loader.dart';
import 'package:company_task/featurs/auth/presentation/views/widgets/general_scaffold_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/help_functions.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../gen/assets.gen.dart';
import '../../../home/presentation/home.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'otp_page.dart';
import 'widgets/or_widget.dart';
import 'widgets/phone_text_field.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});
  static const routeName = '/phone_login';
  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: context.read<AuthBloc>(),
      listener: (context, state) {
        if (state is AuthFailure) {
          showSnackBar(message: state.message, type: SnackBarType.error);
          log('AuthFailure: ${state.message}');
        }
        if (state is AuthSuccess) {
          context.goNamed(HomePage.routeName);
        }
      },
      builder: (context, state) {
        return AppLoader(
          isLoading: state is AuthLoading,
          child: GeneralScaffoldAuth(
            title: 'Continue with Phone',
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12,
                children: [
                  const SizedBox(height: 20),

                  PhoneTextField(phoneController: _phoneController),
                  const SizedBox(height: 340),
                  CustomButton(
                    icon: Assets.images.svgs.loginArrow,
                    text: 'Continue',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.pushNamed(
                          OtpPage.routeName,
                          extra: _phoneController.text,
                        );
                      }
                    },
                    textColor: AppColors.white,
                  ),
                  const OrWidget(),

                  Text(
                    'Continue with Social Media',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      4,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: InkWell(
                          onTap: () {
                            if (index == 0) {
                              showSnackBar(
                                message: 'Apple is not available yet',
                              );
                            } else if (index == 1) {
                              context.read<AuthBloc>().add(SignInWithGoogle());
                            } else if (index == 2) {
                              showSnackBar(
                                message: 'Snapchat is not available yet',
                              );
                            } else {
                              showSnackBar(
                                message: 'Facebook is not available yet',
                              );
                            }
                          },
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: AppColors.accentColor,
                            child: SvgPicture.asset(socialMediaIcons[index]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

List<String> socialMediaIcons = [
  Assets.images.svgs.apple,
  Assets.images.svgs.google,
  Assets.images.svgs.snapchat,
  Assets.images.svgs.facebook,
];
