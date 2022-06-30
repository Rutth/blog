import 'package:blog/entities/my_news_entity.dart';
import 'package:blog/entities/news_entity.dart';
import 'package:blog/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class BodyDetails extends StatelessWidget {
  final MyNews? mynews;
  final News? news;
  const BodyDetails({Key? key, this.mynews, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _showData(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        _textContent(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: BlogColors.grayDark),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Widget _showData() {
    return news != null
        ? Text(
            news!.message.dataFormatted,
            textAlign: TextAlign.start,
            style: const TextStyle(color: BlogColors.gray, fontSize: 12),
          )
        : const SizedBox();
  }

  String _textContent() {
    return news != null ? news!.message.content : mynews!.content;
  }
}
