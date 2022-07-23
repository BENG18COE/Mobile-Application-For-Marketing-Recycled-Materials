import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocls.dart';
import '../../data.dart';
import '../../models/product_model.dart';
import '../../widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => ProfileScreen());
  }

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //int _selectedIndex = 0;
  int favValue = 0;
  GlobalKey<ScaffoldState> _drawerKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _drawerKey,
        bottomNavigationBar: BottomAppBar(
          color: Colors.lightGreen[900],
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _drawerKey.currentState!.openEndDrawer();
                  },
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
        endDrawer: Drawer(
          child: CustomDrawer(),
        ),
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: 'Profile'),
        body: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                  if (state is CategoryLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is CategoryLoaded) {
                    return CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 1.5,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                      ),
                      items: state.categories
                          .map((category) =>
                              HeroCarouselCard(category: category))
                          .toList(),
                    );
                  } else {
                    return Text('Something Went Wrong');
                  }
                }),
              ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[900]!.withAlpha(50),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[900],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Click here to post your recycleble',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.white)),
                          Expanded(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/upload');
                                },
                                child: Text('post now')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _badge(int value) {
    return Positioned(
      top: 1,
      right: 1,
      child: Container(
        height: 13,
        width: 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFF4CDA63),
        ),
        child: Center(
          child: Text(
            value.toString(),
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}

// class ExerciseSearch extends SearchDelegate<Exercise> {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(
//           Icons.clear,
//           color: Color(0xFF4CDA63),
//         ),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(
//         Icons.arrow_back,
//         color: Color(0xFF4CDA63),
//       ),
//       onPressed: () {
//         // close(context, null);
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return Expanded(child: ListView());
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(2),
//       color: Color(0xFF4CDA63),
//       child: Text(
//         query,
//         style: TextStyle(color: Colors.white, fontSize: 27),
//       ),
//     );
//   }
// }
