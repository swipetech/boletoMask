import 'package:boleto_mask/boleto_mask.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  BoletoMask boletoMask;
  setUp(() {
    boletoMask = BoletoMask();
  });
  group('BoletoMask', () {
    test('should apply mask when theres 47 caracters', () {
      final barCode = '23792.63201 40000.003935 40009.508009 1 85950000010477';
      final barCodeUnmasked = '23792632014000000393540009508009185950000010477';
      final oldValue = TextEditingValue(text: barCodeUnmasked);
      final newValue = TextEditingValue(text: barCodeUnmasked);
      boletoMask.formatEditUpdate(oldValue, newValue);
      expect(boletoMask.getMaskedText(), barCode);
    });

    test('should apply mask when theres 48 caracters', () {
      final barCode = '23792.63201 40000.003935 40009.508009 1 859500000104777';
      final barCodeUnmasked =
          '237926320140000003935400095080091859500000104777';
      final oldValue = TextEditingValue(text: barCodeUnmasked);
      final newValue = TextEditingValue(text: barCodeUnmasked);
      boletoMask.formatEditUpdate(oldValue, newValue);
      expect(boletoMask.getMaskedText(), barCode);
    });

    test('should apply mask when theres less than 47 caracters', () {
      final barCode = '23792.63201 40000.003935 40009.508009 1 859500000104';
      final barCodeUnmasked = '237926320140000003935400095080091859500000104';
      final oldValue = TextEditingValue(text: barCodeUnmasked);
      final newValue = TextEditingValue(text: barCodeUnmasked);
      boletoMask.formatEditUpdate(oldValue, newValue);
      expect(boletoMask.getMaskedText(), barCode);
    });

    test('should apply mask that treats when the barcode starts with 8', () {
      final barCode = '82630000001 3 03440010053 2 02260742001 9 11202030003 7';
      final barCodeUnmasked =
          '826300000013034400100532022607420019112020300037';
      final oldValue = TextEditingValue(text: barCodeUnmasked);
      final newValue = TextEditingValue(text: barCodeUnmasked);
      boletoMask.formatEditUpdate(oldValue, newValue);
      expect(boletoMask.getMaskedText(), barCode);
    });

    test(
        'should apply mask that treats when the barcode starts with 8 and then changes to other value',
        () {
      var barCode = '82630000001 3 03440010053 2 02260742001 9 11202030003 7';
      var barCodeUnmasked = '826300000013034400100532022607420019112020300037';
      var oldValue = TextEditingValue(text: barCodeUnmasked);
      var newValue = TextEditingValue(text: barCodeUnmasked);
      boletoMask.formatEditUpdate(oldValue, newValue);
      expect(boletoMask.getMaskedText(), barCode);

      oldValue = TextEditingValue(text: '');
      newValue = TextEditingValue(text: '');
      boletoMask.formatEditUpdate(oldValue, newValue);

      barCode = '23792.63201 40000.003935 40009.508009 1 859500000104';
      barCodeUnmasked = '237926320140000003935400095080091859500000104';
      oldValue = TextEditingValue(text: barCodeUnmasked);
      newValue = TextEditingValue(text: barCodeUnmasked);
      boletoMask.formatEditUpdate(oldValue, newValue);
      print(boletoMask.getMask());
      expect(boletoMask.getMaskedText(), barCode);
    });
  });
}
