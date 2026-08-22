import 'package:curalink/application/app_colors.dart';
import 'package:curalink/application/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        child: ListView.separated(

            itemCount: 10,
            separatorBuilder: (context, index)=> SizedBox(height: 20.h,),
            itemBuilder: (context, index)=> TopDocCard()),
      ),
    );
  }
}

class TopDocCard extends StatelessWidget {
  const TopDocCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: BoxBorder.all(color: Colors.grey.shade300),
      ),
      child: Row(
        spacing: 8.w,
        children: [
          Image.asset(AssetsPath.topDoc, height: 96.h,),
          Expanded(
              child: Column(
                crossAxisAlignment: .start,
            children: [
              Text("Dr. Vaamana", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),),
              Text("Orthopaedic", style: TextStyle(color: AppColors.greyText),),
              Chip(
                padding: EdgeInsets.all(2),
                  side: BorderSide.none,
                  avatar: Icon(Icons.star_rounded, color: AppColors.primaryColor,),
                  label: Text("4.7", style: TextStyle(color: AppColors.primaryColor),),
                backgroundColor: AppColors.primaryColor.withAlpha(17),
              ),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.grey.shade400,),
                  Text("800m away", style: TextStyle(color: AppColors.greyText),),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
