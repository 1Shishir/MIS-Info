import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_info/screen/items/iconed_text.dart';
import 'package:mis_info/screen/items/provider/detail_data_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemDetails extends ConsumerWidget {
  const ItemDetails({super.key});
  Future<void> _launchDialer(String phoneNumber) async {
  
  try{  final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);}
    catch(e){
      rethrow;
    }
  }

  void _launchEmail(String emailAddress) async {
    
   try{ final Uri emailUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
    );
      await launchUrl(emailUri);
   }
   catch(e){
    rethrow;
   }
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final detailsUserData = ref.watch(detaildataProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Detailed Info"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
              child: Image.asset("assets/images/profile.png",height: 150,width: 150,fit: BoxFit.fill,),
            ),
            const SizedBox(height: 20,),
            Text(detailsUserData.name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            const SizedBox(height: 20,),
            IconedText(icon: Icons.description, text: detailsUserData.designation),
            const SizedBox(height: 5,),
            IconedText(icon: Icons.call, text: detailsUserData.mobile),
            const SizedBox(height: 5,),
            IconedText(icon: Icons.email, text: detailsUserData.email),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                         _launchDialer(detailsUserData.mobile);
                      },
                      child: const Center(child: IconedText(icon: Icons.call, text: "Call"))),
                ),
                    const SizedBox(width: 10,),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                         _launchEmail(detailsUserData.email); 
                      },
                      child: const Center(child: IconedText(icon: Icons.email, text: "Email"))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
