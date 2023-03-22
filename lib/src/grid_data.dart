import 'package:collection/collection.dart';

import '../dart_grid.dart';
import 'abstract_grid.dart';

/// Implementation of [AbstractGrid]
class GridData<T, C extends AbstractCell<T>, R extends AbstractRow<T, C>>
    implements AbstractGrid<T, C, R> {
  final List<R> _rows;

  GridData({List<R>? rows}) : _rows = rows ?? List<R>.empty(growable: true);

  /// Return lenght of rows
  @override
  int get lengthRows {
    final maxIndex = _rows.map((e) => e.index).maxOrNull;
    return maxIndex == null ? 0 : maxIndex + 1;
  }

  @override
  int get lengthCells => _rows.map((e) => e.length).maxOrNull ?? 0;

  @override
  bool get isEmpty => lengthRows == 0;

  @override
  bool get isNotEmpty => lengthRows > 0 && lengthCells > 0;

  @override
  bool any(bool Function(R element) test) {
    for (R element in _rows) {
      if (test(element)) return true;
    }
    return false;
  }

  /// Return [TRUE] if data contains
  @override
  bool contains(T data) {
    return any((element) => element.cells.any((cell) => cell.data == data));
  }

  /// Return [TRUE] if data is not [NULL]
  @override
  bool hasData(int rowIndex, int cellIndex) {
    try {
      return row(rowIndex)?.hasData(cellIndex) ?? false;
    } catch (_) {
      return false;
    }
  }

  /// Return data by index
  @override
  List<T?> data(int index) {
    final list = List<T?>.empty(growable: true);

    for (C cell in row(index)?.cells ?? List<C>.empty()) {
      list.addAll(List<T?>.generate(cell.index - list.length, (index) => null));
      list.add(cell.data);
    }
    list.addAll(List<T?>.generate(lengthCells - list.length, (index) => null));
    return list;
  }

  /// Return list of datas
  @override
  List<List<T?>> get datas {
    final list = List<List<T?>>.empty(growable: true);
    for (int i = 0; i < lengthRows; i++) {
      list.add(data(i));
    }
    return list;
  }

  /// Return row by index
  @override
  R? row(int index) {
    if (index < 0) return null;
    return _rows.firstWhereOrNull((element) => element.index == index);
  }

  /// Return list of rows
  @override
  List<R> get rows {
    return List.from(_rows);
  }

  @override
  void offset(int index) {
    int i = _rows.indexWhere((element) => element.index == index);
    if (i < 0) {
      i = 0;
    }
    for (int a = _rows.length - 1; a >= i; a--) {
      removeAt(_rows[a].index + 1);
      putAt(_rows[a].index + 1, _rows[a].cells);
    }
    _rows.removeAt(i);
  }

  /// Add a row
  @override
  R add(C cell) {
    _rows.add(RowData<T, C>(index: lengthRows, cells: [cell]) as R);
    return _rows.last;
  }

  /// Add grid
  @override
  void addAll(AbstractGrid<T, C, R> grid) {
    for (var row in _rows) {
      for (var element in grid.rows) {
        if (row.index == element.index) {
          removeAt(row.index);
        }
      }
    }
    _rows.addAll(grid.rows);
    return _rows.sort();
  }

  /// Put row at position
  @override
  R putAt(int index, List<C> cells,
      {bool offset = false, bool cellOffset = false}) {
    assert(index >= 0, 'Index must be greater than or equal to 0');
    if (offset) {
      final i = _rows.indexWhere((element) => element.index == index);
      if (i >= 0) {
        this.offset(index);
        removeAt(index);
      }
    }

    if (row(index)?.isEmpty ?? true) {
      _rows.add(RowData<T, C>(index: index) as R);
    }

    for (C cell in cells) {
      if (cellOffset) {
        for (R row in rows) {
          row.offset(cell.index);
        }
      }
      row(index)?.putAt(cell.index, cell.data, offset: cellOffset);
    }

    _rows.sort();
    return row(index)!;
  }

  /// Remove data at position
  @override
  void removeAt(int index, {bool offset = false}) {
    assert(index >= 0, 'Index must be greater than or equal to 0');
    final i = _rows.indexWhere((element) => element.index == index);
    if (offset) {
      final rows = List<R>.empty(growable: true);

      for (int a = 0; a < _rows.length; a++) {
        if (i <= 0 || _rows[a].index != _rows[i].index) {
          if (i >= 0 && _rows[a].index < _rows[i].index) {
            rows.add(_rows[a]);
          } else {
            rows.add(
                RowData<T, C>(index: _rows[a].index - 1, cells: _rows[a].cells)
                    as R);
          }
        }
      }

      _rows.clear();
      _rows.addAll(rows);
    } else if (i >= 0) {
      _rows.removeAt(i);
    }
    return _rows.sort();
  }

  @override
  void clear() {
    return _rows.clear();
  }

  @override
  bool operator ==(Object other) =>
      other is GridData<T, C, R> &&
      other.lengthRows == lengthRows &&
      other.lengthCells == other.lengthCells &&
      other.rows.equals(_rows);

  @override
  String toString() {
    return datas.toString();
  }

  @override
  int get hashCode => _rows.hashCode;
}
