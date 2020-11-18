class HttpResponse<T> {
  int statusCode = 200;
  String message = "";
  T data;

  HttpResponse({ this.statusCode, this.message, this.data });
}

extension Status on HttpResponse<dynamic> {
  bool isSuccess() {
    if (this.statusCode >= 200 && this.statusCode <= 299) {
      return true;
    } else {
      return false;
    }
  }
}