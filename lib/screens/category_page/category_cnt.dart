import 'package:all_games2/utils/constant/string_constants.dart';
import 'package:get/get.dart';

class CategoryModel {
  String? title;
  String? image;

  CategoryModel({this.image, this.title});
}

class CategoryCnt extends GetxController {
  List<CategoryModel> categoryList = <CategoryModel>[
    CategoryModel(
      image:
          "https://1000logos.net/wp-content/uploads/2022/05/Best-Android-Games-Logos.png",
      // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxk7AxkxuLyHSiCFVSn_YuPl37hhrisRMF_g&usqp=CAU",
      title: StringConstant.popular,
    ),
    CategoryModel(
      image:
          "https://mobilemodegaming.com/wp-content/uploads/2020/05/mobile-games-67024.jpg",
      // "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/action-1574801790.jpg?crop=0.502xw:1.00xh;0.250xw,0&resize=640:*",
      title: StringConstant.action,
    ),
    CategoryModel(
        image:
            "https://publish.one37pm.net/wp-content/uploads/2022/10/MOBILE-1-3.png",
        // "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/adgames-1576082687.jpg?crop=0.502xw:1.00xh;0.250xw,0&resize=640:*",
        title: StringConstant.adventure),
    CategoryModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW-_WP096FyXUTv3qXWjGOK1IHuJymvT8M220x-loKa4ZE8dYATCyLrbQuT97IwVZejC8&usqp=CAU",
      title: StringConstant.puzzle,
    ),
    CategoryModel(
      image:
          "https://www.lifewire.com/thmb/vjMFGVMCiuNWuvxqlqarbBmOFkk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/offlinecars-asphalt8-5bf393bb46e0fb002650eb20.jpg",
      title: StringConstant.racing,
    ),
    CategoryModel(
      image:
          "https://i.guim.co.uk/img/media/d8866f5831c13d6e57c45c1316307037e91926c9/120_0_1800_1080/master/1800.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=e10be09e1d09b4cc4a6910e6559e3098",
      title: StringConstant.d3games,
    ),
    CategoryModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRPEsdW9O7SxRzxCJNUJEF2V2RSmLXHDrbrVrRL8Gu2_xhEJ7LjICIIY7spK4pGqfXzUw&usqp=CAU",
      title: StringConstant.sports,
    ),
    CategoryModel(
      image:
          "https://static1.thegamerimages.com/wordpress/wp-content/uploads/2019/12/15-Best-Split-Screen-Multiplayer-Games-On-PC-Ranked.jpg",
      // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPNp8MWR-mNdoFSij4ivHmgecjTTPkmjAMSw&usqp=CAU",
      title: StringConstant.multiPlayer,
    ),
    CategoryModel(
      image: "https://imgs2.dab3games.com/200x20044.png",
      title: StringConstant.girlsDressUp,
    ),
    CategoryModel(
      image:
          "https://press-start.com.au/wp-content/uploads/2022/08/Gamescom-2022-Favourites.jpg",
      title: StringConstant.strategy,
    ),
  ];
}
