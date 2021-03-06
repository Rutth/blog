import 'package:blog/entities/news_entity.dart';
import 'package:blog/screens/details/main.dart';
import 'package:blog/shared/scale.transition.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemNewsList extends StatefulWidget {
  final News news;
  const ItemNewsList({Key? key, required this.news}) : super(key: key);

  @override
  State<ItemNewsList> createState() => _ItemNewsListState();
}

class _ItemNewsListState extends State<ItemNewsList> {
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
                news: widget.news,
              )));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ListTile(
            leading: Image.network(widget.news.user.profilePicture),
            title: Text(widget.news.user.name),
            subtitle: Text(
              widget.news.message.content,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13.0,
              ),
            ),
            trailing: const FaIcon(FontAwesomeIcons.angleRight),
          ),
        ),
      ),
    );
  }
}
