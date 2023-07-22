import 'dart:async';
import 'package:artman_web/config/conststants/text_consts.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:artman_web/config/widgets/search_box.dart';
import 'package:artman_web/features/category_feature/data/remote_data/category_api_providers.dart';
import 'package:artman_web/features/home_feature/presentation/widgets/category_shortcut_card.dart';
import 'package:artman_web/features/home_feature/presentation/widgets/event_card.dart';
import 'package:artman_web/features/home_feature/presentation/widgets/trend_card.dart';
import 'package:artman_web/features/product_list_feature/data/remote_data/product_api_provider.dart';
import 'package:artman_web/features/product_list_feature/presentation/screens/product_list_screen.dart';
import 'package:artman_web/features/product_list_feature/presentation/screens/single_product_screen.dart';
import 'package:artman_web/locator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../product_list_feature/data/models/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageViewController = PageController(initialPage: 0);
  Timer? _timer;
  int _currentPage = 0;
  CategoryApiProvider? categoryApiProvider;
  ProductApiProvider? productApiProvider;
  @override
  void initState() {
    productApiProvider = locator<ProductApiProvider>();
    categoryApiProvider = locator<CategoryApiProvider>();
    super.initState();
  }

  PageController controller = PageController();
  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _timer ??= Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < bannerList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (pageViewController.positions.isNotEmpty) {
        pageViewController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPallet.background,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              //! search container  ------------------------------------------------
              searchBox(context),
              const SizedBox(
                height: 25,
              ),
              //! baner -------------------------------------------------
              SizedBox(
                height: 150,
                child: PageView.builder(
                  onPageChanged: (value) {},
                  allowImplicitScrolling: true,
                  controller: pageViewController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: bannerList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl: bannerList[index],
                          useOldImageOnUrlChange: true,
                          placeholder: (context, url) => Center(
                            child:
                                LoadingAnimationWidget.horizontalRotatingDots(
                                    color: ColorPallet.secondary, size: 40),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: SmoothPageIndicator(
                    effect: ExpandingDotsEffect(
                        dotWidth: MediaQuery.of(context).size.width * 0.03,
                        dotHeight: 5,
                        activeDotColor: ColorPallet.secondary),
                    controller: pageViewController,
                    count: bannerList.length),
              ),
              //! category icons-------------------------------
              const SizedBox(
                height: 19,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  categoryShortcutCard(
                      Colors.amber,
                      "لپتاپ",
                      Icon(
                        Icons.laptop,
                        color: ColorPallet.background,
                      )),
                  categoryShortcutCard(
                      Colors.red,
                      "موبایل",
                      Icon(
                        Icons.phone,
                        color: ColorPallet.background,
                      )),
                  categoryShortcutCard(
                      Colors.green,
                      "تبلت",
                      Icon(
                        Icons.edit,
                        color: ColorPallet.background,
                      )),
                  categoryShortcutCard(
                      Colors.purple,
                      "جانبی",
                      Icon(
                        Icons.headphones,
                        color: ColorPallet.background,
                      )),
                ],
              ),
              //! amazing offer baneers --------------------------------
              Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  margin: const EdgeInsets.only(top: 14, bottom: 14),
                  width: double.infinity,
                  height: 345,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorPallet.hightContrastGradiant,
                        ColorPallet.secondary
                      ],
                      end: Alignment.centerLeft,
                      begin: Alignment.centerRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      //! texts
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, left: 17),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProductsListScreen(
                                  title: "تازه ترین ها",
                                  tag: "19",
                                );
                              })),
                              child: Text(
                                TextConsts.seeAll,
                                style: TextStyles.seeAll,
                              ),
                            )),
                      ),
                      //!cards
                      Expanded(child: homeEventList("19"))
                    ],
                  )),
              //! newest --------------------------------------------------------------------
              Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 14, bottom: 14),
                  width: double.infinity,
                  height: 300,
                  child: Column(
                    children: [
                      //! texts
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //! title
                          Text(
                            TextConsts.trendings,
                            style: TextStyles.offersTitle,
                          ),
                          //! see all
                          InkWell(
                            onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductsListScreen(
                                title: "پر فروش ترین ها",
                                tag: "18",
                              );
                            })),
                            child: Container(
                              margin: const EdgeInsets.all(7),
                              width: 90,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorPallet.secondary,
                              ),
                              child: Center(
                                  child: Text(
                                TextConsts.seeAll,
                                style: TextStyles.seeAll,
                              )),
                            ),
                          )
                        ],
                      ),
                      //!cards
                      Expanded(child: homeProductList("18")),
                    ],
                  )),
              //! introduction container ----------------------------------------------------
              Padding(
                padding: const EdgeInsets.all(24),
                child: SizedBox(
                  // margin: const EdgeInsets.all(10),
                  height: 320,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //! first line
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              width: 220,
                              height: 150,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromARGB(70, 84, 83, 83),
                                        blurRadius: 2,
                                        spreadRadius: 3)
                                  ],
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                        "https://selleracademy.digikala.com/wp-content/uploads/2021/11/header-Mask-1-1024x479.jpg",
                                      ),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromARGB(70, 84, 83, 83),
                                        blurRadius: 2,
                                        spreadRadius: 3)
                                  ],
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                        "https://designland.ir/wp-content/uploads/2022/11/1-min-1-1-600x1067.jpg",
                                      ),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                        "https://irantableegh.org/wp-content/uploads/2022/01/Instagram-promotional-teaser-2.png",
                                      ),
                                      fit: BoxFit.fill),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromARGB(70, 84, 83, 83),
                                        blurRadius: 2,
                                        spreadRadius: 3)
                                  ],
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              width: 220,
                              height: 150,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxheSidHp1qkR5nQrDOjW7xQqbuimS8ZR70A&usqp=CAU",
                                      ),
                                      fit: BoxFit.fill),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromARGB(70, 84, 83, 83),
                                        blurRadius: 2,
                                        spreadRadius: 3)
                                  ],
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //! terndings ----------------------------------------------------
              Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 14, bottom: 14),
                  width: double.infinity,
                  height: 300,
                  child: Column(
                    children: [
                      //! texts
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //! title
                          Text(
                            TextConsts.trendings,
                            style: TextStyles.offersTitle,
                          ),
                          //! see all
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProductsListScreen(
                                  title: "تازه ترین ها",
                                  tag: "17",
                                );
                              }));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(7),
                              width: 90,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorPallet.secondary,
                              ),
                              child: Center(
                                  child: Text(
                                TextConsts.seeAll,
                                style: TextStyles.seeAll,
                              )),
                            ),
                          )
                        ],
                      ),
                      //!cards
                      Expanded(child: homeProductList("24")),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget homeProductList(String sku) {
    return FutureBuilder(
      future: productApiProvider!.getProducts(skutitle: sku),
      builder: (context, AsyncSnapshot<List<ProductModel>> model) {
        if (model.hasData) {
          print(model.data!.length);
          return buildHomeCartList(model.data!); //widget
        } else {
          return Center(
            child: LoadingAnimationWidget.horizontalRotatingDots(
              size: 40,
              color: ColorPallet.secondary,
            ),
          );
        }
      },
    );
  }

  Widget homeEventList(String sku) {
    return FutureBuilder(
      future: productApiProvider!.getProducts(skutitle: sku),
      builder: (context, AsyncSnapshot<List<ProductModel>> model) {
        if (model.hasData) {
          print(model.data!.length);
          return ListView.builder(
              itemCount: model.data!.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return index == 0
                    ? Container(
                        width: 160,
                        color: Colors.transparent,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30, top: 30),
                            child: Image.asset("assets/icons/Amazings.png"),
                          ),
                          SlideCountdownSeparated(
                            decoration: BoxDecoration(
                                color: ColorPallet.background,
                                borderRadius: BorderRadius.circular(8)),
                            duration: const Duration(hours: 20),
                            separator: ":",
                            separatorStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            height: 40,
                            width: 27,
                            curve: Curves.easeInOutCubic,
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontFamily: "sens",
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      )
                    : InkWell(
                        onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SingleProductScreen(
                                model: model.data![index],
                              );
                            })),
                        child: eventCard(model.data![index]));
              }); //widget
        } else {
          return Center(
            child: LoadingAnimationWidget.horizontalRotatingDots(
              size: 40,
              color: ColorPallet.secondary,
            ),
          );
        }
      },
    );
  }

  Widget buildHomeCartList(List<ProductModel> data) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
          itemCount: data.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var inc = data[index];
            return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SingleProductScreen(
                      model: inc,
                    );
                  }));
                },
                child: trendCard(index: index, model: inc));
          }),
    );
  }
}

//TOdo need api for home page or configure
List bannerList = [
  "https://media.wired.com/photos/63a49538145a571e203e3a7d/master/w_1600%2Cc_limit/asuschromebookflipcx5_GEAR.jpg",
  "https://media.wired.com/photos/62755f0e74e0428e36b7f383/master/w_1600%2Cc_limit/Acer-Swift-3x-Gear.jpg",
  "https://media.product.which.co.uk/prod/images/ar_2to1_900x450/5afeb9dc1a02-mobile-and-sim-dealsadvicerevised.webp",
  "https://images.macrumors.com/t/JUtpCjCRu4zsypwl_8gRVMguwo0=/800x0/article-new/2022/05/airpods-3-purple.jpg?lossy",
];
