import 'package:trial/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
