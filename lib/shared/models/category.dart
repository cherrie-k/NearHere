import 'package:flutter/material.dart';

enum CategoryKey {
  WARN,
  FOOD,
  FUN,
  CUTE,
  ETC,
}

class Category {
  final String text;
  final String iconPath;
  final String iconPathColored;
  final Color color;

  const Category({
    required this.text,
    required this.iconPath,
    required this.iconPathColored,
    required this.color,
  });
}

const Map<CategoryKey, Category> categories = {
  CategoryKey.WARN: Category(
    text: '위험',
    iconPath: 'assets/icons/warn_icon.svg',
    iconPathColored: 'assets/icons/warn_icon_colored.svg',
    color: Color(0xFFFFC9C9),
  ),
  CategoryKey.FOOD: Category(
    text: '먹거리',
    iconPath: 'assets/icons/food_icon.svg',
    iconPathColored: 'assets/icons/food_icon_colored.svg',
    color: Color(0xFFDDFFC7),
  ),
  CategoryKey.FUN: Category(
    text: '볼거리',
    iconPath: 'assets/icons/fun_icon.svg',
    iconPathColored: 'assets/icons/fun_icon_colored.svg',
    color: Color(0xFFD7EEFF),
  ),
  CategoryKey.CUTE: Category(
    text: '귀여움',
    iconPath: 'assets/icons/cute_icon.svg',
    iconPathColored: 'assets/icons/cute_icon_colored.svg',
    color: Color(0xFFFFF5C2),
  ),
  CategoryKey.ETC: Category(
    text: '기타',
    iconPath: 'assets/icons/etc_icon.svg',
    iconPathColored: 'assets/icons/etc_icon_colored.svg',
    color: Color(0xFFEDEDED),
  ),
};

Category getCategory(CategoryKey key) {
  return categories[key] ?? categories[CategoryKey.ETC]!;
}
