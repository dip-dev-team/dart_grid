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
  int get length {
    final maxIndex = _cells.map((e) => e.index).maxOrNull;
    return maxIndex == null ? 0 : maxIndex + 1;
  }

  @override
  bool get isEmpty => length == 0;

  @override
  bool get isNotEmpty => length > 0;

  @override
  bool any(bool Function(C element) test) {
    for (C element in _cells) {
      if (test(element)) return true;
    }
    return false;
  }

  /// Return [TRUE] if data contains
  @override
  bool contains(T data) {
    return any((element) => element.data == data);
  }

  /// Return [TRUE] if data is not [NULL]
  @override
  bool hasData(int index) {
    try {
      return cell(index) != null;
    } catch (_) {
      return false;
    }
  }

  /// Return list of datas
  @override
  List<T?> get datas => cells.map((e) => e.data).toList();

  /// Return data by index
  @override
  T? data(int index) {
    return cell(index)?.data;
  }

  /// Return cell by index
  @override
  C? cell(int index) {
    if (_cells.isEmpty) return null;
    if (index < 0) return null;
    if (index >= length) return null;
    return _cells.firstWhereOrNull((element) => element.index == index);
  }

  /// Return list of cells
  @override
  List<C> get cells {
    final list = List<C>.empty(growable: true);
    for (int i = 0; i < length; i++) {
      final c = cell(i);
      if (c != null) {
        list.add(c);
      }
    }
    return list;
  }

  @override
  void offset(int index) {
    int i = _cells.indexWhere((element) => element.index == index);
    if (i < 0) {
      i = 0;
    }
    for (int a = _cells.length - 1; a >= i; a--) {
      removeAt(_cells[a].index + 1);
      putAt(_cells[a].index + 1, _cells[a].data);
    }
    _cells.removeAt(i);
  }

  /// Add a data
  @override
  void add(T data) => _cells.add(CellData(index: length, data: data) as C);

  /// Add all cells
  @override
  void addAll(AbstractRow<T, C> row) {
    for (var cell in _cells) {
      for (var element in row.cells) {
        if (cell.index == element.index) {
          removeAt(cell.index);
        }
      }
    }
    _cells.addAll(row.cells);
    return _cells.sort();
  }

  /// Add data to position
  @override
  void putAt(int index, T data, {bool offset = false}) {
    assert(index >= 0, 'Index must be greater than or equal to 0');
    if (_cells.any((element) => element.index == index)) {
      if (offset) {
        this.offset(index);
        removeAt(index);
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
    final i = _cells.indexWhere((element) => element.index == index);
    if (i >= 0) {
      if (offset) {
        for (int a = i + 1; a < _cells.length; a++) {
          putAt(_cells[a].index - 1, _cells[a].data);
        }
      }
      _cells.removeAt(i);
    }
    return _cells.sort();
  }

  @override
  void clear() {
    _cells.clear();
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

  @override
  String toString() {
    return datas.toString();
  }

  @override
  bool operator ==(Object other) =>
      other is RowData<T, C> &&
      other.index == index &&
      other.cells.equals(_cells);

  @override
  int get hashCode => [index, _cells.hashCode].hashCode;
}
