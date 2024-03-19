part of 'dio_imports.dart';

class DioHelper {
  late Dio _dio;

  DioHelper() {
     _dio = Dio(
      BaseOptions(
        baseUrl: ApiNames.baseUrl,
        contentType: "application/json",
      ),
    )..interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          logPrint: (data) => log(data.toString()),
        ),
      );
  }

  Future<dynamic> get(
      {required String url, Map<String, dynamic>? query}) async {
    _dio.options.headers = await _getHeader();
    try {
      var response = await _dio.get(url, queryParameters: query);
      log("response ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        showErrorMessage(response);
      }
    } on DioError catch (e) {
      showErrorMessage(e.response);
    }
    return null;
  }

  showErrorMessage(Response? response) {
    if (response!.data == null) {
      showSnackBar("error happened", backgroundColor: Colors.redAccent);
    } else {
      log("failed response ${response.statusCode}");
      log("failed response ${response.data}");

      var data = response.data;

      if (data is String) {
        showSnackBar(data);
      } else if (data['msg'] != null) {
        showSnackBar(data['msg']);
      } else {}

      switch (response.statusCode) {
        case 500:
          break;
        case 405:
          break;
        case 422:
          break;
        case 400:
          if (data is String) {
            showSnackBar(data.toString());
          } else if (data['msg'] != null) {
            showSnackBar(data['msg']);
          } else {}

          break;

        case 401:
          tokenInvalid();
          break;

       }
    }
  }

  _getHeader() async {
    return {
      'lang': "en",
      'Accept': 'application/json',
      'Authorization':
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZWJiMzM4MjQ5YzI4M2U1ZWM2YTg1ZDU5ZmNkNDZmYiIsInN1YiI6IjY1ZjE5ZjdiZmJlMzZmMDE4NWVmMGZkNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0Y7i2vD26HQzAslf8mEhLIfUjEPsQiJz6mxrruA44uk"


    };
  }

  void tokenInvalid() async {
    showSnackBar("token is Invalid", backgroundColor: Colors.redAccent);
  }
}
