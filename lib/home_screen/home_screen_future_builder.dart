import 'package:code_bangladesh_mobile_app/category_screen/category_screen.dart';
import 'package:code_bangladesh_mobile_app/dto/app_data.dart';
import 'package:code_bangladesh_mobile_app/dto/category_response_dto.dart';
import 'package:flutter/material.dart';

class HomeScreenFutureBuilder {
  static FutureBuilder<AppDataResponseDTO> buildFutureBuilder(Future future) {
    return FutureBuilder<AppDataResponseDTO>(
        future: future,
        builder: (context, AsyncSnapshot<AppDataResponseDTO> snapshot) {
          if (snapshot.hasData) {
            return build(context, snapshot.data);
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  static GridView build(BuildContext context, AppDataResponseDTO appData) {
    final categoryGridCards = <Card>[
      for (int i = 0; i < appData.categories.length; i++) _buildGridCell(context, appData.categories[i]),
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

  static Card _buildGridCell(BuildContext context, CategoryResponseDTO categoryResponseDTO) {
    return new Card(
        elevation: 0.5,
        color: Colors.white,
        child: new InkWell(
            splashColor: Colors.blue.shade200,
            onTap: () {
              print("tapped");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CategoryScreen(categoryId: categoryResponseDTO.id, category: categoryResponseDTO),
                ),
              );
            },
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                gridCellImage(categoryResponseDTO.imageSource),
                SizedBox(height: 15.0),
                gridCellText(categoryResponseDTO.name)
              ],
            )));
  }

  static Image gridCellImage(String imagePath) {
    return Image.asset(
      imagePath,
      fit: BoxFit.contain,
      width: 50,
      height: 50,
    );
  }

  static Center gridCellText(String text) {
    return Center(
        child: Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
    ));
  }
}
