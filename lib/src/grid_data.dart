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
  int get lenght {
    final maxIndex = _rows.map((e) => e.index).maxOrNull;
    return maxIndex == null ? 0 : maxIndex + 1;
  }

  /// Return data by index
  @override
  List<T?> data(int index) {
    final list = List<T?>.from(row(index).datas, growable: true);
    list.addAll(List<T?>.generate(_maxCells - list.length, (index) => null));
    return list;
  }

  /// Return list of datas
  @override
  List<List<T?>> get datas {
    final list = List<List<T?>>.empty(growable: true);
    for (int i = 0; i < lenght; i++) {
      list.add(data(i));
    }
    return list;
  }

  /// Return row by index
  @override
  R row(int index) {
    assert(index >= 0, 'Index must be greater than or equal to 0');
    assert(lenght > index, 'IndexOf must be less than $lenght');
    return _rows.firstWhereOrNull((element) => element.index == index) ??
        RowData<T, C>(index: index) as R;
  }

  /// Return list of rows
  @override
  List<R> get rows {
    final list = List<R>.empty(growable: true);
    for (int i = 0; i < lenght; i++) {
      list.add(row(i));
    }
    return list;
  }

  /// Add a row
  @override
  R add({R? data}) {
    _rows.add(data ?? RowData<T, C>(index: lenght) as R);
    return _rows.last;
  }

  /// Add row to position
  @override
  R putAt(int index, {R? data, bool offset = false}) {
    assert(index >= 0, 'Index must be greater than or equal to 0');
    if (_rows.any((element) => element.index == index)) {
      if (offset) {
        final i = _rows.indexWhere((element) => element.index == index);
        for (int a = i; a < _rows.length; a++) {
          putAt(_rows[a].index, data: data);
        }
      } else {
        removeAt(index);
        return putAt(index, data: data);
      }
    } else {
      add();
    }
    _rows.sort();
    return row(index);
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
            final cells = List<C>.from(
                _rows[a].cells.where((element) => element != null));
            rows.add(
                RowData<T, C>(index: _rows[a].index - 1, cells: cells) as R);
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

  int get _maxCells => _rows.map((e) => e.lenght).maxOrNull ?? 0;
}
