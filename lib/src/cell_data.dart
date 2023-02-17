import 'abstract_grid.dart';

/// Implementation of [AbstractCell]
class CellData<T> implements AbstractCell<T> {
  @override
  final int index;
  final T _data;

  @override
  T get data => _data;

  const CellData({required this.index, required T data}) : _data = data;

  @override
  int compareTo(AbstractCell<T> other) {
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
    return _data?.toString() ?? 'null';
  }
}
