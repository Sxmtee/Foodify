import 'package:foodify/Controllers/cart_controller.dart';
import 'package:foodify/Data/Repository/popular_product_repo.dart';
import 'package:foodify/Models/products_model.dart';
import 'package:foodify/Utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      return 0;
    } else if (quantity > 20) {
      Get.snackbar("Item count", "You can't add more",
          backgroundColor: AppColors.mainColor, colorText: AppColors.allWhite);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    //if exists
    //get from storage _inCartItems
  }

  void addItem(ProductModel product) {
    if (quantity > 0) {
      _cart.addItem(product, _quantity);
      _quantity = 0;
    } else {
      Get.snackbar("Add to Cart", "Add an Item in the Cart",
          backgroundColor: AppColors.mainColor, colorText: AppColors.allWhite);
    }
  }
}
