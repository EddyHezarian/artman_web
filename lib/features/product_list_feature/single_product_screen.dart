
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class SingleProductScreen extends StatelessWidget {
  const SingleProductScreen({super.key});

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
                  //! favorite
                  //! share
                ],
                ),
                //! image 
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(image: AssetImage("assets/icons/mob.png"),fit: BoxFit.cover ))
                  ,),
                //! name 
                Text("میومویمویمویمیومیوم" , style: TextStyles.nameOfPrudoctList, ),
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("49000"),
                        SizedBox(width: 10,),
                        Text("تومان"),
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
          child: Row(children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: 140,
              height: 50,
              decoration: BoxDecoration(color: ColorPallet.secondary ,borderRadius: BorderRadius.circular(10)),
              child: const Text("خرید",style: TextStyle(color: Colors.black12)),
            )
          ],)
          ),
        ),
    );
      
  }
}