// ignore_for_file: file_names

class GlobalState {
  final Map<dynamic, dynamic> _data = <dynamic, dynamic>{};
  static GlobalState instance = GlobalState._();
  GlobalState._();

  set(dynamic key, dynamic value) => _data[key] = value;
  get(dynamic key) => _data[key];
}
