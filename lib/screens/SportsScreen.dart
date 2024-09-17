import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rests_api/screens/NewsDetails.dart';
import 'package:rests_api/service/NewsService.dart';

import '../model/NewsModel.dart';

class SportsScreen extends StatefulWidget {
  const SportsScreen({super.key});

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {

  bool newsData = true;

  late Future<List<NewsModel>> news;

  @override
  void initState() {
    // TODO: implement initState
    news = NewsService().fetchFromNewsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("News"),),
      body: FutureBuilder<List<NewsModel>>(
          future: news,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length, 
                  itemBuilder: (context, index) {
                    final newsItem = (snapshot).data![index];
                    return ListTile(
                      onTap: () {
                        Get.to(NewsDetails(model: newsItem));
                      },
                      title: Text(newsItem.title ?? ""),
                      leading: !newsData ?
                      Image.network(newsItem.urlToImage ?? snapshot.data![0].urlToImage!, width: width * .4, fit: BoxFit.fitWidth,) :
                      Image.network(newsItem.imageUrl ?? snapshot.data![0].imageUrl!, width: width * .4, fit: BoxFit.fitWidth,),
                    );
                  });
            } else if(!snapshot.hasData) {
              return const Center(child: Text("No Data Found"),);
            }  else {
              return const Center(child: Text("No Data Found"),);
            }
          }
      )
    );
  }
}
