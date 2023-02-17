import 'package:dart_grid/dart_grid.dart';

void main() {
  var grid = Grid<int>();

  grid.add().putAt(0, 1);
  grid.add(data: CellData(index: 1, data: 2));
  grid.add(data: CellData(index: 2, data: 3));
  grid.putAt(3, data: [CellData(index: 3, data: 4)]);
  grid.add().putAt(4, 5);

  grid.removeAt(2, offset: true);

  for (var i = 0; i < grid.lengthRows; i++) {
    print('Row index ${grid.rows[i].index}: ${grid.datas[i]}');
  }
}
