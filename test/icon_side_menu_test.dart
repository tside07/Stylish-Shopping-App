import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';

void main() {
  test('icon_side_menu assets test', () {
    expect(File(IconSideMenu.check).existsSync(), isTrue);
    expect(File(IconSideMenu.infoCircle).existsSync(), isTrue);
    expect(File(IconSideMenu.lock).existsSync(), isTrue);
    expect(File(IconSideMenu.logout).existsSync(), isTrue);
    expect(File(IconSideMenu.person).existsSync(), isTrue);
    expect(File(IconSideMenu.setting).existsSync(), isTrue);
    expect(File(IconSideMenu.sideMenu).existsSync(), isTrue);
    expect(File(IconSideMenu.sun).existsSync(), isTrue);
  });
}
