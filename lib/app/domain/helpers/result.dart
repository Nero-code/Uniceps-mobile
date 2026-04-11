class Result<T, E> {
  final T data;
  final E? error;

  const Result({required this.data, required this.error});
}
