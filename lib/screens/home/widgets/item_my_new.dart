import 'package:blog/entities/my_news_entity.dart';
import 'package:blog/screens/details/main.dart';
import 'package:blog/shared/scale.transition.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemMyNews extends StatefulWidget {
  final MyNews news;
  const ItemMyNews({Key? key, required this.news}) : super(key: key);

  @override
  State<ItemMyNews> createState() => _ItemMyNewsState();
}

class _ItemMyNewsState extends State<ItemMyNews> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              ScaleRoute(
                  page: DetailsNewsScreen(
                mynews: widget.news,
              )));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ListTile(
            title: Text(
              widget.news.content,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const FaIcon(FontAwesomeIcons.angleRight),
          ),
        ),
      ),
    );
  }
}
