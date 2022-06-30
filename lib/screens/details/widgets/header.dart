import 'package:blog/entities/my_news_entity.dart';
import 'package:blog/entities/news_entity.dart';
import 'package:flutter/material.dart';

const bg =
    "https://i.pinimg.com/originals/11/b6/76/11b6769c8f2ea91b25fa0bb10bcaf4ab.jpg";

class HeaderDetails extends StatelessWidget implements PreferredSizeWidget {
  final MyNews? mynews;
  final News? news;
  const HeaderDetails({Key? key, this.mynews, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          _verifyTitle(),
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        flexibleSpace: _verifyTypeBackground());
  }

  String _verifyTitle() {
    return news != null ? "${news?.user.name}" : "${mynews?.content}";
  }

  Widget _verifyTypeBackground() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.darken),
              image:
                  NetworkImage(news != null ? news!.user.profilePicture : bg),
              fit: BoxFit.cover)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
