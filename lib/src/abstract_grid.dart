/// Abstract realization of Grid
abstract class AbstractGrid<T, C extends AbstractCell<T>,
    R extends AbstractRow<T, C>> {
  int get lengthRows;
  int get lengthCells;

  bool get isNotEmpty;
  bool get isEmpty;

  bool any(bool Function(R element) test);

  bool contains(T data);
  bool hasData(int rowIndex, int cellIndex);

  List<T?> data(int index);
  List<List<T?>> get datas;

  R? row(int index);
  List<R> get rows;

  void offset(int index);

  R add(C data);
  void addAll(AbstractGrid<T, C, R> grid);
  R putAt(int index, List<C> data,
      {bool offset = false, bool cellOffset = false});
  void removeAt(int index, {bool offset = false});

  void clear();
}

/// Abstract realization of Row
abstract class AbstractRow<T, C extends AbstractCell<T>>
    implements Comparable<AbstractRow<T, C>> {
  final int index;

  int get length;

  bool get isNotEmpty;
  bool get isEmpty;

  bool any(bool Function(C element) test);

  bool contains(T data);
  bool hasData(int index);

  T? data(int index);
  List<T?> get datas;

  C? cell(int index);
  List<C> get cells;

  void offset(int index);

  void add(T data);
  void addAll(AbstractRow<T, C> row);
  void putAt(int index, T data, {bool offset = false});
  void removeAt(int index, {bool offset = false});

  void clear();

  AbstractRow({required this.index});
}

/// Abstract realization of Cell
abstract class AbstractCell<T> implements Comparable<AbstractCell<T>> {
  final int index;
  T get data;

  AbstractCell({required this.index});
}
