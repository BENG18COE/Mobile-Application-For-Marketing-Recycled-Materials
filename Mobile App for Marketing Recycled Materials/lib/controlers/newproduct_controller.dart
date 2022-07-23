import 'package:get/get.dart';
import 'package:trial/models/models.dart';

class NewProductController extends GetxController {
  List<NewProduct> products = NewProduct.products.obs;

  void updateProductPrice(
    int index,
    NewProduct newProduct,
    double value,
  ) {
    newProduct.price = value;
    products[index] = newProduct;
  }

  void updateProductQuantity(
    int index,
    NewProduct newProduct,
    int value,
  ) {
    newProduct.quantity = value;
    products[index] = newProduct;
  }
}
