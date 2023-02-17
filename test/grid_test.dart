import 'package:dart_grid/dart_grid.dart';
import 'package:test/test.dart';

void main() {
  group('Dart Grid Testing', () {
    final grid = Grid<int>();

    setUp(() {
      grid.clear();
      grid.add().putAt(0, 1);
      grid.add(data: CellData(index: 1, data: 2));
      grid.add(data: CellData(index: 2, data: 3));
      grid.putAt(3, data: [CellData(index: 3, data: 4)]);
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

    test('Any Data Test', () {
      expect(grid.any((element) => element.index == 5), false);
    });

    test('PutAt Data Test with offset', () {
      grid.putAt(0, data: [CellData(index: 5, data: 6)], offset: true);
      expect(grid.row(0).cell(5)?.data, 6);
    });
  });
}
