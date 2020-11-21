
abstract class State {}

class Loading extends State {}

class Success<T> extends State {
  final T data;

  Success(this.data);
}

class Empty extends State {}

class Error extends State {
  final int errorCode;
  final String message;

  Error(this.errorCode, this.message);
}
