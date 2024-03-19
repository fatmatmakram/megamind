

import 'dio_imports.dart';

enum ReturnType {
  model,
  list,
}

enum MethodType { get }

class GenericHttp<T> {

  GenericHttp( );

  Future<dynamic> callApi(
      {required ReturnType returnType,
      required MethodType methodType,
      required String name,
      Function(dynamic data)? returnDataFun,
      Map<String, dynamic>? jsonBody,
      Map<String, dynamic>? query,
      bool? showLoader,
      Function(dynamic data)? toJsonFunc,
      bool refresh = true}) async {
    var dataJson = jsonBody ?? {};

    switch (methodType) {
      case MethodType.get:
        return _getData(
            name: name,
            query: query,
            returnType: returnType,
            refresh: refresh,
            dataKeyFun: returnDataFun,
            toJsonFunc: toJsonFunc,
            json: dataJson);
    }
  }

  Future<dynamic> _getData({
    required ReturnType returnType,
    Map<String, dynamic> json = const {},
    Map<String, dynamic>? query,
    required String name,
    Function(dynamic data)? dataKeyFun,
    bool refresh = true,
    Function(dynamic data)? toJsonFunc,
  }) async {
    var data = await DioHelper( ).get(
      url: name,
      query: query,
    );
    return _returnDataFromType(
        data, returnType, toJsonFunc ?? (val) {}, dataKeyFun);
  }

  dynamic _returnDataFromType(
    dynamic data,
    ReturnType returnType,
    Function(dynamic data) toJsonFunc,
    Function(dynamic data)? dataKeyFun,
  ) async {
    switch (returnType) {
      case ReturnType.model:
        return Function.apply(toJsonFunc, [
          dataKeyFun == null ? data : Function.apply(dataKeyFun, [data])
        ]);

      case ReturnType.list:
        return List<T>.from(
          dataKeyFun == null
              ? data
              : Function.apply(dataKeyFun, [data]).map(
                  (e) => Function.apply(toJsonFunc, [e]),
                ),
        );
    }
  }
}
