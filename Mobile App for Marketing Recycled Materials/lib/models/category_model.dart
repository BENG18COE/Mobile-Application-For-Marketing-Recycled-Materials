import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(
      name: snap['name'],
      imageUrl: snap['imageUrl'],
    );
    return category;
  }

  // static List<Category> categories = [
  //   Category(
  //       name: 'Dumped Cars',
  //       imageUrl:
  //           'https://ichef.bbci.co.uk/news/976/cpsprodpb/E608/production/_116088885_carcrash-1.jpg'),
  //   Category(
  //       name: 'Dumped Plastic Tanks',
  //       imageUrl: 'https://www.restoreservices.co.ke/images/gallery/proj2.jpg'),
  //   Category(
  //       name: 'Unused Container',
  //       imageUrl:
  //           'https://www.truck1.eu/img/Swap_body_Container_Shipping_container_20_Container_c_w_Seismic_Acquisition_Sensor_Cables-ful-9728/9728_7471254422134.jpg'),
  // ];
}
