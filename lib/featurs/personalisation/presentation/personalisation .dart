import 'package:company_task/featurs/auth/presentation/views/widgets/general_scaffold_auth.dart';
import 'package:company_task/featurs/personalisation/presentation/widgets/sec_page.dart';

import 'package:flutter/material.dart';

import 'widgets/first_page.dart';

class PersonalisationPage extends StatefulWidget {
  const PersonalisationPage({super.key});

  static const routeName = '/personalisation';

  @override
  State<PersonalisationPage> createState() => _PersonalisationPageState();
}

class _PersonalisationPageState extends State<PersonalisationPage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GeneralScaffoldAuth(
      title: 'Let’s Setup Your Profile',
      showBackButton: false,
      child: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          FirstPage(onNext: goToNextPage),
          SecPage(),
        ],
      ),
    );
  }
}
