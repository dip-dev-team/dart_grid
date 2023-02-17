import 'package:dart_grid/dart_grid.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final grid = Grid();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(grid.lenght, 0);
    });
  });
}
