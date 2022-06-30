import 'package:blog/entities/my_news_entity.dart';
import 'package:blog/entities/news_entity.dart';
import 'package:blog/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class FooterDetails extends StatefulWidget {
  final MyNews? mynews;
  final News? news;
  const FooterDetails({Key? key, this.mynews, this.news}) : super(key: key);

  @override
  State<FooterDetails> createState() => _FooterDetailsState();
}

class _FooterDetailsState extends State<FooterDetails> {
  @override
  Widget build(BuildContext context) {
    return _showButtons();
  }

  Widget _showButtons() {
    return widget.mynews != null
        ? SizedBox(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: const Text("Editar"),
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: BlogColors.red),
                      child: const Text("Excluir"),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          )
        : const SizedBox();
  }
}
