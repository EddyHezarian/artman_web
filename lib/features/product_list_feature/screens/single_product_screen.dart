// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:artman_web/features/auth_feature/repository/models/login_response_model.dart';
import 'package:artman_web/features/product_list_feature/data/models/product_model.dart';
import 'package:artman_web/locator.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';

import '../../../config/conststants/text_consts.dart';
import '../../../config/functions/html_to_str.dart';
import '../../home_feature/presentation/widgets/trend_card.dart';
import '../data/product_api_provider.dart';

class SingleProductScreen extends StatelessWidget {
  final ProductModel model;
  const SingleProductScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPallet.background,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //! tools --> like button , share , cancel
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //! cancel
                    Icon(Icons.cancel),
                    Row(
                      children: [
                        Icon(Icons.favorite),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.share),
                      ],
                    )
                  ],
                ),
                //! image
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(300)),
                  height: 200,
                  child: Swiper(
                    physics: const BouncingScrollPhysics(),
                    curve: Curves.bounceInOut,
                    loop: false,
                    autoplay: false,
                    pagination: const SwiperPagination(),
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        model.images[index].url!,
                        fit: BoxFit.cover,
                      );
                    },
                    itemCount: model.images.length,
                    viewportFraction: 0.8,
                    scale: 0.9,
                  ),
                ),
                //! name
                Text(
                  model.name!,
                  style: TextStyles.nameOfPrudoctList,
                ),
                //! price and rate
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //! price
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                            color: ColorPallet.searchBox,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(model.price!),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text("تومان"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      //! rate
                      Container(
                          width: MediaQuery.of(context).size.width * 0.13,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorPallet.searchBox),
                          child: const Column(
                            children: [
                              Text("4.7"),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 30,
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                //! color //! attrebuite No id 1
                //! attributes
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                      color: ColorPallet.searchBox,
                      borderRadius: BorderRadius.circular(15)),
                  child: ExpandablePanel(
                      theme: const ExpandableThemeData(
                          iconPlacement: ExpandablePanelIconPlacement.right,
                          expandIcon: Icons.keyboard_arrow_down,
                          collapseIcon: Icons.keyboard_arrow_up),
                      header: const Text("اطلاعات"),
                      collapsed: const Text(
                        " مشاهده بیشتر ",
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      expanded: SizedBox(
                        height: (40 * model.attributes!.length + 2).toDouble(),
                        child: Expanded(
                          child: ListView.builder(
                            itemCount: model.attributes != null
                                ? model.attributes!.length
                                : 0,
                            itemBuilder: (context, index) {
                              var data = model.attributes![index];
                              var values = data.options;
                              return Row(
                                children: [
                                  //! key
                                  Container(
                                    height: 29,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.white),
                                    child: Center(
                                      child: Text(data.name!),
                                    ),
                                  ),
                                  //!
                                  const Text(" : "),
                                  for (int counter = 0;
                                      counter < values!.length;
                                      counter++)
                                    Text("${values[counter]} , "),
                                ],
                              );
                            },
                          ),
                        ),
                      )),
                ),
                //! description
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                      color: ColorPallet.searchBox,
                      borderRadius: BorderRadius.circular(15)),
                  child: ExpandablePanel(
                      theme: const ExpandableThemeData(
                          iconPlacement: ExpandablePanelIconPlacement.right,
                          expandIcon: Icons.keyboard_arrow_down,
                          collapseIcon: Icons.keyboard_arrow_up),
                      header: const Text("معرفی اجمالی"),
                      collapsed: Align(
                        alignment: Alignment.centerRight,
                        child: Text(parseHtmlString(
                          model.shortDescription!,
                        )),
                      ),
                      expanded: Align(
                          alignment: Alignment.centerRight,
                          child: Text(parseHtmlString(
                            model.description!,
                          )))),
                ),
                model.releatedProducts!.length> 0 ? RelatedWidget(productIDS: model.releatedProducts!,):const SizedBox(),
                    
              ],
            ),
          ),
        ),
        //! add to cart button and price
        bottomNavigationBar: BottomAppBar(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //! add to card button
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 140,
                    height: 50,
                    decoration: BoxDecoration(
                        color: ColorPallet.secondary,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text("خرید",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: "sens",
                                fontWeight: FontWeight.bold))),
                  ),
                  //! price
                  Text(model.price!,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: "sens",
                          fontWeight: FontWeight.bold)),
                ],
              ),
            )),
      ),
    );
  }
}

List<String> banerimg = [
  "https://media.wired.com/photos/63a49538145a571e203e3a7d/master/w_1600%2Cc_limit/asuschromebookflipcx5_GEAR.jpg",
  "https://media.wired.com/photos/62755f0e74e0428e36b7f383/master/w_1600%2Cc_limit/Acer-Swift-3x-Gear.jpg",
  "https://media.product.which.co.uk/prod/images/ar_2to1_900x450/5afeb9dc1a02-mobile-and-sim-dealsadvicerevised.webp",
  "https://images.macrumors.com/t/JUtpCjCRu4zsypwl_8gRVMguwo0=/800x0/article-new/2022/05/airpods-3-purple.jpg?lossy",
];

class RelatedWidget extends StatelessWidget {
  RelatedWidget({super.key, required this.productIDS});
  ProductApiProvider productApiProvider = locator();
  final List<int> productIDS;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(top: 14, bottom: 14),
        width: double.infinity,
        height: 300,
        child: Column(children: [
          //! texts
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //! title
              Text(
                "محصولات مرتبط",
                style: TextStyles.offersTitle,
              ),
              //! see all
              Container(
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
              )
            ],
          ),
          //!cards
          homeProductList()
        ]));
  }

  Widget homeProductList() {
    return FutureBuilder(
      future: productApiProvider.getProducts(relatedIDS: productIDS),
      builder: (context, AsyncSnapshot<List<ProductModel>> model) {
        if (model.hasData) {
          print(model.data!.length);
          return buildHomeCartList(model.data!); //widget
        } else {
          return Center(
            child: CircularProgressIndicator(
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
            return trendCard(index: index, model: inc);
          }),
    );
  }
}
