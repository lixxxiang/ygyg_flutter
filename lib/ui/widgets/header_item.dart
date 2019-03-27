import 'package:flutter/material.dart';
import 'package:ygyg_flutter/utils/utils.dart';
class HeaderItem extends StatelessWidget {
  const HeaderItem(
      {this.margin,
      this.titleColor,
      this.leftIcon,
      this.titleId: 'title_repos',
      this.title,
      this.extraId: 'more',
      this.extra,
      this.rightIcon,
      this.onTap,
      Key key})
      : super(key: key);

  final EdgeInsetsGeometry margin;
  final Color titleColor;
  final IconData leftIcon;
  final String titleId;
  final String title;
  final String extraId;
  final String extra;
  final IconData rightIcon;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0,
      margin: margin ?? EdgeInsets.only(top: 0.0),
      child: new ListTile(
          onTap: onTap,
          title: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Icon(
                leftIcon ?? Icons.whatshot,
                color: titleColor ?? Colors.blueAccent,
              ),
              new SizedBox(width: 10),
              new Expanded(
                  child: new Text(
                title ?? titleId,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: titleColor ?? Colors.blueAccent,
                    fontSize: Utils.getTitleFontSize(
                        title ?? titleId)),
              ))
            ],
          ),
          trailing: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(
                extra ?? extraId,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              new Icon(
                rightIcon ?? Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
            ],
          )),
      decoration: new BoxDecoration(
          //new Border.all(width: 0.33, color: Colours.divider)
          border: new Border(
              bottom: new BorderSide(width: 0.33, color: Color(0xffe5e5e5)))),
    );
  }
}


