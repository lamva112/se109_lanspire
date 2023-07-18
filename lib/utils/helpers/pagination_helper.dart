import 'package:rxdart/rxdart.dart';

mixin PaginationHelper<T> {
  List<T?> items = [];

  BehaviorSubject<bool> get bsIsLoading;

  bool get isFirstLoad => bsIsLoading.value && items.isEmpty;

  bool get canLoadMore;

  Future<void> loadMore();

  void reset();

  int get limit => 14;

  Future<void> refresh();
}
