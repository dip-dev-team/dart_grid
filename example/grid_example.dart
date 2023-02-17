import 'package:dart_grid/dart_grid.dart';

void main() {
  var grid = Grid<int>();
  print('Grid lenght: ${grid.lenght}');

  grid.add();
  grid.add().putAt(3, 3);
  grid.add();
  grid.add().putAt(2, 2);
  grid.add().putAt(1, 1);
  grid.add().putAt(0, 0);

  grid.removeAt(0);

  for (var row in grid.datas) {
    print('Row: $row}');
  }
}
