// import 'package:todolist/dio/DioUtil.dart';

// class LoginService {
//   /// 单例模式
//   static LoginService? _instance;
//   factory LoginService() => _instance ?? LoginService._internal();
//   static LoginService? get instance => _instance ?? LoginService._internal();

//   /// 初始化
//   LoginService._internal() {
//     // 初始化基本选项
//   }

//   /// 获取权限列表
//   getUser() async {
//     /// 开启日志打印
//     DioUtil.instance?.openLog();

//     /// 发起网络接口请求
//     var result = await DioUtil().request('get_user', method: DioMethod.get);
//     return result.data;
//   }
// }
