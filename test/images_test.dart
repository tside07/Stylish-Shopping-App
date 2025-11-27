import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(ImagePath.backgroundBrand).existsSync(), isTrue);
    expect(File(ImagePath.disconnect).existsSync(), isTrue);
    expect(File(ImagePath.logoDress).existsSync(), isTrue);
    expect(File(ImagePath.logoLockedcloud).existsSync(), isTrue);
    expect(File(ImagePath.logoManNWoman).existsSync(), isTrue);
    expect(File(ImagePath.map).existsSync(), isTrue);
    expect(File(ImagePath.maskGr).existsSync(), isTrue);
    expect(File(ImagePath.maskGroup).existsSync(), isTrue);
    expect(File(ImagePath.maskGroup1).existsSync(), isTrue);
    expect(File(ImagePath.phone).existsSync(), isTrue);
    expect(File(ImagePath.whiteBackground).existsSync(), isTrue);
  });
}
