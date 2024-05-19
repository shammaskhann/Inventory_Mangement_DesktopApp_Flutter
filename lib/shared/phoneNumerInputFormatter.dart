import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneNumberFormatter {
  static final MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '####-###-####',
    filter: {"#": RegExp(r'[0-9]')},
  );
}
