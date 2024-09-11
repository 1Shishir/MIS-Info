import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_info/common/color_pallate.dart';
import 'package:mis_info/model/items_model.dart';
import 'package:mis_info/screen/home/riverpod/title_provider.dart';
import 'package:mis_info/screen/items/items.dart';

class ItemListScreen extends ConsumerWidget {
  const ItemListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String title = ref.watch(titleProvider);

    List<ItemsModel> itemsList = [
      ItemsModel(title: "abc", subTitle: "xyz"),
      ItemsModel(title: "abd", subTitle: "xyz"),
      ItemsModel(title: "abe", subTitle: "xyz"),
      ItemsModel(title: "abf", subTitle: "xyz"),
      ItemsModel(title: "abf", subTitle: "xyz"),
      ItemsModel(title: "abs", subTitle: "xyz"),
      ItemsModel(title: "abs", subTitle: "xyz"),
      ItemsModel(title: "abw", subTitle: "xyz"),
      ItemsModel(title: "abw", subTitle: "xyz"),
      ItemsModel(title: "abq", subTitle: "xyz"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        itemCount: itemsList.length,
        itemBuilder: (context, index) => Items(
          name: itemsList[index].title,
          designation: itemsList[index].subTitle,
          color: ColorPallate.deepGreen,
        ),
      ),
    );
  }
}
