import 'package:collection/collection.dart';

import 'abstract_grid.dart';
import 'cell_data.dart';

/// Implementation of [AbstractRow]
class RowData<T, C extends AbstractCell<T>> implements AbstractRow<T, C> {
  @override
  final int index;
  final List<C> _cells;

  RowData({required this.index, List<C>? cells})
      : _cells = cells ?? List<C>.empty(growable: true);

  /// Return lenght of cells
  @override
  int get lenght {
    final maxIndex = _cells.map((e) => e.index).maxOrNull;
    return maxIndex == null ? 0 : maxIndex + 1;
  }

  /// Return list of datas
  @override
  List<T?> get datas => cells.map((e) => e?.data).toList();

  /// Return data by index
  @override
  T? data(int index) {
    return cell(index)?.data;
  }

  /// Return cell by index
  @override
  C? cell(int index) {
    assert(index >= 0, 'Index must be greater than or equal to 0');
    assert(index < lenght, 'IndexOf must be less than $lenght');
    return _cells.firstWhereOrNull((element) => element.index == index);
  }

  /// Return list of cells
  @override
  List<C?> get cells {
    final list = List<C?>.empty(growable: true);
    for (int i = 0; i < lenght; i++) {
      list.add(cell(i));
    }
    return list;
  }

  /// Add a data
  @override
  void add(T data) => _cells.add(CellData(index: lenght, data: data) as C);

  /// Add data to position
  @override
  void putAt(int index, T data, {bool offset = false}) {
    assert(index >= 0, 'Index must be greater than or equal to 0');
    if (_cells.any((element) => element.index == index)) {
      if (offset) {
        final i = _cells.indexWhere((element) => element.index == index);
        for (int a = _cells.length - 1; a > i; a--) {
          putAt(_cells[a].index + 1, _cells[a].data);
        }
        _cells.add(CellData(index: index, data: data) as C);
      } else {
        removeAt(index);
        return putAt(index, data);
      }
    } else {
      _cells.add(CellData(index: index, data: data) as C);
    }
    return _cells.sort();
  }

  /// Remove data at position
  @override
  void removeAt(int index, {bool offset = false}) {
    assert(index >= 0, 'Index must be greater than or equal to 0');
    _cells.removeWhere((element) => element.index == index);
    return _cells.sort();
  }

  @override
  int compareTo(AbstractRow<T, C> other) {
    if (index < other.index) {
      return -1;
    } else if (index > other.index) {
      return 1;
    } else {
      return 0;
    }
  }
}
