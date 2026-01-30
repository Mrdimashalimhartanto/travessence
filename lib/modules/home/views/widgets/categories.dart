import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travessence/modules/home/controllers/home_controller.dart';

class Categories extends StatelessWidget {
  Categories({super.key});

  // ambil controller secara eksplisit
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length, // fixed list, no need Obx
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          return Obx(() {
            final selected = i == controller.selectedCategoryIndex.value;
            return InkWell(
              onTap: () => controller.selectCategory(i),
              borderRadius: BorderRadius.circular(18),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: selected ? const Color(0xFFE6F0FF) : Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: selected
                        ? const Color(0xFF3A7BFF)
                        : const Color(0xFFE6E8EF),
                  ),
                ),
                child: Text(
                  controller.categories[i],
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: selected
                        ? const Color(0xFF2563EB)
                        : const Color(0xFF111827),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
