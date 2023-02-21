import 'package:dart_grid/dart_grid.dart';

void main() {
  var grid = Grid<int>();

  grid.add(CellData(index: 0, data: 1));
  grid.add(CellData(index: 1, data: 2));
  grid.add(CellData(index: 2, data: 3));
  grid.putAt(3, [CellData(index: 3, data: 4)]);
  grid.add(CellData(index: 4, data: 5));

  grid.removeAt(2, offset: true);

  for (var i = 0; i < grid.lengthRows; i++) {
    print('Row index ${grid.rows[i].index}: ${grid.datas[i]}');
  }
}
