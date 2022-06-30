import 'package:blog/entities/my_news_entity.dart';
import 'package:blog/entities/news_entity.dart';
import 'package:blog/screens/details/widgets/body.dart';
import 'package:blog/screens/details/widgets/header.dart';
import 'package:flutter/material.dart';

class DetailsNewsScreen extends StatefulWidget {
  final MyNews? mynews;
  final News? news;
  const DetailsNewsScreen({Key? key, this.mynews, this.news}) : super(key: key);

  @override
  State<DetailsNewsScreen> createState() => _DetailsNewsScreenState();
}

class _DetailsNewsScreenState extends State<DetailsNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderDetails(
        mynews: widget.mynews,
        news: widget.news,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BodyDetails(
              mynews: widget.mynews,
              news: widget.news,
            ),
          ],
        ),
      ),
    );
  }
}
