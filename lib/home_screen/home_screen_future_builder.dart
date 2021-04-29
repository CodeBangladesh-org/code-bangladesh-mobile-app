import 'package:code_bangladesh_mobile_app/dto/app_data.dart';
import 'package:flutter/material.dart';

class HomeScreenFutureBuilder {
  static FutureBuilder<AppDataResponseDTO> buildFutureBuilder(Future future) {
    return FutureBuilder<AppDataResponseDTO>(
        future: future,
        builder: (context, AsyncSnapshot<AppDataResponseDTO> snapshot) {
          if (snapshot.hasData) {
            return build(snapshot.data);
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  static GridView build(AppDataResponseDTO appData) {
    final categoryGridCards = <Card>[
      for (int i = 0; i < appData.categories.length; i++) _buildGridCell(appData.categories[i]),
    ];

    return new GridView.count(
      primary: true,
      padding: const EdgeInsets.all(0.0),
      crossAxisCount: 2,
      childAspectRatio: 1,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: categoryGridCards,
    );
  }

  static Card _buildGridCell(CategoryResponseDTO categoryResponseDTO) {
    return new Card(
        elevation: 0.5,
        color: Colors.white,
        semanticContainer: true,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Image.asset(
              categoryResponseDTO.imageSource.substring(1),
              fit: BoxFit.contain,
              width: 50,
              height: 50,
            ),
            SizedBox(height: 20.0),
            new Center(
              child: Text(categoryResponseDTO.name, style: TextStyle(fontWeight: FontWeight.bold),),
            )
          ],
        ));
  }
}
