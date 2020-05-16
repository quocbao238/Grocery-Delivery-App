import 'package:flutter/material.dart';
import 'package:grocery_delivery/custom_widget/marginBox.dart';
import 'package:grocery_delivery/freshPage.dart';
import 'package:grocery_delivery/model/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double szText = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      appBar: buildAppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 8.0, left: 10.0, bottom: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildTitleCategories(height, szText),
              BoxMargin(
                isVertical: true,
                multi: 1,
              ),
              buildListCategories(height, width, szText),
              BoxMargin(isVertical: true),
              buildTitleProduct(height, szText),
              BoxMargin(
                isVertical: true,
                multi: 1,
              ),
              buildListContent(height, width, szText, fruits),
              buildTitleSnack(height, szText),
              buildListContent(height, width, szText, snacks),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListContent(double height, double width, double szText, List<Content> list) {
    return Container(
      height: height * 0.25,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              margin: EdgeInsets.only(right: 16.0),
              width: width * 0.3,
              height: height * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1, color: Colors.black12),
                          color: Colors.white),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 6,
                            right: 6,
                            width: width * 0.08,
                            height: 0.08,
                            child: Center(
                              child: Icon(
                                Icons.favorite,
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                          Positioned.fill(
                              child: Center(
                                  child: Container(
                            width: width * 0.15,
                            height: width * 0.15,
                            child: Image(
                              image: AssetImage(
                                list[index].imageContent,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ))),
                        ],
                      ),
                    ),
                  ),
                  BoxMargin(isVertical: true, multi: 1),
                  Text(
                    list[index].name,
                    style: TextStyle(
                      fontSize: 14.0 * szText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "\$${list[index].price}",
                    style: TextStyle(color: Colors.green, fontSize: 14.0 * szText),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget buildTitleSnack(double height, double szText) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      height: height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Snacks',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 20.0 * szText,
            ),
          ),
          Text(
            'View More',
            style: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.w400,
              fontSize: 14.0 * szText,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitleProduct(double height, double szText) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      height: height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Offers',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0 * szText,
                ),
              ),
              Text(
                'Fresh Produce',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0 * szText,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => FreshProducePage()));
            },
                      child: Container(      
              height: height * 0.08,
              width: height * 0.08,
              
              child: Center(
                child: Text(
                  'View More',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0 * szText,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListCategories(double height, double width, double szText) {
    return Container(
      height: height * 0.16,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, index) {
          return Container(
            margin: EdgeInsets.only(right: 16),
            width: width * 0.2,
            height: width * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: Colors.black12),
                        color: Colors.white),
                    child: Center(
                      child: Tab(
                        icon: Container(
                          child: Image(
                            image: AssetImage(
                              categories[index].imgCategory,
                            ),
                            fit: BoxFit.fill,
                          ),
                          height: width * 0.08,
                          width: width * 0.08,
                        ),
                      ),
                    ),
                  ),
                ),
                BoxMargin(
                  isVertical: true,
                  multi: 1,
                ),
                Text(
                  categories[index].nameCategory,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14 * szText),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildTitleCategories(double height, double szText) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      height: height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'All Categories',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20.0 * szText,
            ),
          ),
          Text(
            'View items',
            style: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.w400,
              fontSize: 14.0 * szText,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromRGBO(69, 193, 99, 1),
      title: Text(
        'Home',
        style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: Colors.white,
          size: 24.0,
        ),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 24.0,
          ),
        )
      ],
    );
  }
}
