Dart Grid
===============

Dart Grid type data implementation

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
  grid.putAt(0).putAt(0, 0);
  grid.putAt(1).putAt(1, 1);
  grid.putAt(2).putAt(2, 2);
  grid.putAt(3).putAt(3, 3);

  grid.removeAt(2, offset: true);

  for (var i = 0; i < grid.lenght; i++) {
    print('Row ${grid.rows[i].index}: ${grid.datas[i]}}');
  }
}
```

#### Result

```text
Row 0: [0, null, null, null]}
Row 1: [null, 1, null, null]}
Row 2: [null, null, null, 3]}
```