// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:artman_web/features/product_list_feature/data/models/product_model.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';

class SingleProductScreen extends StatelessWidget {
  final ProductModel model ; 
  const SingleProductScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: ColorPallet.background,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //! tools 
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  //! cancel 
                  Icon(Icons.cancel),
                  Row(children: [
                    Icon(Icons.favorite),
                    SizedBox(width: 10,),
                    Icon(Icons.share),
                  ],)
                ],
                ),
                //! image 
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(300)),
                  height: 200,
                  child:  
                  Swiper(
                    physics: const BouncingScrollPhysics(),
                    curve: Curves.bounceInOut,
                    loop: false ,
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
                Text(model.name! , style: TextStyles.nameOfPrudoctList, ),
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
                      color: ColorPallet.searchBox ,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(model.price! ),
                        const SizedBox(width: 10,),
                        const Text("تومان"),
                      ],
                    ),
                  ),
                    const SizedBox(width: 10,),
                    //! rate
                    Container(
                      width: MediaQuery.of(context).size.width * 0.13 , 
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: ColorPallet.searchBox),
                      child: const Column(children: [
                        Text("4.7"),
                        Icon(Icons.star , color: Colors.amber,size: 30,)
                        
                      ],)
                    )
                  ],),
                ),
                //! color 
                Align(alignment: Alignment.centerRight, child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Text("رنگ",style: TextStyles.nameOfPrudoctList,),
                )),
                SizedBox(
                  width: double.infinity,
                  height: 38 ,             
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                        border: Border.all(color: ColorPallet.mainTextColor)
                        ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("قرمز"),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(color: Colors.red ,borderRadius: BorderRadius.circular(100) ),
                          )
                        ],
                      ),
                        );
                  },),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    color: ColorPallet.searchBox,
                    borderRadius: BorderRadius.circular(15)),
                  child: ExpandablePanel(
                  theme:  const ExpandableThemeData(
                    iconPlacement:  ExpandablePanelIconPlacement.right , 
                    expandIcon: Icons.keyboard_arrow_down , 
                    collapseIcon:Icons.keyboard_arrow_up ),
                  header: const Text("اطلاعات"),
                  collapsed: const Text(" دمتنو", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded:const Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("رنگ"),
                        Text("قرمز"),
                      ],
                    ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("رنگ"),
                        Text("قرمز"),
                      ],
                    ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("رنگ"),
                        Text("قرمز"),
                      ],
                    ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("رنگ"),
                        Text("قرمز"),
                      ],
                    ),
                  
                  ],)
                  
                              
                    ),
                ),Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    color: ColorPallet.searchBox,
                    borderRadius: BorderRadius.circular(15)),
                  child: ExpandablePanel(
                  theme:  const ExpandableThemeData(
                    iconPlacement:  ExpandablePanelIconPlacement.right , 
                    expandIcon: Icons.keyboard_arrow_down , 
                    collapseIcon:Icons.keyboard_arrow_up ),
                  header: const Text("معرفی اجمالی"),
                  collapsed: const Text(" دمتنو", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded:const Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("رنگ"),
                        Text("قرمز"),
                      ],
                    ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("رنگ"),
                        Text("قرمز"),
                      ],
                    ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("رنگ"),
                        Text("قرمز"),
                      ],
                    ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("رنگ"),
                        Text("قرمز"),
                      ],
                    ),
                  
                  ],)         
                    ),
                ),
                
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    color: ColorPallet.searchBox,
                    borderRadius: BorderRadius.circular(15)),
                  child: ExpandablePanel(
                  theme:  const ExpandableThemeData(
                    iconPlacement:  ExpandablePanelIconPlacement.right , 
                    expandIcon: Icons.keyboard_arrow_down , 
                    collapseIcon:Icons.keyboard_arrow_up ),
                  header: const Text("فروشنده"),
                  collapsed: const Text(" دمتنو", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded:const Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("رنگ"),
                        Text("قرمز"),
                      ],
                    ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("رنگ"),
                        Text("قرمز"),
                      ],
                    ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("رنگ"),
                        Text("قرمز"),
                      ],
                    ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("رنگ"),
                        Text("قرمز"),
                      ],
                    ),
                  
                  ],)
                  
                              
                    ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: 140,
                height: 50,
                decoration: BoxDecoration(color: ColorPallet.secondary ,borderRadius: BorderRadius.circular(10)),
                child: const Center(child: Text("خرید",style: TextStyle(color: Colors.white ,fontSize: 24 ,fontFamily: "sens",fontWeight: FontWeight.bold))),
              ),
              Text(model.price! ,style: const TextStyle(color: Colors.black ,fontSize: 24 ,fontFamily: "sens",fontWeight: FontWeight.bold)),
            ],),
          )
          ),
        ),
    );
  }
}


List<String> banerimg  = [
  
      "https://media.wired.com/photos/63a49538145a571e203e3a7d/master/w_1600%2Cc_limit/asuschromebookflipcx5_GEAR.jpg",
      "https://media.wired.com/photos/62755f0e74e0428e36b7f383/master/w_1600%2Cc_limit/Acer-Swift-3x-Gear.jpg",
 "https://media.product.which.co.uk/prod/images/ar_2to1_900x450/5afeb9dc1a02-mobile-and-sim-dealsadvicerevised.webp",
      "https://images.macrumors.com/t/JUtpCjCRu4zsypwl_8gRVMguwo0=/800x0/article-new/2022/05/airpods-3-purple.jpg?lossy",

];