class HomePageSlideModel {
  String imageUrl;

  HomePageSlideModel.fromJson(Map<String, dynamic> json)
      : imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() => {
        'imageUrl': imageUrl,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"imageUrl\":\"$imageUrl\"");
    sb.write('}');
    return sb.toString();
  }
}

class HomePageUnitsModel {
  String imageUrl;
  List<DataEntity> pieces;

  HomePageUnitsModel.fromJson(Map<String, dynamic> json)
      : imageUrl = json['description'],
        pieces = (json['pieces'] as List)
            ?.map((l) => DataEntity.fromJson(l))
            ?.toList();

  Map<String, dynamic> toJson() => {
        'description': imageUrl,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"description\":\"$imageUrl\"");
    sb.write('}');
    return sb.toString();
  }
}

class DataEntity {
  String imageUrl;

  DataEntity({this.imageUrl});

  DataEntity.fromJson(Map<String, dynamic> json) : imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() => {
        'imageUrl': imageUrl,
      };
}

class GetDailyPicModel {
  List<SjDailyPicDtoListBean> SjDailyPicDtoList;

  GetDailyPicModel({ this.SjDailyPicDtoList});

  GetDailyPicModel.fromJson(Map<String, dynamic> json)
      :SjDailyPicDtoList = json['SjDailyPicDtoList'];
//      ?.map((l) => SjDailyPicDtoListBean.fromJson(l))
//      ?.toList();

  Map<String, dynamic> toJson() => {
    'SjDailyPicDtoList': SjDailyPicDtoList,
  };
}

//class GetDailyPicModel {
//  SjDailyPicDtoListBean sjDailyPicDtoListBean;
//
//  GetDailyPicModel({ this.sjDailyPicDtoListBean});
//
//  GetDailyPicModel.fromJson(Map<String, dynamic> json)
//      :sjDailyPicDtoListBean = (json['SjDailyPicDtoList'])
//      ?.map((l) => SjDailyPicDtoListBean.fromJson(l))
//      ?.toList();
//
//  Map<String, dynamic> toJson() => {
//    'SjDailyPicDtoList': sjDailyPicDtoListBean,
//  };
//}

class SjDailyPicDtoListBean{
  String imageName;

  SjDailyPicDtoListBean.fromJson(Map<String, dynamic> json)
      : imageName = json['imageName'];

  Map<String, dynamic> toJson() => {
    'imageName': imageName,
  };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"imageName\":\"$imageName\"");
    sb.write('}');
    return sb.toString();
  }
}

//class GetDailyPicBean{
//  List<SjDailyPicDtoListBean> SjDailyPicDtoList;
//
//  GetDailyPicBean({ this.SjDailyPicDtoList});
//
//  GetDailyPicBean.fromJson(Map<String, dynamic> json)
//      :SjDailyPicDtoList = json['SjDailyPicDtoList'];
////      ?.map((l) => SjDailyPicDtoListBean.fromJson(l))
////      ?.toList();
//
//  Map<String, dynamic> toJson() => {
//    'SjDailyPicDtoList': SjDailyPicDtoList,
//  };
//}
