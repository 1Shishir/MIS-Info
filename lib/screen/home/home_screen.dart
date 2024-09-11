import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_info/common/color_sequence.dart';
import 'package:mis_info/model/grid_view_item_model.dart';
import 'package:mis_info/screen/home/gird_view_item.dart';
import 'package:mis_info/screen/home/riverpod/home_provider.dart';
import 'package:mis_info/screen/home/riverpod/title_provider.dart';
import 'package:mis_info/screen/items/item_list_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<GridViewItemModel> items = ref.watch(homeItemProvider);

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text("MIS Info"),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/bground.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) => GirdViewItem(
                          title: items[index].title,
                          img: items[index].img,
                          color: colorSequence[index % colorSequence.length],
                          onTap: () {
                            ref.read(titleProvider.notifier).state =
                                items[index].title;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ItemListScreen(),
                                ));
                          },
                        )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
