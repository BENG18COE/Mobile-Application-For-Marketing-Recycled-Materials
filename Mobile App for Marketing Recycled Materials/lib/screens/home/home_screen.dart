import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:trial/blocs/blocls.dart';
import 'package:trial/widgets/widgets.dart';

import '../../features/authentication/bloc/authentication_bloc.dart';
import '../../view/view.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => HomeScreen());
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final Stream<QuerySnapshot> users;
    users = FirebaseFirestore.instance
        .collection('products')
        .where('isRecommended', isEqualTo: true)
        .snapshots();

      return Scaffold(
        appBar: CustomAppBar(title: 'Recycling'),
        bottomNavigationBar: CustomNavBar(screen: routeName),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
              SectionTitle(title: 'RECOMMENDED'),
              BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(
                      products: state.products
                          .where((product) => product.isRecommended)
                          .toList());
                } else {
                  return Text('Something Went Wrong');
                }
              }),
              SectionTitle(title: 'MOST POPULAR'),
              BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(
                      products: state.products
                          .where((product) => product.isPopular)
                          .toList());
                } else {
                  return Text('Something Went Wrong');
                }
              }),
            ],
          ),
        ),
      );

  }

  Color textColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Color titleColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      return Colors.white;
    } else {
      return Colors.blue.shade300;
    }
  }
}
