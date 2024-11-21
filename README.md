# Dart Grid

[![Pub][pub_badge]][pub]

This package allows you to work with data tables like Excel, while saving only real data (empty data is only generated).

[![BuyMeACoffee][buy_me_a_coffee_badge]][buy_me_a_coffee]

#### Check [`flutter_grid_ui`](https://pub.dev/packages/flutter_grid_ui) for UI implementation

## Getting Started

To use this package, add `dart_grid` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

```yaml
dependencies:
  dart_grid: <latest_version>
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

## Sponsoring

I'm working on my packages on my free-time, but I don't have as much time as I would. If this package or any other package I created is helping you, please consider to sponsor me so that I can take time to read the issues, fix bugs, merge pull requests and add features to these packages.

## Contributions

Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue][issue].  
If you fixed a bug or implemented a feature, please send a [pull request][pr].

<!-- Links -->
[pub_badge]: https://img.shields.io/pub/v/dart_grid.svg
[pub]: https://pub.dartlang.org/packages/dart_grid

[buy_me_a_coffee]:buymeacoffee.com/dip.dev
[buy_me_a_coffee_badge]: https://img.buymeacoffee.com/button-api/?text=Donate&emoji=&slug=dip.dev&button_colour=29b6f6&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=FFDD00

[issue]: https://github.com/dip-dev-team/dart_grid/issues
[pr]: https://github.com/dip-dev-team/dart_grid/pulls