import 'package:dart_grid/dart_grid.dart';
import 'package:test/test.dart';

void main() {
  group('Dart Grid Testing', () {
    final grid = Grid<int>();

    setUp(() {
      grid.clear();
      grid.add(CellData(index: 0, data: 1));
      grid.putAt(0, [CellData(index: 0, data: 2)], offset: true);
      grid.putAt(1, [CellData(index: 0, data: 3)], cellOffset: true);
      grid.putAt(0, [CellData(index: 1, data: 5)], offset: true);
      grid.putAt(0, [CellData(index: 2, data: 4)]);
    });

    test('Get Data Test', () {
      expect(grid.row(2)?.cell(0)?.data, 3);
      expect(grid.row(2)?.cell(1)?.data, 1);
      expect(grid.row(1)?.cell(1)?.data, 2);
      expect(grid.row(0)?.cell(1)?.data, 5);
      expect(grid.row(0)?.cell(2)?.data, 4);
    });

    test('Remove Data Test', () {
      grid.removeAt(1);
      expect(grid.row(1)?.cell(1)?.data, null);
    });

    test('Remove Data Test with offset', () {
      grid.removeAt(1, offset: true);
      expect(grid.row(1)?.cell(1)?.data, 1);
    });

    test('Any Data Test', () {
      expect(grid.any((element) => element.index == 2), true);
    });

    test('PutAt Data Row Test with offset', () {
      grid.putAt(2, [CellData(index: 2, data: 6)], cellOffset: true);
      expect(grid.row(2)?.cell(2)?.data, 6);
      expect(grid.row(0)?.cell(3)?.data, 4);
    });

    test('PutAt Data Cell Test', () {
      grid.putAt(1, [CellData(index: 2, data: 3)]);
      expect(grid.row(1)?.cell(1)?.data, 2);
      expect(grid.row(1)?.cell(2)?.data, 3);
    });

    test('PutAt Data Cell Test with cell offset', () {
      grid.row(2)?.putAt(2, 4, offset: true);
      expect(grid.row(2)?.cell(2)?.data, 4);
    });

    test('Has Data Test', () {
      expect(grid.hasData(2, 2), false);
      expect(grid.hasData(2, 1), true);
    });
  });
}
