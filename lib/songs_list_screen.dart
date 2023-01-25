import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marimina_app/constants.dart';
import 'package:marimina_app/song_detail_screen.dart';
import 'package:marimina_app/widgets.dart';

class SongsListScreen extends StatefulWidget {
  SongsListScreen({Key? key}) : super(key: key);

  @override
  State<SongsListScreen> createState() => _SongsListScreenState();
}

class _SongsListScreenState extends State<SongsListScreen>
    with AutomaticKeepAliveClientMixin {
  late final Future future;

  @override
  bool get wantKeepAlive => true;
  TextEditingController searchController = TextEditingController();
  List songs = [];
  List searchSongs = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    future = loadSongs();
  }

  @override
  Widget build(BuildContext context) {
    searchController.selection = TextSelection.fromPosition(
        TextPosition(offset: searchController.text.length));

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: ConstantColors.backgroundColor,
          child: Center(
              child: FutureBuilder(
                  future: future,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      songs = snapshot.data as List;
                      return Column(
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
                                var name = isSearching
                                    ? searchSongs[index]['name']
                                    : songs[index]['name'] as String;
                                var lyrics = isSearching
                                    ? searchSongs[index]['lyrics']
                                    : songs[index]['lyrics'];
                                return Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                      onTap: () => Navigator.of(context).push(
                                          (MaterialPageRoute(
                                              builder: (_) => SongDetailScreen(
                                                  songName: name,
                                                  songLyrics: lyrics)))),
                                      child: listChild(name)),
                                );
                              },
                              itemCount: isSearching
                                  ? searchSongs.length
                                  : songs.length,
                            ),
                          )
                        ],
                      );
                    }
                    return const SizedBox();
                  })),
        ));
  }

  void searchResults(String query) {
    query = query.toLowerCase();
    if (query != '') {
      isSearching = true;
      searchSongs = songs.where((song) {
        String name = song['name'].toLowerCase();
        return name.contains(query);
      }).toList();
      setState(() {});
    } else {
      setState(() {
        isSearching = false;
      });
    }
  }

  Widget searchBar() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 45.h,
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        child: TextField(
          textDirection: TextDirection.rtl,
          style: const TextStyle(color: Colors.white),
          controller: searchController,
          onChanged: (value) => searchResults(value),
          decoration: InputDecoration(
            hintText: 'ابحث عن اسم الترنيمة...',
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(color: ConstantColors.searchColor)),
            hintStyle: const TextStyle(color: Colors.white54),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
              size: 20.sp,
            ),
            filled: true,
            fillColor: ConstantColors.searchColor,
            contentPadding: EdgeInsets.all(0.r),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(color: ConstantColors.searchColor)),
          ),
        ),
      ),
    );
  }

  Future<List> loadSongs() async {
    var input = await rootBundle.loadString('assets/data/songs.json');
    List songs = jsonDecode(input);
    return songs;
  }
}
