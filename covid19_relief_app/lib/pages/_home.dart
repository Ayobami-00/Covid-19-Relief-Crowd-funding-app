import 'package:covid19_relief_app/bloc/homepage_bloc/bloc/homepage_bloc.dart';
import 'package:covid19_relief_app/utils/colors.dart';
import 'package:covid19_relief_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  CustomColour _customColour = CustomColour();

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<HomepageBloc>(context).add(LoadHomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomepageBloc, HomepageState>(
        listener: (context, state) {
      if (state is HomepageLoaded) {
        // Scaffold.of(context).showSnackBar(SnackBar(
        //   content: Text('${state.error}'),
        //   backgroundColor: Colors.red,
        // ));
      }
    }, child:
            BlocBuilder<HomepageBloc, HomepageState>(builder: (context, state) {
      if (state is HomepageLoaded) {
        return Scaffold(
            appBar: new AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              iconTheme: new IconThemeData(color: _customColour.color1),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: 0,
              onTap: (int index) {
                
                setState(() {
                  // _currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_right, color: Colors.black),
                  title: new Text(
                    'News',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_right, color: Colors.black),
                  title: new Text(
                    'Wash',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_right, color: Colors.black),
                  title: new Text(
                    'Group',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_right, color: Colors.black),
                  title: new Text(
                    'History',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            drawer: new Drawer(
              child: new ListView(
                children: <Widget>[
//            header
                  new UserAccountsDrawerHeader(
                    accountName: Text(
                        'Project Supported: ${state.user_profile.toJson()['projects_supported']}'),
                    accountEmail: Text(
                        'Total Amount Spent: ${state.user_profile.toJson()['total_amount']}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    currentAccountPicture: GestureDetector(
                      child: new CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    decoration: new BoxDecoration(color: _customColour.color1),
                  ),

//            body

                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text('Home Page'),
                      leading: Icon(Icons.home),
                    ),
                  ),

                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text('My account'),
                      leading: Icon(Icons.person),
                    ),
                  ),

                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text('My Orders'),
                      leading: Icon(Icons.shopping_basket),
                    ),
                  ),

                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text('Categoris'),
                      leading: Icon(Icons.dashboard),
                    ),
                  ),

                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text('Favourites'),
                      leading: Icon(Icons.favorite),
                    ),
                  ),

                  Divider(),

                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text('Settings'),
                      leading: Icon(
                        Icons.settings,
                        color: Colors.blue,
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text('About'),
                      leading: Icon(Icons.help, color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
            body: Stack(
              children: <Widget>[
                CustomScrollView(
                  slivers: <Widget>[
                    new SliverAppBar(
                      title: Row(
                        children: <Widget>[
                          Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.0),
                            child: MaterialButton(
                              elevation: 5.0,
                              // color: Colors.black,
                              onPressed: () async {},
                              minWidth: 120.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    "Start crowdfunding",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: _customColour.color1,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 25.0,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.white,
                      pinned: false,
                      expandedHeight: 120.0,
                      bottom: new TabBar(
                        labelColor: _customColour.color1,
                        isScrollable: true,
                        tabs: [
                          new Tab(text: 'Recommendations'),
                          new Tab(text: 'My Contributions'),
                          new Tab(text: 'Projects'),
                        ],
                        controller: controller,
                      ),
                    ),
                    new SliverFillRemaining(
                      child: TabBarView(
                        controller: controller,
                        children: <Widget>[
                          // PlaylistsPage(),
                          // BlocProvider(
                          // create: (context) => ArtistsBloc(),
                          // child: ArtistsPage()),
                          // BlocProvider(
                          // create: (context) => AlbumsBloc(),
                          // child: AlbumsPage()),
                          // BlocProvider(
                          // create: (context) => SongsBloc(),
                          // child: SongsPage()),
                          Text("Tab 1"),
                          Text("Tab 2"),
                          Text("Tab 3"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ));
      } else if (state is HomepageLoaded) {
        return Scaffold(backgroundColor: Colors.white, body: Loading());
      } else {
        return Scaffold(backgroundColor: Colors.white, body: Loading());
      }
    }));
  }
}
