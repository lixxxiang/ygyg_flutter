import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:ygyg_flutter/data/api/apis.dart';
import 'package:ygyg_flutter/data/net/dio_util.dart';
import 'package:ygyg_flutter/data/protocol/models.dart';
import 'package:ygyg_flutter/utils/log_util.dart';

class WanRepository {
  Future<List<HomePageSlideModel>> homePageSlide() async {
    BaseResp<Map<String, dynamic>> baseResp = await DioUtil()
        .request<Map<String, dynamic>>(
            Method.get, Api.getPath(path: Api.HOME_PAGE_SLIDE));
    List<HomePageSlideModel> list;
//    if (baseResp.status != 0) {
//      return new Future.error(baseResp.message);
//    }
    if (baseResp.data != null) {
//      ComData comData = ComData.fromJson(baseResp.data);
      list = baseResp.data.map((value) {
        return HomePageSlideModel.fromJson(value);
      }).toList();
    }
    return list;
  }

  Future<List<HomePageUnitsModel>> homePageUnits() async {
    BaseResp<Map<String, dynamic>> baseResp = await DioUtil()
        .request<Map<String, dynamic>>(
            Method.get, Api.getPath(path: Api.HOME_PAGE_UNITS));
    List<HomePageUnitsModel> list;
//    if (baseResp.status != 0) {
//      return new Future.error(baseResp.message);
//    }
    if (baseResp.data != null) {
//      ComData comData = ComData.fromJson(baseResp.data);
      list = baseResp.data.map((value) {
        return HomePageUnitsModel.fromJson(value);
      }).toList();
    }
    return list;
  }


  Future<dynamic> getDailyPic() async {
    BaseResp2<GetDailyPicModel> baseResp2 =  (await DioUtil()
        .request2<GetDailyPicModel>(
        Method.post,
        Api.getPath(
            path: Api.GET_DAILY_PIC),data: new FormData.from({
      "pageSize": "2",
      "pageNum": "1",
    })));
    List<dynamic> list;
//    if (baseResp.status != 0) {
//      return new Future.error(baseResp.message);
//    }
    if (baseResp2.data != null) {
//      ComData comData = ComData.fromJson(baseResp.data);
    Logger.e(baseResp2.data["SjDailyPicDtoList"]);
    list = baseResp2.data["SjDailyPicDtoList"];
//      list = baseResp2.data["SjDailyPicDtoList"];
//      Logger.e("hello"+baseResp2.data.toString());
    }
    return list;
  }
}

class ComData {
//  int size;
  List datas;

  ComData.fromJson(Map<String, dynamic> json)
      :
//        size = json['size'],
        datas = json['datas'];
}
