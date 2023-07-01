import 'package:artman_web/config/conststants/icon_urls.dart';
import 'package:artman_web/config/conststants/meassurments.dart';
import 'package:artman_web/config/conststants/text_consts.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:artman_web/config/widgets/bottom_nav.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';

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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
            //! search container  ------------------------------------------------
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(right: 40 , top:  20 , left: 40),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade300
                ),
                child: Row(
                  children: [
                    Image.asset(IconsUrl.search,height: 30,width: 30,),
                    const SizedBox(width: Meassurments.crossSpaceinBox,),
                      Expanded(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: TextConsts.searchBox,
                          hintStyle: TextStyles.hint ),
                      ),
                    )
                  ],
                ),
            
            ),
            const SizedBox(height: 25,),
            //! baner -------------------------------------------------
            BannerCarousel(
              //Todo ---> convert to custome banner maker with clipRRect
              //Todo---> convert to widget file into home_ feature dierctory !!!
              banners: BannerImages.listBanners,
              customizedIndicators: const IndicatorModel.animation(
                  width: 20, 
                  height: 5, 
                  spaceBetween: 2, 
                  widthAnimation: 50),
              height: 170,
              activeColor: const Color.fromARGB(255, 255, 20, 20),
              disableColor: Colors.white,
              animation: true,  
              borderRadius: 20,
              onTap: (id) => print(id),
              width: 500,
              indicatorBottom: false,
            ),
            //! category icons-------------------------------
            const SizedBox(height: 19,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Column(
                children: [
                  Container(
                    width: 60 ,
                    height: 60 ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),color: Colors.amber,
                    ),
                  child: const Center(child: Icon(Icons.laptop)
                  ),
                  ),
                  Text("لپتاپ" , style: TextStyles.categoryLabel)//Todo test 
                ],
              ),            
              Column(
                children: [
                  Container(
                    width: 60 ,
                    height: 60 ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),color: Colors.red,
                    ),
                  child: const Center(child: Icon(Icons.phone)),
                  ),
                  Text("موبایل",style: TextStyles.categoryLabel,)//Todo test 
                ],
              ),            
              Column(
                children: [
                  Container(
                    width: 60 ,
                    height: 60 ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),color: Colors.blue,
                    ),
                  child: const Center(child: Icon(Icons.edit)),
                  ),
                  Text("تبلت",style: TextStyles.categoryLabel,)//Todo test 
                ],
              ),            
              Column(
                children: [
                  Container(
                    width: 60 ,
                    height: 60 ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),color: Colors.purple,
                    ),
                  child: const Center(child: Icon(Icons.headphones)),
                  ),
                  Text("جانبی",style: TextStyles.categoryLabel,)//Todo test 
                ],
              ),            
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [  
                    //! title 
                    Text(TextConsts.amazingOffers , style: TextStyles.offersTitle ,),
                    //! see all
                    Text(TextConsts.seeAll , style: TextStyles.seeAll,)
                  ],  
                ) ,
                //!cards 
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index ){
                      return 
                      Container(
                        margin: index >0 ? const EdgeInsets.only(left: 8 ,) :const EdgeInsets.only(left: 8) ,
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
                      ),
                  );
                    } ),
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
                      width: 70,
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
                      ),
                  );
                    } ),
                )
              ],)
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
                      width: 70,
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
                      ),
                  );
                    } ),
                )
              ],)
            ),
        ]
        ,),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){}, 
          backgroundColor: ColorPallet.secondary,
          child: Image.asset(IconsUrl.shopping,
          color: ColorPallet.background , 
          width: 30 , 
          
          ),),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomeBottomNav(controller: controller),
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
