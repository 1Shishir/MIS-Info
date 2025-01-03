import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mis_info/model/grid_view_item_model.dart';

part 'home_provider.g.dart';

@riverpod
List<GridViewItemModel> homeItem(HomeItemRef ref) {
  return [
    GridViewItemModel(
        title: "Teacher Info", img: "assets/images/faculty_info.svg"),
    GridViewItemModel(title: "Batches", img: "assets/images/batches.svg"),
    GridViewItemModel(title: "Staff Info", img: "assets/images/staff_info.svg"),
    GridViewItemModel(
        title: "Academic\nCalender",
        img: "assets/images/academic_calender.svg"),
    GridViewItemModel(
        title: "Course\nCurriculum", img: "assets/images/img.svg"),
    GridViewItemModel(title: "Bus\nSchedule", img: "assets/images/img.svg"),
    GridViewItemModel(title: "About MIS", img: "assets/images/about_mis.svg"),
  ];
}
