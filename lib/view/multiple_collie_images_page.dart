import 'package:flutter/material.dart';
import 'package:week8/layout/arrow_layout.dart';
import 'package:week8/services/api_service.dart';

class MultipleCollieImagesPage extends StatefulWidget {
  const MultipleCollieImagesPage({super.key});

  @override
  State<MultipleCollieImagesPage> createState() =>
      _MultipleCollieImagesPageState();
}

class _MultipleCollieImagesPageState extends State<MultipleCollieImagesPage> {
  late Future _fetchCollieImages;

  @override
  void initState() {
    super.initState();
    _fetchCollieImages = ApiService().multipleCollieImages();
  }

  @override
  Widget build(BuildContext context) {
    return ArrowLayout(
      appBarTitle: "랜덤 코기 사진",
      body: FutureBuilder(
        future: _fetchCollieImages,
        builder: (context, snapshot) {
          if (snapshot.connectionState.index != 3)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    snapshot.data[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
