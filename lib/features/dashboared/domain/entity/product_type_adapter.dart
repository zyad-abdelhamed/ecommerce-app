import 'package:ecommerce_application/features/dashboared/domain/entity/product.dart';
import 'package:hive_flutter/adapters.dart';

class ProductTypeAdapter extends TypeAdapter<Product> {
  @override
  read(BinaryReader reader) {
    return Product(
        name: reader.readString(),
        price: reader.readInt(),
        id: reader.readInt(),
        description: reader.readString(),
        oldprice: reader.readInt(),
        image: reader.readString(),
        discount: reader.readInt());
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Product obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.description);
    writer.writeInt(obj.price);
    writer.writeInt(obj.oldprice);
    writer.writeInt(obj.discount);
    writer.writeString(obj.image);
  }
}
