Dart Grid
===============

## Dart Grid type data implementation

This package allows you to work with data tables like Excel, while saving only real data (empty data is only generated).

## Getting Started

To use this package, add `dart_grid` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

```yaml
dependencies:
  dart_grid: any
```

## Using

```dart
import 'package:dart_grid/dart_grid.dart';
```

## Example

```dart
void main() {
  var grid = Grid<int>();

  grid.add().putAt(0, 1);
  grid.add(data: CellData(index: 1, data: 2));
  grid.add(data: CellData(index: 2, data: 3));
  grid.putAt(3, data: [CellData(index: 3, data: 4)]);
  grid.add().putAt(4, 5);

  grid.removeAt(2, offset: true);

  for (var i = 0; i < grid.lengthRows; i++) {
    print('Row ${grid.rows[i].index}: ${grid.datas[i]}');
  }
}
```

#### Result

```text
Row index 0: [1, null, null, null, null]
Row index 1: [null, 2, null, null, null]
Row index 2: [null, null, null, 4, null]
Row index 3: [null, null, null, null, 5]
```