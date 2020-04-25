import 'package:covid19_relief_app/bloc/homepage_bloc/bloc/homepage_bloc.dart';
import 'package:covid19_relief_app/bloc/mycontribution_bloc/bloc/mycontribution_bloc.dart';
import 'package:covid19_relief_app/bloc/recommendation_bloc.dart/bloc/recommendation_bloc.dart';
import 'package:covid19_relief_app/pages/mycontribution.dart';
import 'package:covid19_relief_app/utils/colors.dart';
import 'package:covid19_relief_app/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final String payload;

  const HomePage({Key key, this.payload}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  CustomColour _customColour = CustomColour();

  final List<Widget> _children = [
    BlocProvider(
      create: (context) => RecommendationBloc(),
      child: HomePage(),
    ),
    BlocProvider(
      create: (context) => MycontributionBloc(),
      child: MyContribution(),
    ),
    Text('3'),
    Text('4'),
  ];

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
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(150.0),
            child: new AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0.0,
                iconTheme: new IconThemeData(color: _customColour.color1),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Start crowdfunding",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: _customColour.color1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
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
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: Container(
                      height: 37.0,
                      color: _customColour.color1,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: FlatButton(
                              color: _currentIndex == 0
                                  ? Colors.white
                                  : _customColour.color1,
                              onPressed: () {
                                onTabTapped(0);
                              },
                              child: Text('Reccomendation',
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.bold,
                                    color: _currentIndex == 0
                                        ? Colors.black
                                        : Colors.white,
                                  )),
                            ),
                          ),
                          Expanded(
                            child: FlatButton(
                              color: _currentIndex == 1
                                  ? Colors.white
                                  : _customColour.color1,
                              onPressed: () {
                                onTabTapped(1);
                              },
                              child: Text('My Contribution',
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.bold,
                                    color: _currentIndex == 1
                                        ? Colors.black
                                        : Colors.white,
                                  )),
                            ),
                          ),
                          Expanded(
                            child: FlatButton(
                              onPressed: () {},
                              child: Text('Projects',
                                  style: TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ))),
          ),
          drawer: InkWell(onTap: () {}, child: Drawer()),
//       drawer: new Drawer(
//         child: new ListView(
//           children: <Widget>[
// //            header
//             new UserAccountsDrawerHeader(
//               accountName: Text('Me'),
//               accountEmail:
//                   Text('Me', style: TextStyle(fontWeight: FontWeight.bold)),
//               currentAccountPicture: GestureDetector(
//                 child: new CircleAvatar(
//                   backgroundColor: Colors.grey,
//                   child: Icon(
//                     Icons.person,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               decoration: new BoxDecoration(color: _customColour.color1),
//             ),

// //            body

//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('Home Page'),
//                 leading: Icon(Icons.home),
//               ),
//             ),

//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('My account'),
//                 leading: Icon(Icons.person),
//               ),
//             ),

//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('My Orders'),
//                 leading: Icon(Icons.shopping_basket),
//               ),
//             ),

//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('Categoris'),
//                 leading: Icon(Icons.dashboard),
//               ),
//             ),

//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('Favourites'),
//                 leading: Icon(Icons.favorite),
//               ),
//             ),

//             Divider(),

//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('Settings'),
//                 leading: Icon(
//                   Icons.settings,
//                   color: Colors.blue,
//                 ),
//               ),
//             ),

//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('About'),
//                 leading: Icon(Icons.help, color: Colors.green),
//               ),
//             ),
//           ],
//         ),
//       ),
          // backgroundColor: HexColor("#d1e9ea"),
          body: _children[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: _currentIndex,
            onTap: onTabTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: _customColour.color1),
                title: new Text(
                  'HOME',
                  style: TextStyle(color: _customColour.color1),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: _customColour.color1),
                title: new Text(
                  'PROFILE',
                  style: TextStyle(color: _customColour.color1),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add, color: _customColour.color1),
                title: new Text(
                  'POST PROJECT',
                  style: TextStyle(color: _customColour.color1),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.exit_to_app, color: _customColour.color1),
                title: new Text(
                  'SIGN OUT',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      } else if (state is HomepageLoaded) {
        return Scaffold(backgroundColor: Colors.white, body: Loading());
      } else {
        return Scaffold(backgroundColor: Colors.white, body: Loading());
      }
    }));
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
