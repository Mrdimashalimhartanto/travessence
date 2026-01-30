import 'package:get/get.dart';
import 'package:travessence/modules/home/model/detail_promo.dart';

class HomeController extends GetxController {
  DateTime timeBackPressed = DateTime.now();

  /// ======================
  /// CATEGORY
  /// ======================
  final categories = <String>[].obs;
  final selectedCategoryIndex = 0.obs;

  /// ======================
  /// PROMO (reactive wrapper)
  /// ======================
  final RxList<PromoModel> promos = <PromoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initCategories();
    _initPromo();
  }

  /// ======================
  /// INIT CATEGORY
  /// ======================
  void _initCategories() {
    categories.assignAll([
      'Semua',
      'Pesawat',
      'Hotel',
      'Villa & Apt',
      'To Do',
      'Kereta Api',
      'Sewa Mobil',
      'Jemputan Bandara',
    ]);
  }

  /// ======================
  /// INIT PROMO (DARI FILE MODEL)
  /// ======================
  void _initPromo() {
    promos.assignAll(promoList);
  }

  /// ======================
  /// FILTER PROMO (AMAN)
  /// ======================
  List<PromoModel> get filteredPromo {
    if (promos.isEmpty || categories.isEmpty) {
      return [];
    }

    final index = selectedCategoryIndex.value;

    if (index < 0 || index >= categories.length) {
      return promos;
    }

    final selectedCategory = categories[index].toLowerCase().trim();

    if (selectedCategory == 'semua') {
      return promos;
    }

    return promos.where((promo) {
      return promo.category.toLowerCase().trim() == selectedCategory;
    }).toList();
  }

  /// ======================
  /// ACTION
  /// ======================
  void selectCategory(int index) {
    if (index < 0 || index >= categories.length) return;
    selectedCategoryIndex.value = index;
  }
}
