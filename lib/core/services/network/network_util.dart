class HttpParam {
  final Map<String, dynamic> params;
  HttpParam({this.params = const {}});
  call() {
    return params;
  }
}

class HttpHeader {
  final Map<String, String> headers;
  HttpHeader(
      {this.headers = const {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      }});
  call() {
    return headers;
  }
}

class QueryParam {
  final Map<String, dynamic> params;
  QueryParam({this.params = const {}});
  call() {
    return params;
  }
}
