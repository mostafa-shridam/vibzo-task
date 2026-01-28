import 'package:company_task/core/theme/app_colors.dart';
import 'package:company_task/core/widgets/app_loader.dart';
import 'package:company_task/core/widgets/custom_button.dart';
import 'package:company_task/featurs/auth/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/help_functions.dart';
import '../../../../gen/assets.gen.dart';
import '../../../home/presentation/home.dart';
import 'conntinue_with_phone.dart';
import 'widgets/general_scaffold_auth.dart';
import 'widgets/or_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return BlocConsumer(
      bloc: context.read<AuthBloc>(),
      listener: (context, state) {
        if (state is AuthFailure) {
          showSnackBar(message: state.message, type: SnackBarType.error);
        }
        if (state is AuthSuccess) {
          context.goNamed(HomePage.routeName);
        }
      },
      builder: (context, state) {
        return AppLoader(
          isLoading: state is AuthLoading ? true : false,
          child: GeneralScaffoldAuth(
            showBackButton: false,
            child: Column(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Welcome to', style: theme.displayLarge),
                const SizedBox(height: 24),
                SvgPicture.asset(
                  Assets.images.splash.logo,
                  width: 140,
                  height: 122,
                ),
                const SizedBox(height: 24),

                CustomButton(
                  text: 'Continue with Phone',
                  onPressed: () => context.pushNamed(PhoneLogin.routeName),
                  textColor: AppColors.white,
                  icon: Assets.images.svgs.smartPhone,
                ),
                const OrWidget(),

                CustomButton(
                  text: 'Continue with Apple',
                  onPressed: () {
                    showSnackBar(message: 'Apple is not available yet');
                  },
                  backgroundColor: AppColors.accentColor,
                  icon: Assets.images.svgs.apple,
                ),
                CustomButton(
                  text: 'Continue with Google',
                  onPressed: () {
                    context.read<AuthBloc>().add(SignInWithGoogle());
                  },
                  backgroundColor: AppColors.accentColor,
                  icon: Assets.images.svgs.google,
                ),
                CustomButton(
                  text: 'Continue with Snapchat',
                  onPressed: () {
                    showSnackBar(message: 'Snapchat is not available yet');
                  },
                  backgroundColor: AppColors.accentColor,
                  icon: Assets.images.svgs.snapchat,
                ),
                CustomButton(
                  text: 'Continue with Facebook',
                  onPressed: () {
                    showSnackBar(message: 'Facebook is not available yet');
                  },
                  backgroundColor: AppColors.accentColor,
                  icon: Assets.images.svgs.facebook,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
