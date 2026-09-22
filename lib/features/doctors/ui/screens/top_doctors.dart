import 'package:curalink/features/doctors/ui/widgets/top_doc_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TopDoctors extends StatefulWidget {
  const TopDoctors({super.key});

  @override
  State<TopDoctors> createState() => _TopDoctorsState();
}

class _TopDoctorsState extends State<TopDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Doctors", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 20.h,
          children: [
            Text("Showing 48 verified\nspecialists"),
            Expanded(
              child: ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (context, index)=> SizedBox(height: 20.h,),
                  itemBuilder: (context, index)=> TopDocCard(onClick: toDocDetails,)),
            ),
          ],
        ),
      ),
    );
  }
  void toDocDetails(){
    GoRouter.of(context).pushNamed("docDetails");
  }
}


