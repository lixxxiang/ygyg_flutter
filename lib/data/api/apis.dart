class Api {
  static const String ARTICLE_LISTPROJECT = "article/listproject";
  static const String HOME_PAGE_SLIDE = "http://59.110.164.214:8024/global/homePageSlide";
  static const String HOME_PAGE_UNITS = "http://59.110.164.214:8024/global/mobile/homePageUnits";
  static const String GET_DAILY_PIC = "http://202.111.178.10:28085/mobile/getDailyPic";

  static String getPath({String path: '', int page, String resType: 'json'}) {
    StringBuffer sb = new StringBuffer(path);
    return sb.toString();
  }
}
