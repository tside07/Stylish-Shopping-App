import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';

void main() {
  test('icon_path assets test', () {
    expect(File(IconPath.arrowDown).existsSync(), isTrue);
    expect(File(IconPath.arrowLeft).existsSync(), isTrue);
    expect(File(IconPath.arrowUp).existsSync(), isTrue);
    expect(File(IconPath.bag).existsSync(), isTrue);
    expect(File(IconPath.bank).existsSync(), isTrue);
    expect(File(IconPath.check1).existsSync(), isTrue);
    expect(File(IconPath.check2).existsSync(), isTrue);
    expect(File(IconPath.delete).existsSync(), isTrue);
    expect(File(IconPath.edit).existsSync(), isTrue);
    expect(File(IconPath.edit1).existsSync(), isTrue);
    expect(File(IconPath.filter).existsSync(), isTrue);
    expect(File(IconPath.heart).existsSync(), isTrue);
    expect(File(IconPath.home).existsSync(), isTrue);
    expect(File(IconPath.location).existsSync(), isTrue);
    expect(File(IconPath.mastercard).existsSync(), isTrue);
    expect(File(IconPath.menu).existsSync(), isTrue);
    expect(File(IconPath.paypal).existsSync(), isTrue);
    expect(File(IconPath.plus).existsSync(), isTrue);
    expect(File(IconPath.search).existsSync(), isTrue);
    expect(File(IconPath.sort).existsSync(), isTrue);
    expect(File(IconPath.star).existsSync(), isTrue);
    expect(File(IconPath.starFilled).existsSync(), isTrue);
    expect(File(IconPath.visa).existsSync(), isTrue);
    expect(File(IconPath.voice).existsSync(), isTrue);
    expect(File(IconPath.wallet).existsSync(), isTrue);
  });
}
