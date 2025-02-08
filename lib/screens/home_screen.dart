import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/webtoon_model.dart';
import '../service/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static const userAgent = "Mozilla/5.0"
      "(Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36"
      "(KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36";

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeList(snapshot),
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Column(
          children: [
            Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: Offset(10, 10),
                    color: Colors.black.withAlpha(130),
                  )
                ],
              ),
              child: Image.network(
                webtoon.thumb,
                headers: const {
                  "User-Agent": userAgent,
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              webtoon.title,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        width: 40,
      ),
    );
  }
}
