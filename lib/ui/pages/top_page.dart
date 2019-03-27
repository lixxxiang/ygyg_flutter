//import 'package:flutter/material.dart';
//import 'package:pull_to_refresh/pull_to_refresh.dart';
//import 'package:ygyg_flutter/data/protocol/models.dart';
//import 'package:ygyg_flutter/ui/widgets/refresh_scaffold.dart';
//import 'package:ygyg_flutter/ui/widgets/repos_item.dart';
//import 'package:ygyg_flutter/blocs/main_bloc.dart';
//import 'package:ygyg_flutter/blocs/bloc_provider.dart';
//
//bool isReposInit = true;
//
//
//class TopPage extends StatelessWidget {
//  const TopPage({Key key, this.labelId}) : super(key: key);
//
//  final String labelId;
//
//  @override
//  Widget build(BuildContext context) {
////    Logger.e("ReposPage build......");
//    RefreshController _controller = new RefreshController();
//    final MainBloc bloc = BlocProvider.of<MainBloc>(context);
////    bloc.homeEventStream.listen((event) {
////      if (labelId == event.labelId) {
////        _controller.sendBack(false, event.status);
////      }
////    });
//
//    if (isReposInit) {
//      isReposInit = false;
//      Observable.just(1).delay(new Duration(milliseconds: 500)).listen((_) {
//        bloc.onRefresh(labelId: labelId);
//      });
//    }
//
//    return new StreamBuilder(
//        stream: bloc.homePageSlideStream,
//        builder:
//            (BuildContext context, AsyncSnapshot<List<HomePageSlideModel>> snapshot) {
//          return new RefreshScaffold(
//            labelId: labelId,
//            isLoading: snapshot.data == null,
//            controller: _controller,
//            onRefresh: () {
//              return bloc.onRefresh(labelId: labelId);
//            },
//            onLoadMore: (up) {
//              bloc.onLoadMore(labelId: labelId);
//            },
//            itemCount: snapshot.data == null ? 0 : snapshot.data.length,
//            itemBuilder: (BuildContext context, int index) {
//              HomePageSlideModel model = snapshot.data[index];
//              return new ReposItem(model);
//            },
//          );
//        });
//  }
//}
