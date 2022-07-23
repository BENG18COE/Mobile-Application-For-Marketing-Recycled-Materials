import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trial/blocs/blocls.dart';
import 'package:trial/widgets/widgets.dart';

class NewProductScreen extends StatelessWidget {
  static const String routeName = '/newproduct';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => NewProductScreen());
  }

  const NewProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'New Product'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.lightGreen[900]!.withAlpha(50),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        ImagePicker _picker = ImagePicker();
                        final XFile? _image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        if (_image == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Look you did not pick an Image'),
                            ),
                          );
                        }

                        if (_image != null) {}
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Add a Image of a product',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Product Information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                //color: Colors.white,
              ),
            ),
            _buildTextFormField('Product Id'),
            _buildTextFormField('Product Name'),
            _buildTextFormField('Product Description'),
            _buildTextFormField('Product Category'),
            _buildTextFormField('Product Price'),
            _buildTextFormField('Product Quantity'),
            const SizedBox(height: 20),
            _buildCheckBox('Recommended'),
            _buildCheckBox('Popular'),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print('save');
                },
                style:
                    ElevatedButton.styleFrom(primary: Colors.lightGreen[900]),
                child: Text(
                  'save',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    //color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildCheckBox(String title) {
    return Row(
      children: [
        SizedBox(
          width: 125,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              //color: Colors.white,
            ),
          ),
        ),
        Checkbox(
            value: true,
            checkColor: Colors.black,
            activeColor: Colors.black12,
            onChanged: (value) {}),
      ],
    );
  }

  TextFormField _buildTextFormField(String hintText) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
