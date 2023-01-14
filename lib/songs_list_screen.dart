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

class _SongsListScreenState extends State<SongsListScreen> {
  TextEditingController searchController = TextEditingController();
  List songs = [];
  List searchSongs = [];
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: ConstantColors.backgroundColor,
          child: Center(
              child: FutureBuilder(
                  future: loadSongs(),
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
                                    ? searchSongs[index]['title']
                                    : songs[index]['title'] as String;
                                var lyrics = isSearching
                                    ? getLyrics(searchSongs[index])
                                    : getLyrics(songs[index]);
                                return InkWell(
                                    onTap: () => Navigator.of(context).push(
                                        (MaterialPageRoute(
                                            builder: (_) => SongDetailScreen(
                                                songName: name,
                                                songLyrics: lyrics)))),
                                    child: listChild(name));
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

  Widget searchBar() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 45.h,
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        child: TextField(
          style: const TextStyle(color: Colors.white),
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

  void searchResults(String query) {
    if (query != '') {
      setState(() {
        isSearching = true;
        searchSongs = songs.where((song) {
          return song['title'].contains(query);
        }).toList();
      });
    } else {
      setState(() {
        isSearching = false;
      });
    }
  }

  Future<List> loadSongs() async {
    var input = await rootBundle.loadString('assets/data/songs.json');
    List songs = jsonDecode(input);
    return songs;
  }

  String getLyrics(Map song) {
    String lyrics = '';
    List verses = song['verses'];
    if (song.containsKey('formated') && song.containsKey('chorus')) {
      String chorus = '';
      for (int i = 0; i < song['chorus'].length; i++) {
        chorus += song['chorus'][i];
        if (i < song['chorus'].length) {
          chorus += ' ';
        }
      }
      if (song.containsKey('chorusFirst')) {
        lyrics += chorus;
      }
      for (int i = 0; i < verses.length; i++) {
        for (int j = 0; j < verses[i].length; j++) {
          lyrics += ' ${verses[i][j]}';
        }
        lyrics += ' $chorus';
      }
    } else {
      for (int i = 0; i < verses.length; i++) {
        for (int j = 0; j < verses[i].length; j++) {
          lyrics += ' ${verses[i][j]}';
        }
      }
    }

    return lyrics;
  }
}
