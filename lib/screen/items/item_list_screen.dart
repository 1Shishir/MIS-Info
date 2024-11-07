import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_info/common/color_pallate.dart';
import 'package:mis_info/screen/home/riverpod/title_provider.dart';
import 'package:mis_info/screen/items/data/person.dart';
import 'package:mis_info/screen/items/item_details.dart';
import 'package:mis_info/screen/items/items.dart';
import 'package:mis_info/screen/items/provider/detail_data_provider.dart';
import 'package:mis_info/screen/items/provider/fetch_data_provider.dart';

class ItemListScreen extends ConsumerWidget {
  const ItemListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String title = ref.watch(titleProvider);
    final String personCategory = ref.watch(personCategoryProvider);
    final asyncValue = ref.watch(teachersProvider(personCategory));

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(teachersProvider);
        },
        child: asyncValue.when(
          data: (teachers) => ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            itemCount: teachers.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                if (personCategory == "students") {
                  ref.read(personCategoryProvider.notifier).state = "info";
                  ref.read(batchIndexProvider.notifier).state = (index+1).toString();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const ItemListScreen();
                    }),
                  );
                } else {
                  ref.read(detaildataProvider.notifier).state = Person(
                      name: teachers[index].name,
                      designation: teachers[index].designation,
                      mobile: teachers[index].mobile,
                      email: teachers[index].email);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const ItemDetails();
                    }),
                  );
                }
              },
              child: Items(
                name: teachers[index].name,
                designation: teachers[index].designation,
                color: ColorPallate.deepGreen,
              ),
            ),
          ),
          error: (error, stack) => Center(
            child: Text('Error: $error'),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
