
import 'package:artman_web/config/conststants/meassurments.dart';
import 'package:artman_web/config/conststants/text_consts.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:artman_web/config/widgets/search_box.dart';
import 'package:artman_web/features/home_feature/widgets/category_shortcut_card.dart';
import 'package:artman_web/features/home_feature/widgets/event_card.dart';
import 'package:artman_web/features/home_feature/widgets/header_banner_widgets.dart';
import 'package:artman_web/features/home_feature/widgets/trend_card.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller= PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPallet.background,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
            //! search container  ------------------------------------------------
            searchBox(context),
            const SizedBox(height: 25,),
            //! baner -------------------------------------------------
            headerBanner(context),
            //! category icons-------------------------------
            const SizedBox(height: 19,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              categoryShortcutCard(Colors.amber, "لپتاپ",const Icon(Icons.laptop)),
              categoryShortcutCard(Colors.red, "موبایل",const Icon(Icons.phone)),
              categoryShortcutCard(Colors.green, "تبلت",const Icon(Icons.edit)),
              categoryShortcutCard(Colors.purple, "جانبی",const Icon(Icons.headphones)),
            ],
            ),
            //! amazing offer baneers --------------------------------
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(top: 14,bottom: 14),
              width: double.infinity,
              height: 280,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ColorPallet.hightContrastGradiant , ColorPallet.secondary] , 
                  end: Alignment.centerLeft , 
                  begin: Alignment.centerRight,
                  ), 
                  ),
              child: Column(children: [
                //! texts
                Padding(
                  padding: const EdgeInsets.only(bottom: 11),
                  child: Align(alignment: Alignment.centerLeft, child: Text(TextConsts.seeAll , style: TextStyles.seeAll,)),
                ) ,
                //!cards 
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index ){
                      return 
                      index == 0 ? 
                      Container(
                        width: 160,
                        color: Colors.transparent,
                        child:Column(
                          children: [  
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30 , top: 30),
                        child: Text(textAlign: TextAlign.center,  TextConsts.amazingOffers , style: TextStyles.offersTitle ,),
                      ),
                      SlideCountdownSeparated(
                          decoration: BoxDecoration(color: ColorPallet.background ,borderRadius: BorderRadius.circular(8)),
                          duration: const Duration(days: 2),
                          height: 40,
                          width: 27,
                          curve: Curves.bounceInOut,
                          textStyle: const TextStyle(
                            color: Colors.black , 
                            fontFamily: "sens" , 
                            fontWeight: FontWeight.bold),
                        ),
                      ]),
                        ) :
                      eventCard();
                    }
                    ),
                )
              ],)
            ),
            //! newest --------------------------------------------------------------------
              Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(top: 14,bottom: 14),
              width: double.infinity,
              height: 280,
              child: Column(children: [
                //! texts
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [  
                    //! title 
                    Text(TextConsts.newestOrders , style: TextStyles.offersTitle ,),
                    //! see all
                    Container(
                      margin:    const EdgeInsets.all(7),
                      width:90,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorPallet.secondary,),
                      child:  Center(child: Text(TextConsts.seeAll , style: TextStyles.seeAll,)),
                )],  
                ) ,
                //!cards 
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index ){
                      return trendCard(index);
                    } ),
                )
              ],)
            ),
            //! introduction container ----------------------------------------------------
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
               // margin: const EdgeInsets.all(10),
                height: 320 ,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //! first line
                      Row(children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          width: 220,
                          height: 150,
                          decoration: BoxDecoration(
                            boxShadow: const [
                            BoxShadow(color: Color.fromARGB(70, 84, 83, 83) , blurRadius: 2 , spreadRadius: 3)],
                            image: const DecorationImage(image: NetworkImage("https://selleracademy.digikala.com/wp-content/uploads/2021/11/header-Mask-1-1024x479.jpg",),fit: BoxFit.fill),
                            
                            borderRadius: BorderRadius.circular(15)),
                            ),
                        Container(
                          margin: const EdgeInsets.all(5),
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                            boxShadow: const [BoxShadow(color: Color.fromARGB(70, 84, 83, 83) , blurRadius: 2 , spreadRadius: 3)],
                            image: const DecorationImage(image: NetworkImage("https://designland.ir/wp-content/uploads/2022/11/1-min-1-1-600x1067.jpg",),fit: BoxFit.fill),
                            
                            borderRadius: BorderRadius.circular(15)),
                            ),
                      ],),
                      Row(children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                            image: const DecorationImage(image: NetworkImage("https://irantableegh.org/wp-content/uploads/2022/01/Instagram-promotional-teaser-2.png",),fit: BoxFit.fill),
                            boxShadow: const [BoxShadow(color: Color.fromARGB(70, 84, 83, 83) , blurRadius: 2 , spreadRadius: 3)],
                            borderRadius: BorderRadius.circular(15)),
                            ),
                        Container(
                          margin: const EdgeInsets.all(5),
                          width: 220,
                          height: 150,
                          decoration: BoxDecoration(
                            image: const DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxheSidHp1qkR5nQrDOjW7xQqbuimS8ZR70A&usqp=CAU",),fit: BoxFit.fill),
                            boxShadow: const [BoxShadow(color: Color.fromARGB(70, 84, 83, 83) , blurRadius: 2 , spreadRadius: 3)],
                            borderRadius: BorderRadius.circular(15)),
                            ),
                      ],),
                    ],
                  ),
                ),
              ),
            ),
            //! terndings ----------------------------------------------------
              Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(top: 14,bottom: 14),
              width: double.infinity,
              height: 280,
              child: Column(children: [
                //! texts
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [  
                    //! title 
                    Text(TextConsts.trendings , style: TextStyles.offersTitle ,),
                    //! see all
                    Container(
                      margin: const EdgeInsets.all(7),
                      width: 90,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorPallet.secondary,),
                      child:  Center(child: Text(TextConsts.seeAll , style: TextStyles.seeAll,)),
                )],  
                ) ,
                //!cards 
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index ){
                      return Container(
                        margin: index >0 ? const EdgeInsets.only(left: 8 ,) :const EdgeInsets.only(left: 8) ,
                    width: 160,
                    decoration: BoxDecoration(
                      color: ColorPallet.cards,
                      borderRadius: BorderRadius.circular(Meassurments.boxBorderRadius)),
                      child: Column(
                        children: [
                           //! image 
                            Container(
                            margin: const EdgeInsets.all(8),
                            width:130,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15), 
                              image:const DecorationImage(image: AssetImage("assets/icons/mob.png"),fit: BoxFit.cover )
                              ),
                          ),
                            //! title
                            const Text("ipone SE 2020"),
                            //! price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              //! bargen banner 
                              Container(
                                margin: const EdgeInsets.only(right: 10 , top: 10),
                                width: 50,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: ColorPallet.secondary, 
                                  borderRadius: BorderRadius.circular(8),
                                  ),
                                child: Center(child: Text("24%", style: TextStyles.cardBargen,)),
                              ),
                              //! price value
                              Container(
                                margin: const EdgeInsets.all(10),
                                child: const Column(children: [
                                  Text("19000"),
                                  Text(
                                    "222",style: TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey))
                                ],),
                              )
                              ],
                            )
                        ],
                      ),
                  );
                    } ),
                )
              ],)
            ),
        ]
        ,),
        ),
      ),
    );
  }
}

class BannerImages {
  static const String banner1 =
      "https://media.wired.com/photos/63a49538145a571e203e3a7d/master/w_1600%2Cc_limit/asuschromebookflipcx5_GEAR.jpg";
  static const String banner2 =
      "https://media.wired.com/photos/62755f0e74e0428e36b7f383/master/w_1600%2Cc_limit/Acer-Swift-3x-Gear.jpg";
  static const String banner3 = "https://media.product.which.co.uk/prod/images/ar_2to1_900x450/5afeb9dc1a02-mobile-and-sim-dealsadvicerevised.webp";
  static const String banner4 =
      "https://images.macrumors.com/t/JUtpCjCRu4zsypwl_8gRVMguwo0=/800x0/article-new/2022/05/airpods-3-purple.jpg?lossy";

  static List<BannerModel> listBanners = [
    BannerModel(imagePath: banner1, id: "1"),
    BannerModel(imagePath: banner2, id: "2"),
    BannerModel(imagePath: banner3, id: "3"),
    BannerModel(imagePath: banner4, id: "4"),
  ];
}

class Card2 extends StatelessWidget {
  const Card2({super.key});

  @override
  Widget build(BuildContext context) {
    return 
Container(
                      // margin: index >0 ? const EdgeInsets.only(left: 8 ,) :const EdgeInsets.only(left: 8) ,
                    width: 160,
                    decoration: BoxDecoration(
                      color: ColorPallet.background , 
                      borderRadius: BorderRadius.circular(Meassurments.boxBorderRadius)),
                      child: Column(
                        children: [
                           //! image 
                            Container(
                            margin: const EdgeInsets.all(8),
                            width:130,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15), 
                              image:const DecorationImage(image: AssetImage("assets/icons/mob.png"),fit: BoxFit.cover )
                              ),
                          ),
                            //! title
                            const Text("ipone SE 2020"),
                            //! price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              //! bargen banner 
                              Container(
                                margin: const EdgeInsets.only(right: 10 , top: 10),
                                width: 50,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: ColorPallet.secondary, 
                                  borderRadius: BorderRadius.circular(8),
                                  ),
                                child: Center(child: Text("24%", style: TextStyles.cardBargen,)),
                              ),
                              //! price value
                              Container(
                                margin: const EdgeInsets.all(10),
                                child: const Column(children: [
                                  Text("19000"),
                                  Text(
                                    "222",style: TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey))
                                ],),
                              )
                              ],
                            )
                        ],
                        //! title
                        //! price
                      ),
                
                
                  );
  }
}
