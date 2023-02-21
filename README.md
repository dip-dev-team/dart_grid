Dart Grid
===============

## Dart Grid type data implementation

This package allows you to work with data tables like Excel, while saving only real data (empty data is only generated).

#### Check [`flutter_grid_ui`](https://pub.dev/packages/flutter_grid_ui) for UI implementation

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
```

#### Result

```text
Row index 0: [1, null, null, null, null]
Row index 1: [null, 2, null, null, null]
Row index 2: [null, null, null, 4, null]
Row index 3: [null, null, null, null, 5]
```