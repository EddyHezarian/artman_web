import 'package:artman_web/config/conststants/icon_urls.dart';
import 'package:artman_web/config/conststants/meassurments.dart';
import 'package:artman_web/config/conststants/text_consts.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/features/product_list_feature/data/models/product_model.dart';
import 'package:artman_web/features/product_list_feature/data/product_api_provider.dart';
import 'package:artman_web/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController searchController = TextEditingController(); 
  final  ProductApiProvider productApiProvider = locator();

  SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return 
Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(right: 40 , top:  20 , left: 40 ,),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorPallet.searchBox
                ),
                child: Row(
                  children: [
                    Image.asset(IconsUrl.search,height: 30,width: 30,),
                    const SizedBox(width: Meassurments.crossSpaceinBox,),
                      Expanded(
                      child: TypeAheadField(
                        itemSeparatorBuilder: (context, index) => const Divider(),
                        suggestionsBoxDecoration: SuggestionsBoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        //! loadingBuilder: (context) => ,
                        suggestionsCallback: (String prefix) {
                          return productApiProvider.getProducts(pageSize: "4" ,strSearch: prefix ,);
                        },
                        itemBuilder: (context, ProductModel model){
                          return ListTile(
                            leading: const Icon(Icons.shopping_bag_rounded),
                            title: Text(model.name!,style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400),),
                          );
                        },
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: searchController,
                          decoration: const InputDecoration.collapsed(hintText: TextConsts.searchBox)
                        ),
                        animationDuration: const Duration(milliseconds: 100),
                        noItemsFoundBuilder: (context){
                          return const ListTile(
                            title: Text("محصولی یافت نشد."),
                          );
                        }, 
                        onSuggestionSelected: (ProductModel suggestion) { 
                          searchController.text = suggestion.name!;

                        },
                        )
                    )
                  ],
                ),   
            );
}
}
