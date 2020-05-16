import 'package:flutter/material.dart';

import 'custom_widget/marginBox.dart';
import 'model/data.dart';
import 'model/data.dart';
import 'model/data.dart';
import 'model/data.dart';
import 'model/data.dart';
import 'model/data.dart';
import 'model/data.dart';
import 'model/data.dart';

class FreshProducePage extends StatefulWidget {
  @override
  _FreshProducePageState createState() => _FreshProducePageState();
}

class _FreshProducePageState extends State<FreshProducePage> {
  String selectName = "Fruits";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double szText = MediaQuery.of(context).textScaleFactor;
    double padding = width * 0.03;
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            BoxMargin(isVertical: true),
            buildCategories(height, width, padding, szText),
            BoxMargin(isVertical: true),
            buildPopularItem(height, szText),
            BoxMargin(isVertical: true),
            buildItemCard(height, width, szText)
          ],
        ),
      ),
    );
  }

  Widget buildItemCard(double height, double width, double szText) {
    return selectName == "Fruits"
        ? buidItemCardFruitsData(height, width, szText)
        : buildItemCardNonData(height, szText);
  }

  Widget buidItemCardFruitsData(double height, double width, double szText) {
    return Container(
        height: height * 0.7,
        width: width,
        child: GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            children: List.generate(fruits.length, (index) {
              return Container(
                height: height * 0.3,
                margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 16,
                              right: 16,
                              child: Container(
                                  width: 24.0,
                                  height: 24.0,
                                  child: Center(
                                      child: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 24.0,
                                  ))),
                            ),
                          Center(
                            child: Container(
                              width: double.maxFinite*2/3,
                              height: double.maxFinite*2/3,
                              child: Image.asset(fruits[index].imageContent),
                            ),
                          )
                          ],
                        ),
                      ),
                    ),
                    BoxMargin(isVertical: true, multi: 1),
                    Text(
                      "${fruits[index].name}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0 * szText,
                          fontWeight: FontWeight.w500),
                    ),
                    BoxMargin(isVertical: true, multi: 1),
                    Text(
                      "\$ ${fruits[index].price}",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18.0 * szText,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              );
            })));
  }

  Widget buildItemCardNonData(double height, double szText) {
    return Container(
      height: height * 0.7,
      child: Center(
          child: Text(
        selectName,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 24.0 * szText,
        ),
      )),
    );
  }

  Widget buildPopularItem(double height, double szText) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      height: height * 0.06,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Popular Item",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24 * szText,
            ),
          ),
          Icon(
            Icons.settings_input_component,
            color: Colors.grey[500],
          ),
        ],
      ),
    );
  }

  Widget buildCategories(
      double height, double width, double padding, double szText) {
    return Container(
      height: height * 0.05,
      margin: EdgeInsets.only(left: 16.0),
      width: width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectName = categories[index].nameCategory;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: padding),
                width: width * 0.25,
                height: height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: selectName == categories[index].nameCategory
                      ? Colors.green
                      : Colors.white,
                ),
                child: Center(
                  child: Text(
                    "${categories[index].nameCategory}",
                    style: TextStyle(
                        color: selectName == categories[index].nameCategory
                            ? Colors.white
                            : Colors.black,
                        fontSize: 16 * szText,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 30.0,
        ),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 30.0,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
