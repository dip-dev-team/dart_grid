import 'package:dart_grid/dart_grid.dart';

void main() {
  var grid = Grid<int>();

  grid.putAt(0).putAt(0, 0);
  grid.putAt(1).putAt(1, 1);
  grid.putAt(2).putAt(2, 2);
  grid.putAt(3).putAt(3, 3);

  grid.removeAt(2, offset: true);

  for (var i = 0; i < grid.lenght; i++) {
    print('Row ${grid.rows[i].index}: ${grid.datas[i]}}');
  }
}
