import 'package:flutter/material.dart';

class ItemsDetailsPage extends StatefulWidget {
  const ItemsDetailsPage({Key? key}) : super(key: key);

  @override
  State<ItemsDetailsPage> createState() => _ItemsDetailsPageState();
}

class _ItemsDetailsPageState extends State<ItemsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEFFF),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: MyHeaderDelegate(),
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 106,
                  padding: EdgeInsets.only(right: 20,left: 20,top: 30),
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order #52001",
                            style: TextStyle(
                              color: Color(0xFF272727),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "28 Nov 2019",
                            style: TextStyle(
                              color: Color(0xFF7F8FA6),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Service Type: ",
                            style: TextStyle(
                              color: Color(0xFF7F8FA6),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            " Carpenter",
                            style: TextStyle(
                              color: Color(0xFF0E4DFB),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),


    );
  }
}


class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 120,
      padding: EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF58AAFB),Color(0xFF3E89FB),Color(0xFF1758FB)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        'Item Details',
        style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}