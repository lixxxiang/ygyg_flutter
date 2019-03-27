import 'dart:async';
import 'dart:collection';
import 'package:rxdart/rxdart.dart';
import 'package:ygyg_flutter/blocs/bloc_provider.dart';
import 'package:ygyg_flutter/data/protocol/models.dart';
import 'package:ygyg_flutter/data/repository/wan_repository.dart';
export 'package:rxdart/rxdart.dart';
import 'package:ygyg_flutter/event/event.dart';
import 'package:ygyg_flutter/utils/log_util.dart';

class MainBloc implements BlocBase {
  BehaviorSubject<List<HomePageSlideModel>> _homePageSlide = BehaviorSubject<List<HomePageSlideModel>>();
  Sink<List<HomePageSlideModel>> get _homePageSlideSink => _homePageSlide.sink;
  Stream<List<HomePageSlideModel>> get homePageSlideStream => _homePageSlide.stream;

  BehaviorSubject<List<HomePageUnitsModel>> _homePageUnits = BehaviorSubject<List<HomePageUnitsModel>>();
  Sink<List<HomePageUnitsModel>> get _homePageUnitsSink => _homePageUnits.sink;
  Stream<List<HomePageUnitsModel>> get homePageUnitsStream => _homePageUnits.stream;


  BehaviorSubject<dynamic> _getDailyPic = BehaviorSubject<dynamic>();
  Sink<dynamic> get _getDailyPicSink => _getDailyPic.sink;
  Stream<dynamic> get getDailyPicStream => _getDailyPic.stream;

  List<HomePageSlideModel> _homePageSlideList;
  List<HomePageUnitsModel> _homePageUnitsList;
  List<dynamic> _getDailyPicList;

  int _reposPage = 0;

  BehaviorSubject<StatusEvent> _homeEvent = BehaviorSubject<StatusEvent>();
  Sink<StatusEvent> get _homeEventSink => _homeEvent.sink;
  Stream<StatusEvent> get homeEventStream => _homeEvent.stream.asBroadcastStream();

  HomePageSlideModel homePageSlideModel;

  @override
  void dispose() {
    // TODO: implement dispose
//    _repos.close();
    _homeEvent.close();
  }

  @override
  Future getData({String labelId, int page}) {
//    return getArticleListProject(labelId, page);
    return getHomePageSlide();
//    return getHomePageUnits();
  }

  Future getData2() {
//    return getArticleListProject(labelId, page);
//    return getHomePageSlide();
    return getHomePageUnits();
  }

  @override
  Future onLoadMore({String labelId}) {
    // TODO: implement onLoadMore
    int _page = 0;
    _page = ++_reposPage;
    return getData(labelId: labelId, page: _page);
  }

  @override
  Future onRefresh({String labelId}) {
    // TODO: implement onRefresh
    _reposPage = 0;
    return getData(labelId: labelId, page: 0);
  }

  WanRepository wanRepository = new WanRepository();

//  Future getArticleListProject(String labelId, int page) {
//    return wanRepository.getArticleListProject(page).then((list) {
//      if (_reposList == null) {
//        _reposList = new List();
//      }
//      if (page == 0) {
//        _reposList.clear();
//      }
//      _reposList.addAll(list);
//      _reposSink.add(UnmodifiableListView<ReposModel>(_reposList));
//      _homeEventSink.add(new StatusEvent(
//          labelId,
//          ObjectUtil.isEmpty(list)
//              ? RefreshStatus.noMore
//              : RefreshStatus.idle));
//    })
////        .catchError(() {
////      _reposPage--;
////      _homeEventSink.add(new StatusEvent(labelId, RefreshStatus.failed));
////    })
//    ;
//  }

  Future getHomePageSlide() {
    return wanRepository.homePageSlide().then((list) {
      if (_homePageSlideList == null) {
        _homePageSlideList = new List();
      }
//      if (page == 0) {
//        _homePageSlideList.clear();
//      }
      _homePageSlideList.addAll(list);
      _homePageSlideSink
          .add(UnmodifiableListView<HomePageSlideModel>(_homePageSlideList));
//      _testEventSink.add(new TestStatusEvent(
//          ObjectUtil.isEmpty(list)
//              ? RefreshStatus.noMore
//              : RefreshStatus.idle));
    })
//        .catchError(() {
//      _reposPage--;
//      _testEventSink.add(new TestStatusEvent(RefreshStatus.failed));
//    })
        ;
  }

  Future getHomePageUnits() {
    return wanRepository.homePageUnits().then((list) {
      if (_homePageUnitsList == null) {
        _homePageUnitsList = new List();
      }
//      if (page == 0) {
//        _homePageSlideList.clear();
//      }
      _homePageUnitsList.addAll(list);
      _homePageUnitsSink
          .add(UnmodifiableListView<HomePageUnitsModel>(_homePageUnitsList));
//      _testEventSink.add(new TestStatusEvent(
//          ObjectUtil.isEmpty(list)
//              ? RefreshStatus.noMore
//              : RefreshStatus.idle));
    })
//        .catchError(() {
//      _reposPage--;
//      _testEventSink.add(new TestStatusEvent(RefreshStatus.failed));
//    })
        ;
  }

  Future getDailyPic() {
    return wanRepository.getDailyPic().then((list) {
      if (_getDailyPicList == null) {
        _getDailyPicList = new List();
      }
//      if (page == 0) {
//        _homePageSlideList.clear();
//      }
      _getDailyPicList=list;
      _getDailyPicSink
          .add(_getDailyPicList);
//      _testEventSink.add(new TestStatusEvent(
//          ObjectUtil.isEmpty(list)
//              ? RefreshStatus.noMore
//              : RefreshStatus.idle));
    })
//        .catchError(() {
//      _reposPage--;
//      _testEventSink.add(new TestStatusEvent(RefreshStatus.failed));
//    })
        ;
  }
}
