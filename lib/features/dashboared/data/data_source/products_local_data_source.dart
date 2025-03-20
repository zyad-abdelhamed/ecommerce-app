import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:hive/hive.dart';

const String hiveKeyProducts = "products";

abstract class BaseProductsLocalDataSource {
  List<Product> fetchLocalProducts();
  void storeProductsLocaly({required List<Product> remoteProducts});
}

class ProductsLocalDataSource extends BaseProductsLocalDataSource {
  Box<Product> productsBox = Hive.box<Product>(hiveKeyProducts);
  
  @override
  List<Product> fetchLocalProducts() {
    return productsBox.values.toList();
  }
  
  @override
  void storeProductsLocaly({required List<Product> remoteProducts}) {
    productsBox.addAll(remoteProducts);
  }
}
