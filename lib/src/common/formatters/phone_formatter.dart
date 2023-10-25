import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final phoneFormatter = MaskTextInputFormatter(
  mask: '+7 (9##) ###-##-##',
  filter: {'#': RegExp('[0-9]')},
  type: MaskAutoCompletionType.lazy,
);
