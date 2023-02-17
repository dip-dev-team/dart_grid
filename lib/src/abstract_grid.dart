/// Abstract realization of Grid
abstract class AbstractGrid<T, C extends AbstractCell<T>,
    R extends AbstractRow<T, C>> {
  int get lenght;
  List<T?> data(int index);
  List<List<T?>> get datas;

  R row(int index);
  List<R> get rows;

  R add({R? data});
  R putAt(int index, {R? data, bool offset = false});
  void removeAt(int index, {bool offset = false});
}

/// Abstract realization of Row
abstract class AbstractRow<T, C extends AbstractCell<T>>
    extends Comparable<AbstractRow<T, C>> {
  final int index;

  int get lenght;
  T? data(int index);
  List<T?> get datas;

  C? cell(int index);
  List<C?> get cells;

  void add(T data);
  void putAt(int index, T data, {bool offset = false});
  void removeAt(int index, {bool offset = false});

  AbstractRow({required this.index});
}

/// Abstract realization of Cell
abstract class AbstractCell<T> extends Comparable<AbstractCell<T>> {
  final int index;
  T get data;

  AbstractCell({required this.index});
}
