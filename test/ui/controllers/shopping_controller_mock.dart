import 'package:f_shopping_app_activity/domain/product.dart';
import 'package:f_shopping_app_activity/ui/controllers/shopping_controller.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

class ShoppingControllerMock extends GetxService
    with Mock
    implements ShoppingController {
  @override
  var entries = <Product>[].obs;
  @override
  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    entries.add(Product(0, "Toy car", 10));
    entries.add(Product(1, "Toy house", 20));
  }

  @override
  void calcularTotal() {}

  @override
  agregarProducto(id) {}

  @override
  quitarProducto(id) {}
}
