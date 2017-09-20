import 'package:size_type/size_type.dart';
import 'package:test/test.dart';

void main() {
  group('Parse tests', () {
    setUp(() { });

    test('{} Gb', () {
      Size parsed = Size.parse("64 Gb");
      expect(parsed, new Size.fromGB(64.0));
    });

    test('{}K', () {
      Size parsed = Size.parse("64K");
      expect(parsed.Bytes, 65536);
    });
  });
}
