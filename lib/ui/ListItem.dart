import 'package:flutter/material.dart';
import 'package:gmail_clone_app/utils/Email.dart';

class ListItem extends StatefulWidget {
  final Email email;

  ListItem({Key key, this.email}) : super(key: key);

  _ListItem createState() => _ListItem();
}

class _ListItem extends State<ListItem> {
  @override
  Widget build(BuildContext contenxt) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${widget.email.name.substring(0, 1)}', style: TextStyle(color: Colors.white)),
          backgroundColor: widget.email.color,
        ),
        title: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.email.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  widget.email.time,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                    child: Padding(
                  padding: EdgeInsets.only(top: 8, right: 30),
                  child: Text(
                    widget.email.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ))
              ],
            )
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: new Container(
                padding: new EdgeInsets.all(0),
                child: new Text(
                  widget.email.description,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(
                    fontSize: 13.0,
                  ),
                ),
              ),
            ),
            widget.email.starred ? Icon(Icons.star, color: Colors.yellow[800],) : Icon(Icons.star_border)
          ],
        ),
      ),
    );
  }
}
