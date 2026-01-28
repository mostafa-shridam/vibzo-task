import 'package:flutter/material.dart';

import '../../../../core/helper/help_functions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/my_text_filed.dart';
import 'gender.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key, required this.onNext});
  final VoidCallback onNext;
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final phoneController = TextEditingController();
  var birthController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          spacing: 12,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.accentColor,
                  radius: 48,
                  child: Text(
                    'AB',
                    style: textTheme.displayMedium?.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -12,
                  right: -12,
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    radius: 22,
                    child: Icon(Icons.add, color: AppColors.black, size: 28),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            GenderSelector(),

            MyTextField(
              controller: nameController,
              labelText: 'Your Name',
              validator: (v) {
                if (v?.isEmpty ?? false) {
                  return 'Please Add your name';
                }
                return null;
              },
            ),
            MyTextField(
              controller: idController,
              labelText: 'Your ID',
              validator: (v) {
                if (v?.isEmpty ?? false) {
                  return 'Please Add your Id';
                }
                return null;
              },
            ),
            MyTextField(
              controller: phoneController,
              labelText: 'Your Phone',
              validator: (v) {
                if (v?.isEmpty ?? false) {
                  return 'Please Add your Phone number';
                }
                return null;
              },
            ),
            MyTextField(
              onTap: () {
                selectDate(context: context).then((v) {
                  final day = v?.day.toString().padLeft(2, '0');
                  final month = v?.month.toString().padLeft(2, '0');
                  final year = v?.year.toString();
                  if (day != null && month != null && year != null) {
                    birthController.text = '$day/$month/$year';
                  }
                });
              },
              controller: birthController,
              hintText: 'DD/MM/YYYY',
              labelText: 'Your BirthDate',
              validator: (v) {
                if (v?.isEmpty ?? false) {
                  return 'Please Select your BirthDate';
                }
                return null;
              },
              readOnly: true,
            ),
            const SizedBox(height: 110),
            CustomButton(
              text: 'Continue',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (genderValue.value == null) {
                    showSnackBar(message: 'Please select your gender');
                  } else {
                    widget.onNext.call();
                  }
                }
              },
              textColor: AppColors.white,
            ),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    );
  }
}
