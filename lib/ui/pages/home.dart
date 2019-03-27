import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ygyg_flutter/data/protocol/models.dart';
import 'package:ygyg_flutter/ui/widgets/header_item.dart';
import 'package:ygyg_flutter/ui/widgets/refresh_scaffold.dart';
import 'package:ygyg_flutter/ui/widgets/repos_item.dart';
import 'package:ygyg_flutter/blocs/main_bloc.dart';
import 'package:ygyg_flutter/blocs/bloc_provider.dart';
import 'package:ygyg_flutter/ui/widgets/marquee/flutter_marquee.dart';

bool isReposInit = true;

class Home extends StatelessWidget {
  const Home({Key key, this.labelId}) : super(key: key);

  final String labelId;

  Widget buildBanner(BuildContext context, List<HomePageSlideModel> list) {
    if (ObjectUtil.isEmpty(list)) {
      return new Container(height: 0.0);
    }
    return new AspectRatio(
      aspectRatio: 16.0 / 9.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            list[index].imageUrl,
            fit: BoxFit.cover,
          );
        },
        autoplay: true,
        itemCount: list.length,
        pagination: new SwiperPagination(
            builder: const DotSwiperPaginationBuilder(
                size: 6.0, activeSize: 6.0, space: 2.0)),
      ),
    );
  }

  Widget buildRepos(BuildContext context, List<HomePageSlideModel> list) {
    if (ObjectUtil.isEmpty(list)) {
      return new Container(height: 0.0);
    }
    List<Widget> _children = list.map((model) {
      return new ReposItem(
        model,
        isHome: true,
      );
    }).toList();
    List<Widget> children = new List();
    children.add(new HeaderItem(
      leftIcon: Icons.book,
      titleId: 'rec_repos',
      onTap: () {
//        NavigatorUtil.pushTabPage(context,
//            labelId: Ids.titleReposTree, titleId: Ids.titleReposTree);
      },
    ));
    children.addAll(_children);
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  Widget buildDailyPic(BuildContext context, dynamic list) {
    if (ObjectUtil.isEmpty(list)) {
      return new Container(height: 0.0);
    }
//    List<Widget> _children = list.map((model) {
//      return new ReposItem(
//        model,
//        isHome: true,
//      );
//    }).toList();
//    List<Widget> children = new List();
//    children.add(new HeaderItem(
//      leftIcon: Icons.book,
//      titleId: 'rec_repos',
//      onTap: () {
////        NavigatorUtil.pushTabPage(context,
////            labelId: Ids.titleReposTree, titleId: Ids.titleReposTree);
//      },
//    ));
//    children.addAll(_children);
    return Container(
      child:
//      Text(
//        list[0]["imageName"],
//        textAlign: TextAlign.center,
//        style: TextStyle(
//          color: Color(0xFFD8D8D8),
//          fontSize: 12.0,
//        ),
//      ),
          Column(
        children: <Widget>[
          Container(
            height: 50,
            child: FlutterMarquee(
                texts: ["刘成", "刘成1111", "刘成2222", "刘成3333"].toList(),
                duration: 3),
          )
        ],
      ),
      height: 50,
    );
  }

  @override
  Widget build(BuildContext context) {
    RefreshController _controller = new RefreshController();
    final MainBloc bloc = BlocProvider.of<MainBloc>(context);
//    bloc.homeEventStream.listen((event) {
//      if (labelId == event.labelId) {
//        _controller.sendBack(false, event.status);
//      }
//    });

    if (isReposInit) {
      isReposInit = false;
      Observable.just(1).delay(new Duration(milliseconds: 500)).listen((_) {
        bloc.getDailyPic();
        bloc.onRefresh(labelId: labelId);
        bloc.getData2();
      });
    }

    return new StreamBuilder(
        stream: bloc.homePageSlideStream,
        builder: (BuildContext context,
            AsyncSnapshot<List<HomePageSlideModel>> snapshot) {
          return new RefreshScaffold(
            labelId: labelId,
            isLoading: snapshot.data == null,
            controller: _controller,
            enablePullUp: false,
            onRefresh: () {
              return bloc.onRefresh(labelId: labelId);
            },
            child: new ListView(
              children: <Widget>[
                new StreamBuilder(
                    stream: bloc.homePageUnitsStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      return Container(
//                        decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
//                          //设置阴影
//                          new BoxShadow(
//                            color: Colors.grey, //阴影颜色
//                            blurRadius: 4.0, //阴影大小
//                          ),
//                        ]),
                        height: 60,
                        child: Container(
                          height: 31,
                          child: Container(
                            width: 190,
                            child: Center(
                              child: Row(children: [
                                Image.asset("assets/images/ic_search_dark.png",
                                    width: 12.0, height: 12.0),
                                Container(
                                  width: 8.0,
                                ),
                                Text('搜索卫星数据，共有5大类产品',
                                    style: TextStyle(
                                        color: const Color(0xFF9B9B9B),
                                        fontSize: 12.0)),
                              ]),
                            ),
                          ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 8.5, top: 12.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                        ),
                      );
                    }),
                buildBanner(context, snapshot.data),
                new StreamBuilder(
                  stream: bloc.getDailyPicStream,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return buildDailyPic(context, snapshot.data);
                  },
                ),
                new StreamBuilder(
                    stream: bloc.homePageSlideStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<HomePageSlideModel>> snapshot) {
                      return buildRepos(context, snapshot.data);
                    }),
              ],
            ),
          );
//            new RefreshScaffold(
//              labelId: labelId,
//              isLoading: snapshot.data == null,
//              controller: _controller,
//              onRefresh: () {
//                return bloc.onRefresh(labelId: labelId);
//              },
//              onLoadMore: (up) {
//                bloc.onLoadMore(labelId: labelId);
//              },
//              itemCount: snapshot.data == null ? 0 : snapshot.data[0].data.length,
//              itemBuilder: (BuildContext context, int index) {
//                  DataEntity model = snapshot.data[0].data[index];
//                  return new ReposItem(model);
//              },
//            );
        });
  }
}
