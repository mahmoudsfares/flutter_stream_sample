class MyRepo {
  Stream<int> fetchData() async* {
    yield 0;
    await Future.delayed(const Duration(seconds: 2));
    yield 1;
    await Future.delayed(const Duration(seconds: 2));
    yield 2;
    await Future.delayed(const Duration(seconds: 2));
    yield 3;
  }
}