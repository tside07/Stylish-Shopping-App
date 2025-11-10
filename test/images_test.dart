import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.backgroundBrand).existsSync(), isTrue);
    expect(File(Images.disconnect).existsSync(), isTrue);
    expect(File(Images.logoDress).existsSync(), isTrue);
    expect(File(Images.logoLockedcloud).existsSync(), isTrue);
    expect(File(Images.logoManNWoman).existsSync(), isTrue);
    expect(File(Images.map).existsSync(), isTrue);
    expect(File(Images.maskGr).existsSync(), isTrue);
    expect(File(Images.maskGroup).existsSync(), isTrue);
    expect(File(Images.maskGroup1).existsSync(), isTrue);
    expect(File(Images.phone).existsSync(), isTrue);
    expect(File(Images.whiteBackground).existsSync(), isTrue);
  });
}
