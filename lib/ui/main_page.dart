import 'package:flutter/material.dart';
import 'package:flutterasyncredux/core/models/movies_list_type.dart';
import 'package:flutterasyncredux/ui/inkino_app_bar.dart';

import '../assets.dart';
import 'inkino_bottom_bar.dart';
import 'movies/movies_page.dart';

class MainPage extends StatefulWidget{
  
  const MainPage();
  
  @override
  State<StatefulWidget> createState() => _MainPageState();
  
}
class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Widget _buildTabContent() {
    return Positioned.fill(
      child: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          MoviesPage(MoviesListType.popularMovies),
          MoviesPage(MoviesListType.comingSoon),
        ],
      ),
    );
  }
  void _tabSelected(int newIndex) {
    setState(() {
      _selectedTab = newIndex;
      _tabController.index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgroundImage = Image.asset(
      ImageAssets.backgroundImage,
      fit: BoxFit.cover,
    );

    final content = Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: InkinoAppBar(),
      ),
      body: Stack(
        children: [
          _buildTabContent(),
          _BottomTabs(
            selectedTab: _selectedTab,
            onTap: _tabSelected,
          ),
        ],
      ),
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        backgroundImage,
        content,
      ],
    );

  }
  
}
class _BottomTabs extends StatelessWidget {
  _BottomTabs({
    @required this.selectedTab,
    @required this.onTap,
  });

  final int selectedTab;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.bottomCenter,
      child: InkinoBottomBar(
        currentIndex: selectedTab,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            label: 'Popular',
            icon: const Icon(Icons.theaters),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            label: 'Upcoming',
            icon: const Icon(Icons.whatshot),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
