import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

//存储服务
class StoreService extends GetxService {
  late GetStorage _store;

  Future<StoreService> init() async {
    _store = GetStorage();
    await _store.writeIfNull("tasks", []);
    return this;
  }

  T read<T>(String key) {
    _store.listen(() {
      print(_store.read(key));
    });
    print("Function Readddddddd");
    return _store.read(key);
  }

  void write(String key, List<dynamic> value) async {
    await _store.write(key, value);
    _store.listen(() {
      print(_store.read(key));
    });
    print("Function writeeeee");
  }

  void writebool(String key, bool value) async {
    await _store.write(key, value);
  }

  void writeUserInfo(String key, dynamic s) async {
    await _store.write(key, s);
  }
}
