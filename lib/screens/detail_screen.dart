import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  static const userAgent = "Mozilla/5.0"
      "(Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36"
      "(KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36";

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
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  thumb,
                  headers: const {
                    "User-Agent": userAgent,
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
