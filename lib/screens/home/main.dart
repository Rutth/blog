import 'package:blog/bloc/profile/profile_bloc.dart';
import 'package:blog/screens/home/tabs/gb_news.dart';
import 'package:blog/screens/home/tabs/my_news.dart';
import 'package:blog/screens/home/widgets/floating_btn.dart';
import 'package:blog/screens/home/widgets/slider_widget.dart';
import 'package:blog/shared/styles/colors.dart';
import 'package:blog/shared/widgets/alert_logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? _tabController;
  late List<StatefulWidget> tabsContent;
  late List<Widget> tabsTitle;
  int _tabIndex = 0;
  String nameUser = "";

  @override
  void initState() {
    _setupTabs();
    _loadInfo();
    super.initState();
  }

  void _loadInfo() {
    nameUser = BlocProvider.of<ProfileBloc>(context).perfil.nameFormatted;
  }

  _setupTabs() {
    tabsContent = [];
    tabsTitle = [];

    tabsContent.add(const GbNewsTab());
    tabsTitle.add(_tabTitle("GB"));

    tabsContent.add(const MyNewsTab());
    tabsTitle.add(_tabTitle("Minhas notícias"));

    _tabController = TabController(
      length: tabsContent.length,
      vsync: this,
      initialIndex: _tabIndex,
    );
    _tabController!.addListener(_updateIndex);
  }

  _updateIndex() {
    setState(() {
      _tabIndex = _tabController!.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingBtn(),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                backgroundColor: blogBlue,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(nameUser,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              )),
                        ),
                        IconButton(
                          onPressed: () {
                            _showDialog();
                          },
                          icon: const Icon(Icons.logout),
                          iconSize: 20,
                          color: Colors.white,
                        )
                      ],
                    ),
                    background: Container(
                      color: blogBlue,
                    )),
              ),
              SliverPersistentHeader(
                delegate: SliverAppBarDelegate(
                  TabBar(
                      labelColor: Colors.black87,
                      controller: _tabController,
                      unselectedLabelColor: BlogColors.gray,
                      tabs: tabsTitle),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: tabsContent,
          ),
        ),
      ),
    );
  }

  Widget _tabTitle(String title) {
    return Tab(
      text: title,
      icon: const Icon(Icons.list),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => const AlertLogout());
  }
}
