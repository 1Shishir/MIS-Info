import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_info/screen/home/riverpod/title_provider.dart';

class AboutMis extends ConsumerWidget {
  const AboutMis({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(ref.watch(titleProvider))),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                "Welcome to the Department of Management Information Systems",
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Nowadays strong technical skills are exceedingly sought after in the evolving and dynamic business culture around the world. Considering the fact, Information can be compared to the blood and Management Information Systems (MIS) that can be compared to the heart of a modern business organization. Just like heart stimulates the necessary blood supply to all of the essential parts of the body including the brain, MIS ensures the appropriate flow of data from various operational sources of an organization; transforms and sends those data further to all the potential decision-making destinations. Thus, MIS is not a solitary term rather it is worth the definition- the knowledge of information systems; study of people, technology and organization. MIS enables smart, prolific, and inventive exertions in every field of the competitive business world. Thus, a major in Management Information Systems (MIS) will offer a compact basis of information technology (IT), how information systems (IS) are designed, developed, deployed, and used. Students with expertise in MIS will understand how technology supports business objectives and how to achieve business goals through robust decisional activities. Besides, MIS complements other business disciplines. Either a major or a minor in MIS, thus, will greatly enhance career opportunities for students. Keeping pace with the evolving demand of the present technology-based business world, Noakhali Science and Technology University (NSTU) has realized the importance of offering academic degrees and higher research opportunities in MIS with a view to meeting global demand of competent business graduate from Bangladesh. With that vision in the soul, the Department of Management Information Systems has started its journey on 17th of September, 2018. This department aims at providing students with a comprehensive understanding of Information Technology integrated with business knowledge. Currently, the department is offering a 4-Year Bachelor of Business Administration degree in MIS (BBA in MIS). Other higher study and research opportunities are on the pipeline.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
