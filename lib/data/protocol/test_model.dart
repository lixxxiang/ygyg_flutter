
class HomePageSlideModel {
  String imageUrl;

  HomePageSlideModel.fromJson(Map<String, dynamic> json)
      :imageUrl = json['imageUrl'];

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

  HomePageUnitsModel.fromJson(Map<String, dynamic> json)
      :imageUrl = json['imageUrl'];

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