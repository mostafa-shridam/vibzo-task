import 'package:flutter/material.dart';

enum VerifyMethod { sms, whatsapp }

final ValueNotifier<VerifyMethod?> verifyMethod = ValueNotifier<VerifyMethod?>(
  null,
);

class MyCheckBox extends StatelessWidget {
  const MyCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<VerifyMethod?>(
      valueListenable: verifyMethod,
      builder: (context, selected, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _RadioItem(
              label: 'By SMS',
              value: VerifyMethod.sms,
              groupValue: selected,
              onChanged: (value) {
                verifyMethod.value = value;
              },
            ),

            const SizedBox(width: 80),

            _RadioItem(
              label: 'By WhatsApp',
              value: VerifyMethod.whatsapp,
              groupValue: selected,
              onChanged: (value) {
                verifyMethod.value = value;
              },
            ),
          ],
        );
      },
    );
  }
}

class _RadioItem extends StatelessWidget {
  const _RadioItem({
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String label;
  final VerifyMethod value;
  final VerifyMethod? groupValue;
  final ValueChanged<VerifyMethod> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          RadioGroup<VerifyMethod>(
            groupValue: groupValue,
            onChanged: (v) => onChanged(v!),
            child: Radio<VerifyMethod>(value: value),
          ),
          Text(label),
        ],
      ),
    );
  }
}
