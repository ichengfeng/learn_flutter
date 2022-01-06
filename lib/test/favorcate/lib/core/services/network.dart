import 'package:dio/dio.dart';
import 'package:favorcate/core/services/config.dart';

class HttpRequest {

  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.timeout);
  static final Dio dio = Dio(baseOptions);

  static Future request<T>(String url, {
        String method = "get",
        Map<String, dynamic>? params,
        Interceptor? interceptor
      }) async {
    //1、创建个性化配置
    final options = Options(method: method);

    //2、全局拦截器
    //创建默认的全局拦截器
    Interceptor dInter = InterceptorsWrapper(
      onRequest: (option, handler) {
        //请求拦截
        return handler.next(option);
      },
      onResponse: (res, handler) {
        //响应拦截
        return handler.next(res);
      },
      onError: (error, handler){
        //错误拦截
        return handler.next(error);
      }
    );
    List<Interceptor> inters = [dInter];
    //请求拦截器
    if (interceptor != null) {
      inters.add(interceptor);
    }
    dio.interceptors.addAll(inters);

    //2、发送网络请求
    try {
      Response response = await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (error) {
      return Future.error(error);
    }
  }

}