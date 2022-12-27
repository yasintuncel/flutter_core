import 'i_restful_service.dart';

abstract class IServiceManager<T> {
  List<T> modelList = [];

  IRestfulService<T> service;

  IServiceManager(this.service);

  Future<List<T>> getList({bool force = false}) async {
    if (!force) return modelList;
    var res = await service.getList();
    modelList = res;
    return modelList;
  }
}
