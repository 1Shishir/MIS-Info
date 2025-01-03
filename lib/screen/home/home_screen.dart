import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_info/common/color_sequence.dart';
import 'package:mis_info/model/grid_view_item_model.dart';
import 'package:mis_info/screen/about_mis.dart';
import 'package:mis_info/screen/home/gird_view_item.dart';
import 'package:mis_info/screen/home/riverpod/home_provider.dart';
import 'package:mis_info/screen/home/riverpod/title_provider.dart';
import 'package:mis_info/screen/items/item_list_screen.dart';
import 'package:mis_info/screen/items/pdf_viewer_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<GridViewItemModel> items = ref.watch(homeItemProvider);

    List<String> personCategory = [
      "teachers",
      "students",
      "staff",
      "academic_calender",
      "course_curriculum",
      "bus_schedule",
      "about_mis"
    ];

    return Scaffold(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                      ref.read(personCategoryProvider.notifier).state =
                          personCategory[index];
                      ref.read(titleProvider.notifier).state =
                          items[index].title;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            switch (personCategory[index]) {
                              case "teachers":
                                return const ItemListScreen();

                              case "students":
                                return const ItemListScreen();

                              case "staff":
                                return const ItemListScreen();
                              case "academic_calender":
                                return const PdfViewerFromAsset(
                                  pdfUrl: "assets/pdf/academic_calender.pdf",
                                  title: "Academic Calender",
                                );

                              case "course_curriculum":
                                return const PdfViewerFromAsset(
                                  pdfUrl: "assets/pdf/course_curiculum.pdf",
                                  title: "Course Curriculum",
                                );

                              case "bus_schedule":
                                return const PdfViewerFromAsset(
                                  pdfUrl: "assets/pdf/bus_schedule.pdf",
                                  title: "Bus Schedule",
                                );
                              case "about_mis":
                                return const AboutMis();
                              default:
                                return const Scaffold(
                                  body: Center(child: Text('item not found')),
                                );
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
