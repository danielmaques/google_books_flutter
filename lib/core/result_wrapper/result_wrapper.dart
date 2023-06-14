class Result<T> {
  final T data;

  Result(this.data);

  T getSuccessData() {
    return data;
  }
}

class ResultSuccess<S> extends Result<S> {
  @override
  final S _success;

  ResultSuccess(this._success) : super(_success!);
}
