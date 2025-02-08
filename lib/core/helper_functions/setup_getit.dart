import 'package:ecommerce_application/core/services/dependancy_injection/auth_dependency_injection.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/payment_dependency_injection.dart';

void setupGetit() {
  AuthDependencyInjection.init();
  PaymentDependencyInjection.init();
  DashboardDebendencyInjection.init();
  GlobalDependencyInjection.init();
}
