import 'package:artman_web/config/conststants/text_consts.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:artman_web/config/widgets/search_box.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallet.background,
      body:  Column(children: [
          //! search box ----------------------------------------
          searchBox(context),
          //! title-----------------------------------
          Padding(
            padding: const EdgeInsets.all(10),
            child: Align(alignment: Alignment.centerRight, child: Text(TextConsts.favorites, style: TextStyles.titleOfPage,)),
          ),
          //! list ----------------------------------------
          Expanded(
            child: ListView.builder(
              itemCount: 13,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context , index){
                //! card 
                // todo need APi , modoles to convert to cubit mode 
                return
                Column(          
                  children: [
                  Row(
                    children: [
                      //! image 
                      Container(
                        width: MediaQuery.of(context).size.width *  0.26,
                        height: MediaQuery.of(context).size.width *  0.39,
                        decoration:const BoxDecoration(
                          image: DecorationImage(//Todo make dynamic 
                            image:AssetImage("assets/icons/mob.png"),fit: BoxFit.cover
                            )
                        )
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //! title 
                          Padding(
                            padding: const EdgeInsets.only(right: 10 ,bottom: 10),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width*0.6,
                              child: Text("کوشی موبایل فلان",style: TextStyles.nameOfPrudoctList,)),
                          ),
                          //! rate
                          const Padding(
                            padding: EdgeInsets.only(right: 10, bottom: 10),
                            child: Row(children: [
                              //! 
                              Icon(Icons.star,size: 20,color: Colors.amber,),
                              Text("4.1"),
                            ],),
                          ),
                          //!price 
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(children: [
                              Text("۱۸۰۰۰۰",style: TextStyles.nameOfPrudoctList,),
                              const SizedBox(width: 8,),
                              const Text("تومان"),
                            ],),
                          ) 

                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19),
                    child: Divider(thickness: 2,color: ColorPallet.searchBox,height: 1,),
                  )
                ],);
                
              }),
          ) 
        ],),
    );
  }
}