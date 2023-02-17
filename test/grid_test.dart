import 'package:dart_grid/dart_grid.dart';
import 'package:test/test.dart';

void main() {
  group('Dart Grid Testing', () {
    final grid = Grid<int>();

    setUp(() {
      grid.add().putAt(0, 1);
      grid.add().putAt(1, 2);
      grid.add().putAt(2, 3);
      grid.add().putAt(3, 4);
      grid.add().putAt(4, 5);
    });

    test('Get Data Test', () {
      expect(grid.row(2).cell(2)?.data, 3);
    });

    test('Remove Data Test', () {
      grid.removeAt(2);
      expect(grid.row(2).cell(2)?.data, null);
    });

    test('Remove Data Test with offset', () {
      grid.removeAt(2, offset: true);
      expect(grid.row(2).cell(3)?.data, 4);
    });
  });
}
