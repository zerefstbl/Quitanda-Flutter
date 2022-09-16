import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/src/pages/home/components/item.tile.dart';

import './components/category.tile.dart';

import '../../config/custom.colors.dart';
import '../../config/app.data.dart' as appData;

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(fontSize: 27),
            children: [
              TextSpan(
                  text: 'Green',
                  style: TextStyle(color: CustomColors.customSwatchColor)),
              TextSpan(
                  text: 'grocer',
                  style: TextStyle(color: CustomColors.customContrastColor)),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: CustomColors.customSwatchColor,
                ),
              ),
            ),
          ),
        ],
      ),

      // Corpo
      body: Column(
        children: [
          // Campo de Pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                isDense: true,
                fillColor: Colors.white,
                hintText: 'Pesquise Aqui',
                hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                prefixIcon: Icon(
                  Icons.search,
                  color: CustomColors.customContrastColor,
                  size: 21,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: const BorderSide(
                    style: BorderStyle.none,
                    width: 0,
                  ),
                ),
              ),
            ),
          ),

          // Categorias
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CategoryTile(
                  category: appData.categories[index],
                  isSelected: appData.categories[index] == selectedCategory,
                  onPressed: () => setState(
                      () => selectedCategory = appData.categories[index]),
                );
              },
              separatorBuilder: (_, index) => const SizedBox(width: 10),
              itemCount: appData.categories.length,
            ),
          ),

          // Grid Produtos
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 11.5,
              ),
              itemCount: appData.items.length,
              itemBuilder: (_, index) {
                return ItemTile(
                  item: appData.items[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
