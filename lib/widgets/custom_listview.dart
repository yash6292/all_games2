import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  final Function()? onTap;
  final int? itemCount;
  int indexx;
  final String? imgUrl;
  CustomListView(
      {Key? key, this.itemCount, this.imgUrl, this.onTap, this.indexx = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 55,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              indexx = index;
              return GestureDetector(
                  onTap: onTap,
                  child: Container(
                    width: 55,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(imgUrl ?? ""),
                            fit: BoxFit.cover)),
                  ));
            }));
  }
}
