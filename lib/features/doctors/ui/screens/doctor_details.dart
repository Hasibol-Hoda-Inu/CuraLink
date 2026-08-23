import 'package:curalink/application/app_colors.dart';
import 'package:curalink/application/assets_path.dart';
import 'package:curalink/features/doctors/ui/widgets/date_card.dart';
import 'package:curalink/features/doctors/ui/widgets/time_slot_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {

  int selectedIndex = 2;
  int selectedTimeIndex = 4;

  final List<Map<String, String>> dates = [
    {"day": "Mon", "date": "21"},
    {"day": "Tue", "date": "22"},
    {"day": "Wed", "date": "23"},
    {"day": "Thu", "date": "24"},
    {"day": "Fri", "date": "25"},
    {"day": "Sat", "date": "26"},
  ];

  final List<Map<String, dynamic>> timeSlots = [
    {"time": "09:00 AM", "isDisabled": true},
    {"time": "10:00 AM", "isDisabled": false},
    {"time": "11:00 AM", "isDisabled": true},
    {"time": "01:00 PM", "isDisabled": true},
    {"time": "02:00 PM", "isDisabled": false},
    {"time": "03:00 PM", "isDisabled": false},
    {"time": "04:00 PM", "isDisabled": false},
    {"time": "07:00 PM", "isDisabled": false},
    {"time": "08:00 PM", "isDisabled": true},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor Details", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
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
            SizedBox(height: 20.h,),
            Text("About", style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),),
            Text("Lorem ipsum dolor sit amet, consectetur adipi elit, sed do eiusmod tempor incididunt ut laore et dolore magna aliqua. Ut enim ad minim veniam",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.bodyText,
              ),
            ),
            TextButton(
                onPressed: (){},
                child: Text("Read more"),
            ),
            SizedBox(height: 20.h,),
            SizedBox(
              height: 80.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index)=> DateCard(
                  day: dates[index]["day"]!,
                  date: dates[index]["date"]!,
                  isSelected: selectedIndex == index,
                  onTap: (){
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
                separatorBuilder: (context, index)=> SizedBox(width: 16.w,),
              ),
            ),
            SizedBox(height: 24.h,),
            Divider(
              color: AppColors.primaryColor.withAlpha(34),
              height: 1,
            ),
            SizedBox(height: 24.h,),
            Wrap(
              spacing: 20.w,
              runSpacing: 14.h,
              alignment: WrapAlignment.center,
              children: List.generate(timeSlots.length, (index){
                final slot = timeSlots[index];
                return SizedBox(
                  width: 86.w,
                  child: TimeSlotChip(
                      time: slot["time"],
                      isSelected: selectedTimeIndex == index,
                      onTap: (){
                        setState(() {
                          selectedTimeIndex = index;
                        });
                      },
                  ),
                );
              }),
            ),
            SizedBox(height: 34.h,),
            ElevatedButton(onPressed: (){}, child: Text("Book Appointment"))
          ],
        ),
      ),
    );
  }
}
