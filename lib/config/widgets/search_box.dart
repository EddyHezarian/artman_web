import 'package:artman_web/config/conststants/icon_urls.dart';
import 'package:artman_web/config/conststants/meassurments.dart';
import 'package:artman_web/config/conststants/text_consts.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/features/product_list_feature/data/models/product_model.dart';
import 'package:artman_web/features/product_list_feature/data/remote_data/product_api_provider.dart';
import 'package:artman_web/features/product_list_feature/presentation/screens/product_list_screen.dart';
import 'package:artman_web/features/product_list_feature/presentation/screens/single_product_screen.dart';
import 'package:artman_web/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  final ProductApiProvider productApiProvider = locator();

  SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(
        right: 40,
        top: 20,
        left: 40,
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorPallet.searchBox),
      child: Row(
        children: [
          Image.asset(
            IconsUrl.search,
            height: 30,
            width: 30,
          ),
          const SizedBox(
            width: Meassurments.crossSpaceinBox,
          ),
          Expanded(
              child: TypeAheadField(
                loadingBuilder: (context) {
                  return Center(child: LoadingAnimationWidget.horizontalRotatingDots(color: ColorPallet.secondary, size: 40));
                },
            itemSeparatorBuilder: (context, index) => const Divider(),
            suggestionsBoxDecoration: SuggestionsBoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            //! loadingBuilder: (context) => ,
            suggestionsCallback: (String prefix) {
              return productApiProvider.getProducts(
                pageSize: "4",
                strSearch: prefix,
              );
            },
            itemBuilder: (context, ProductModel model) {
              return ListTile(
                leading: const Icon(Icons.shopping_bag_rounded),
                title: Text(
                  model.name!,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              );
            },
            textFieldConfiguration: TextFieldConfiguration(
                onEditingComplete: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ProductsListScreen(
                          search: searchController.text,
                          title: searchController.text);
                    })),
                controller: searchController,
                decoration: const InputDecoration.collapsed(
                    hintText: TextConsts.searchBox,hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "sens"))),
            animationDuration: const Duration(milliseconds: 100),
            noItemsFoundBuilder: (context) {
              return const ListTile(
                title: Text("محصولی یافت نشد.", style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 43, 42, 42),
                                fontWeight: FontWeight.bold,
                                fontFamily: "sens")),
              );
            },
            onSuggestionSelected: (ProductModel suggestion) {
              searchController.text = suggestion.name!;
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SingleProductScreen(model: suggestion);
              }));
            },
          ))
        ],
      ),
    );
  }
}
