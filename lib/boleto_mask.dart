library boleto_mask;

import 'package:flutter/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BoletoMask extends MaskTextInputFormatter {
  static String _maskFor47Chars =
      '#####.##### #####.###### #####.###### # ###############';

  static String _startsWith8 =
      '########### # ########### # ########### # ########### #';

  BoletoMask()
      : super(mask: _maskFor47Chars, filter: {
          '#': RegExp(
            r'[0-9]',
          )
        });
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final value = newValue.text;
    if (newValue.text.isEmpty)
      return super.formatEditUpdate(oldValue, newValue);

    if (value.startsWith('8')) {
      if (getMask() != _startsWith8) {
        updateMask(mask: _startsWith8);
      }
    } else if (getMask() != _maskFor47Chars) {
      updateMask(mask: _maskFor47Chars);
    }
    return super.formatEditUpdate(oldValue, newValue);
  }
}
