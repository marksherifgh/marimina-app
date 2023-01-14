import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marimina_app/constants.dart';
import 'package:marimina_app/song_detail_screen.dart';
import 'package:marimina_app/widgets.dart';
import 'package:marimina_app/data/songs.dart';

class SongsListScreen extends StatefulWidget {
  SongsListScreen({Key? key}) : super(key: key);

  @override
  State<SongsListScreen> createState() => _SongsListScreenState();
}

class _SongsListScreenState extends State<SongsListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        color: ConstantColors.backgroundColor,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 84.h),
              titleWidget('كلمات الترانيم'),
              SizedBox(height: 42.h),
              searchBar(),
              SizedBox(
                height: 630.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    thickness: 1,
                    color: ConstantColors.navbarColor,
                  ),
                  itemBuilder: (context, index) {
                    var name = songs[index]['name'] as String;
                    var lyrics = songs[index]['lyrics'] as String;
                    return InkWell(
                        onTap: () => Navigator.of(context).push(
                            (MaterialPageRoute(
                                builder: (_) => SongDetailScreen(
                                    songName: name, songLyrics: lyrics)))),
                        child: listChild(name));
                  },
                  itemCount: songs.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBar() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 45.h,
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        child: TextField(
          style: TextStyle(color: Colors.white),
          controller: searchController,
          onChanged: (value) => searchResults(value),
          decoration: InputDecoration(
            hintText: 'ابحث عن اسم الترنيمة...',
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(color: ConstantColors.borderColor)),
            hintStyle: const TextStyle(color: Colors.white),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
              size: 20.sp,
            ),
            filled: true,
            fillColor: ConstantColors.navbarColor,
            contentPadding: EdgeInsets.all(0.r),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(color: ConstantColors.borderColor)),
          ),
        ),
      ),
    );
  }

  void searchResults(String query) {}
}
