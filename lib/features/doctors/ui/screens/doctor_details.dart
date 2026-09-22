import 'package:curalink/application/app_colors.dart';
import 'package:curalink/application/routes/app_route_const.dart';
import 'package:curalink/features/doctors/ui/widgets/consultation_type_card.dart';
import 'package:curalink/features/doctors/ui/widgets/date_card.dart';
import 'package:curalink/features/doctors/ui/widgets/doc_profile.dart';
import 'package:curalink/features/doctors/ui/widgets/review_chip.dart';
import 'package:curalink/features/doctors/ui/widgets/status_card.dart';
import 'package:curalink/features/doctors/ui/widgets/time_slot_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  int selectedIndex = 2;
  int selectedTimeIndex = 4;
  int selectedConsultationIndex = 0;

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
        title: Text(
          "Doctor Details",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark_border_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              DocProfileWidget(),
              SizedBox(height: 20.h),
              Row(
                spacing: 10.w,
                children: [
                  StatCard(label: "Experience", value: "10 years"),
                  StatCard(label: "Patients", value: "2.5K+"),
                  StatCard(label: "Reviews", value: "1.2K"),
                ],
              ),
              SizedBox(height: 30.h),
              Text(
                "About",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipi elit, sed do eiusmod tempor incididunt ut laore et dolore magna aliqua. Ut enim ad minim veniam Ut enim ad minim veniam",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: AppColors.bodyText),
              ),
              TextButton(onPressed: () {}, child: Text("Read more")),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Consultation Type",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                  Chip(
                    label: Text(
                      "30 Mins Session",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    backgroundColor: const Color(0xFFF4F8FF),
                    side: const BorderSide(color: Color(0xFFE0E9F8)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    labelPadding: EdgeInsets.symmetric(horizontal: 4.w),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                spacing: 12.w,
                children: [
                  Expanded(
                    child: ConsultationTypeCard(
                      title: "In-Clinic Visit",
                      subtitle: "Metro Heart Clinic",
                      price: "\$80",
                      duration: "30 min",
                      mainIcon: Icons.medical_services_rounded,
                      isSelected: selectedConsultationIndex == 0,
                      onTap: () {
                        setState(() {
                          selectedConsultationIndex = 0;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ConsultationTypeCard(
                      title: "Video Consult",
                      subtitle: "Video call via app",
                      price: "\$60",
                      duration: "30 min",
                      mainIcon: Icons.videocam_rounded,
                      isSelected: selectedConsultationIndex == 1,
                      onTap: () {
                        setState(() {
                          selectedConsultationIndex = 1;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Available Dates",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: Text("October 2026")),
                ],
              ),
              SizedBox(
                height: 80.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: dates.length,
                  itemBuilder: (context, index) => DateCard(
                    day: dates[index]["day"]!,
                    date: dates[index]["date"]!,
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 16.w),
                ),
              ),
              SizedBox(height: 24.h),
              Divider(color: AppColors.primaryColor.withAlpha(34), height: 1),
              SizedBox(height: 24.h),
              Text(
                "Available Time",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
              ),
              SizedBox(height: 16.h),
              Wrap(
                spacing: 20.w,
                runSpacing: 14.h,
                alignment: WrapAlignment.center,
                children: List.generate(timeSlots.length, (index) {
                  final slot = timeSlots[index];
                  return SizedBox(
                    width: 86.w,
                    child: TimeSlotChip(
                      time: slot["time"],
                      isSelected: selectedTimeIndex == index,
                      onTap: () {
                        setState(() {
                          selectedTimeIndex = index;
                        });
                      },
                    ),
                  );
                }),
              ),
              SizedBox(height: 34.h),
              Row(
                spacing: 10.w,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        "Total Price",
                        style: TextStyle(
                          color: AppColors.greyText,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        mainAxisSize: .min,
                        crossAxisAlignment: .end,
                        children: [
                          Text(
                            selectedConsultationIndex == 0 ? "\$80" : "\$60",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            "/30 min",
                            style: TextStyle(
                              color: AppColors.greyText,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: toAppointmentSum,
                      child: Text("Book Appointment"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toAppointmentSum() {
    GoRouter.of(context).pushNamed(AppRouteConst.appointmentSumRoute);
  }
}
