import 'dart:async';
import 'package:artman_web/config/conststants/text_consts.dart';
import 'package:artman_web/config/theme/color_pallet.dart'; //! need update
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:artman_web/config/widgets/search_box.dart';
import 'package:artman_web/core/models/image_model.dart';
import 'package:artman_web/core/models/tag_model.dart';
import 'package:artman_web/features/category_feature/data/model/category_model.dart';
import 'package:artman_web/features/category_feature/data/remote_data/category_api_providers.dart';
import 'package:artman_web/features/home_feature/presentation/widgets/event_card.dart';
import 'package:artman_web/features/home_feature/presentation/widgets/trend_card.dart';
import 'package:artman_web/features/product_list_feature/data/remote_data/product_api_provider.dart';
import 'package:artman_web/features/product_list_feature/presentation/screens/product_list_screen.dart';
import 'package:artman_web/features/product_list_feature/presentation/screens/single_product_screen.dart';
import 'package:artman_web/locator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../product_list_feature/data/models/product_model.dart';

class HomeScreen extends StatefulWidget {
  final List<TagModel>? tags;
  const HomeScreen({super.key, this.tags});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageViewController = PageController(initialPage: 0);
  Timer? _timer;
  int _currentPage = 0;
  CategoryApiProvider? categoryApiProvider;
  ProductApiProvider? productApiProvider;
  List<TagModel> tagsList = [];
  PageController controller = PageController();

  @override
  void initState() {
    productApiProvider = locator<ProductApiProvider>();
    categoryApiProvider = locator<CategoryApiProvider>();
    super.initState();
  }

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
              searchBox(context, widget.tags),
              const SizedBox(
                height: 20,
              ),
              //! baner -------------------------------------------------
              SizedBox(
                height: 155,
                child: PageView.builder(
                  onPageChanged: (value) {},
                  allowImplicitScrolling: true,
                  controller: pageViewController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: bannerList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 40, left: 32),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          repeat: ImageRepeat.noRepeat,
                          errorWidget: (context, url, error) =>
                              Shimmer.fromColors(
                                  baseColor:
                                      const Color.fromARGB(255, 223, 223, 223),
                                  highlightColor:
                                      const Color.fromARGB(255, 200, 199, 199),
                                  child: Container(
                                    height: 250,
                                    width: 350,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  )),
                          imageUrl: bannerList[index],
                          useOldImageOnUrlChange: true,
                          placeholder: (context, url) => Shimmer.fromColors(
                              baseColor:
                                  const Color.fromARGB(255, 223, 223, 223),
                              highlightColor:
                                  const Color.fromARGB(255, 200, 199, 199),
                              child: Container(
                                height: 250,
                                width: 350,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )),
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
                        paintStyle: PaintingStyle.fill,
                        dotWidth: 9,
                        dotHeight: 3.4,
                        dotColor: const Color(0xffd9d9d9),
                        activeDotColor: ColorPallet.secondary),
                    controller: pageViewController,
                    count: bannerList.length),
              ),
              //! category icons-------------------------------
              const SizedBox(
                height: 37,
              ),
              Container(
                  margin: const EdgeInsets.only(right: 15, bottom: 10),
                  height: 78,
                  width: double.infinity,
                  child: homeCategoryShortcutList()),
              //! amazing offer baneers --------------------------------
              Container(
                  //padding: const EdgeInsets.only(top: 17, bottom: 17),
                  margin: const EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  height: 280,
                  decoration: BoxDecoration(
                    color: ColorPallet.secondary,
                  ),
                  child: Column(
                    children: [
                      //!cards
                      Expanded(
                          child: homeEventList(widget.tags![0].id.toString()))
                    ],
                  )),
              //! newest --------------------------------------------------------------------
              Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(right: 20, bottom: 14),
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
                                args: widget.tags,
                                title: "پر فروش ترین ها",
                                tag: "18",
                              );
                            })),
                            child: Container(
                              margin: const EdgeInsets.all(7),
                              width: 90,
                              height: 30,
                              child: Row(
                                children: [
                                  Text(
                                    TextConsts.seeAll,
                                    style: TextStyles.seeAll,
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_left,
                                    size: 10,
                                    color: ColorPallet.secondary,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      //!cards
                      Expanded(child: homeProductList("25")),
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
                                        "https://irantableegh.org/wp-content/uploads/2022/01/Instagram-promotional-teaser-2.png",
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
                                  args: widget.tags,
                                  title: "تازه ترین ها",
                                  tag: "26",
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
                      Expanded(child: homeProductList("26")),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget homeProductList(String tag) {
    return FutureBuilder(
      future: productApiProvider!.getProducts(tagid: tag),
      builder: (context, AsyncSnapshot<List<ProductModel>> model) {
        if (model.hasData) {
          return buildHomeCartList(model.data!); //widget
        } else {
          return Center(
            //shimer
            child: LoadingAnimationWidget.horizontalRotatingDots(
              size: 40,
              color: ColorPallet.secondary,
            ),
          );
        }
      },
    );
  }

  Widget homeCategoryShortcutList() {
    CategoryApiProvider categoryApiProvider = locator();
    return FutureBuilder(
        future: categoryApiProvider.getCategories(),
        builder: (context, AsyncSnapshot<List<CategoryModel>> model) {
          if (model.hasData) {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: model.data!.length > 5 ? 5 : model.data!.length,
                itemBuilder: ((context, index) {
                  var data = model.data![index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductsListScreen(
                                      title: "${data.categoryName}",
                                      category: data.categoryId.toString(),
                                      args: widget.tags,
                                    ))),
                        child: Container(
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            margin: const EdgeInsets.only(
                              right: 0,
                              left: 0,
                            ),
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: const Color(0xfff1f1f1),
                                ),
                                child: Center(
                                  child: Image(
                                      image: NetworkImage(data.image!.url!)),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                          width: 49,
                          child: Text(
                            data.categoryName!,
                            style: const TextStyle(
                                fontFamily: "sens",
                                fontSize: 11,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ))
                    ],
                  );
                }));
          } else {
            return Shimmer.fromColors(
                baseColor: const Color.fromARGB(255, 223, 223, 223),
                highlightColor: const Color.fromARGB(255, 200, 199, 199),
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 95,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 228, 228, 228))),
                        margin: const EdgeInsets.only(
                          right: 9,
                        ),
                        padding: const EdgeInsets.only(right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 33,
                              height: 33,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(156, 234, 234, 234)),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.only(right: 4, left: 5),
                                child: Container(
                                  width: 40,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10)),
                                ))
                          ],
                        ),
                      );
                    }));
          }
        });
  }

  Widget homeEventList(String sku) {
    return FutureBuilder(
      future: productApiProvider!.getProducts(tagid: sku),
      initialData: [
        ProductModel(
            name: "test",
            price: "1000",
            images: [ImageSrc(url: banerimg[0])],
            categories: [CategoryModel()])
      ],
      builder: (context, AsyncSnapshot<List<ProductModel>> model) {
        if (model.hasData) {
          return ListView.builder(
              itemCount: model.data!.isEmpty ? 2 : model.data!.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return index == 0
                    ? SizedBox(
                        width: 165,
                        child: Column(children: [
                          //شگفت انگیز
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4, top: 30),
                            child: Image.asset(
                              "assets/icons/Amazings.png",
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // کاراکتر
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Image.asset(
                              "assets/icons/boxamz.png",
                              width: 86,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // دکمه
                          InkWell(
                            onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductsListScreen(
                                args: widget.tags,
                                title: "تازه ترین ها",
                                tag: "26",
                              );
                            })),
                            child: Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: Colors.white),
                                color: const Color(0x42ffffff),
                              ),
                              child: const Center(
                                child: Text(
                                  TextConsts.seeAll,
                                  style: TextStyle(
                                      fontFamily: "sens",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )

                          // SlideCountdownSeparated(
                          //   decoration: BoxDecoration(
                          //       color: ColorPallet.background,
                          //       borderRadius: BorderRadius.circular(8)),
                          //   duration: const Duration(hours: 20),
                          //   separator: ":",
                          //   separatorStyle: const TextStyle(
                          //       color: Colors.white,
                          //       fontSize: 18,
                          //       fontWeight: FontWeight.bold),
                          //   height: 40,
                          //   width: 27,
                          //   curve: Curves.easeInOutCubic,
                          //   textStyle: const TextStyle(
                          //       color: Colors.black,
                          //       fontFamily: "sens",
                          //       fontWeight: FontWeight.bold),
                          // ),
                        ]),
                      )
                    : model.data!.isNotEmpty
                        ? InkWell(
                            onTap: () => Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return SingleProductScreen(
                                    model: model.data![index],
                                  );
                                })),
                            child: Center(child: eventCard(model.data![index])))
                        : Container(
                            width: 200,
                            height: 190,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorPallet.background),
                            child: const Center(
                              child: Text(
                                "منتظر تخفیف های شگفت انگیز ما باشید",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "sens",
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
              }); //widget
        } else {
          //todo shimmer effect
          return Center(
            child: LoadingAnimationWidget.horizontalRotatingDots(
              size: 40,
              color: ColorPallet.searchBox,
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
                      args: widget.tags,
                      model: inc,
                    );
                  }));
                },
                child: trendCard(model: inc));
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
