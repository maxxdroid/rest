import 'package:flutter/material.dart';
import 'package:rests_api/model/NewsModel.dart';

class NewsDetails extends StatefulWidget {
  final NewsModel model;
  const NewsDetails({super.key, required this.model});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.model.title ?? ""),
            SizedBox(height: 10,),
            Image.network(widget.model.urlToImage!, height: height * .5, fit: BoxFit.fitHeight,),
            SizedBox(height: height * .5, child: Text(widget.model.content!),)
          ],
        ),
      ),
    );
  }
}
