import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ygyg_flutter/data/protocol/models.dart';
export 'package:cached_network_image/cached_network_image.dart';

class ReposItem extends StatelessWidget {
  const ReposItem(
    this.model, {
    Key key,
    this.isHome,
  }) : super(key: key);

//  final ReposModel model;
  final HomePageSlideModel model;
//  final DataEntity model;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
//        NavigatorUtil.pushWeb(context,
//            title: model.title, url: model.link, isHome: isHome);
      },
      child: new Container(
          height: 160.0,
          padding: EdgeInsets.all(16.0),
          child: new Row(
            children: <Widget>[
              new Expanded(
                  child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(model.imageUrl,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.bold,
                      )),
                  new SizedBox(height: 10),
                ],
              )),
//              new Container(
//                width: 72,
//                alignment: Alignment.center,
//                margin: EdgeInsets.only(left: 10.0),
//                child: new CachedNetworkImage(
//                  width: 72,
//                  height: 128,
//                  fit: BoxFit.fill,
//                  imageUrl: model.envelopePic,
////                  placeholder: new ProgressView(),
////                  errorWidget: new Icon(Icons.error),
//                ),
//              )
            ],
          ),
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border(
                  bottom:
                      new BorderSide(width: 0.33, color: Color(0xffe5e5e5))))),
    );
  }
}
