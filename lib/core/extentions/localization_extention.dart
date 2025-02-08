import 'package:ecommerce_application/core/localization/localization_proxy.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';

extension ResponsiveExtention on String {
  String get localization => sl<BaseLocalization>().localization[this];
}
