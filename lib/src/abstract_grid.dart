/// Abstract realization of Grid
abstract class AbstractGrid<T, C extends AbstractCell<T>,
    R extends AbstractRow<T, C>> {
  int get lengthRows;
  int get lengthCells;

  bool get isNotEmpty;
  bool get isEmpty;

  bool any(bool Function(R element) test);

  List<T?> data(int index);
  List<List<T?>> get datas;

  R row(int index);
  List<R> get rows;

  R add({C? data});
  R putAt(int index, {List<C>? data, bool offset = false});
  void removeAt(int index, {bool offset = false});

  void clear();
}

/// Abstract realization of Row
abstract class AbstractRow<T, C extends AbstractCell<T>>
    extends Comparable<AbstractRow<T, C>> {
  final int index;

  int get length;

  bool get isNotEmpty;
  bool get isEmpty;

  bool any(bool Function(C element) test);

  T? data(int index);
  List<T?> get datas;

  C? cell(int index);
  List<C> get cells;

  void add(T data);
  void putAt(int index, T data, {bool offset = false});
  void removeAt(int index, {bool offset = false});

  void clear();

  AbstractRow({required this.index});
}

/// Abstract realization of Cell
abstract class AbstractCell<T> extends Comparable<AbstractCell<T>> {
  final int index;
  T get data;

  AbstractCell({required this.index});
}
