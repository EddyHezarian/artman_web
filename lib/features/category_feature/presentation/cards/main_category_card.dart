import 'package:artman_web/config/conststants/meassurments.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:artman_web/features/category_feature/repository/model/category_model.dart';
import 'package:artman_web/features/product_list_feature/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

Widget mainCategoryCart(BuildContext context , int index ,CategoryModel model  ){
  return  InkWell(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
      return  ProductsList(category: model.categoryId.toString(), title: model.categoryName!,); 
      })),//! create product list 
    child: Container(
                    margin: const EdgeInsets.only(right: 20 , left: 20 , bottom: 10),
                    width:MediaQuery.of(context).size.width *  0.8 ,
                    height: 100,
                    decoration: BoxDecoration(
                      color: ColorPallet.searchBox,
                      borderRadius: BorderRadius.circular(Meassurments.boxBorderRadius) ),
                    child:Row(children: [
                      //! product cover 
                      Container(
                        margin: const EdgeInsets.only(right: 5 ),
                        width: MediaQuery.of(context).size.width *  0.22,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        
                          borderRadius: BorderRadius.circular(Meassurments.boxBorderRadius)),
                      ),
                      //! product info 
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width *  0.50,
                              child: Text(model.categoryName!, style: TextStyles.nameOfCategory,)),
                              SizedBox( width: 200,child: Text(model.categorydescription!, style: TextStyles.countOfCategory,)),
                          ],),
                      ),
                      //! icon
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Align(alignment: Alignment.centerRight, child: Icon(Icons.keyboard_arrow_left, size: 30, )),
                      )
        
                    ],) ,
        
                  ),
  );
}