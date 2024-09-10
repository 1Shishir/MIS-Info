import 'package:flutter/material.dart';
import 'package:mis_info/common/color_sequence.dart';
import 'package:mis_info/model/grid_view_item_model.dart';
import 'package:mis_info/widget/gird_view_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<GridViewItemModel> items = [
      GridViewItemModel(
          title: "Teacher Info", img: "assets/images/faculty_info.svg"),
      GridViewItemModel(title: "Batches", img: "assets/images/batches.svg"),
      GridViewItemModel(
          title: "Staff Info", img: "assets/images/staff_info.svg"),
      GridViewItemModel(
          title: "Academic\nCalender",
          img: "assets/images/academic_calender.svg"),
      GridViewItemModel(
          title: "Course\nCurriculum", img: "assets/images/img.svg"),
      GridViewItemModel(title: "Books", img: "assets/images/books.svg"),
      GridViewItemModel(title: "Bus\nSchedule", img: "assets/images/img.svg"),
      GridViewItemModel(
          title: "Phone Book", img: "assets/images/phone_book.svg"),
      GridViewItemModel(title: "About MIS", img: "assets/images/about_mis.svg"),
    ];

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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                        )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
