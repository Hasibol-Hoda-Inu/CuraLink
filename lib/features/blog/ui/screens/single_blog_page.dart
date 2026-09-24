import 'package:curalink/application/assets_path.dart';
import 'package:curalink/features/blog/ui/contents/healthiest_fruits.dart';
import 'package:curalink/features/common/ui/widgets/section_header.dart';
import 'package:curalink/features/home/ui/widgets/article_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleBlogPage extends StatefulWidget {
  const SingleBlogPage({super.key});

  @override
  State<SingleBlogPage> createState() => _SingleBlogPageState();
}

class _SingleBlogPageState extends State<SingleBlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Article Detail", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 20.0.w,
          right: 20.w,
          bottom: 20.h
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  AssetsPath.blogBannerImg,
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20.h,),
              Text(BlogContent.title, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),),
              SizedBox(height: 10.h,),
              MarkdownBody(
                data: BlogContent.content,
                styleSheet: MarkdownStyleSheet(
                  p: TextStyle(
                    fontSize: 14.sp,
                    height: 1.4,
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              SectionHeader(title: "Related Articles", onClick: (){}),
              ArticleContainer(onClick: (){}),
            ],
          ),
        ),
      ),
    );
  }
}
