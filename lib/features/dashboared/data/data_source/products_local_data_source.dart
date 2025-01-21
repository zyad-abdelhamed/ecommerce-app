import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:hive/hive.dart';

const String hiveKeyProducts = "products";

abstract class BaseProductsLocalDataSource {
  List<Product> fetchProducts();
}

class ProductsLocalDataSource extends BaseProductsLocalDataSource {
  // @override
  // List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
  //   int startIndex = pageNumber * 10;
  //   int endIndex = (pageNumber + 1) * 10;

  //   var box = Hive.box<BookEntity>(kFeaturedBox);
  //   int length = box.values.length;
  //   if (startIndex >= length || endIndex > length) {
  //     return [];
  //   }
  //   return box.values.toList().sublist(startIndex, endIndex);
  // }

  // @override
  // List<BookEntity> fetchNewestBooks() {
  //   var box = Hive.box<BookEntity>(kNewestBox);
  //   return box.values.toList();
  // }

  @override
  List<Product> fetchProducts() {
    Box<Product> productsBox = Hive.box<Product>(hiveKeyProducts);
    return productsBox.values.toList();
  }
}
