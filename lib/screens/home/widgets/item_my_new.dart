import 'package:blog/bloc/my_news/my_news_bloc.dart';
import 'package:blog/entities/my_news_entity.dart';
import 'package:blog/screens/details/main.dart';
import 'package:blog/shared/scale.transition.dart';
import 'package:blog/shared/styles/colors.dart';
import 'package:blog/shared/widgets/alert_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemMyNews extends StatefulWidget {
  final MyNews news;
  const ItemMyNews({Key? key, required this.news}) : super(key: key);

  @override
  State<ItemMyNews> createState() => _ItemMyNewsState();
}

class _ItemMyNewsState extends State<ItemMyNews> {
  TextEditingController controller = TextEditingController();

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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.news.content,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: const TextStyle(color: BlogColors.grayDark),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _onPressedEdit();
                      },
                      icon: const Icon(Icons.edit, color: BlogColors.darkBlue)),
                  IconButton(
                      onPressed: () {
                        _onPressedDelete();
                      },
                      icon: const Icon(Icons.delete, color: BlogColors.red))
                ],
              ),
            )),
      ),
    );
  }

  void _onPressedDelete() {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertContentNews(
              deleting: true,
              onPressed: () {
                BlocProvider.of<MyNewsBloc>(context)
                    .add(DeleteNewsEvent(id: widget.news.id));
              },
              title: const Text("Tem certeza?"),
            ));
  }

  void _onPressedEdit() {
    //TODO mudar cpf para cpf logado
    controller.text = widget.news.content;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertContentNews(
            deleting: false,
            onPressed: () {
              BlocProvider.of<MyNewsBloc>(context).add(
                  EditNewsEvent(id: widget.news.id, content: controller.text));
            },
            title: const Text("Adicione uma nova notícia"),
            controller: controller)).then((value) => controller.clear());
  }
}
