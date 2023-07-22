import 'package:artman_web/config/conststants/text_consts.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/theme/text_styles.dart';
import 'package:artman_web/config/widgets/search_box.dart';
import 'package:artman_web/features/category_feature/presentation/cards/main_category_card.dart';
import 'package:artman_web/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/category_model.dart';
import '../../repository/blocs/cubit/category_cubit.dart';

class CategortyScreen extends StatelessWidget {
  const CategortyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CategoryCubit(locator()),
        child: Builder(builder: (context) {
          BlocProvider.of<CategoryCubit>(context).loadCategoryEvent();
          return BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              //? loading
              if (state.categoryDataStatus is LoadingCategoryData) {
                return Scaffold(
                  body: Center(
                      
                      child: CircularProgressIndicator(
                    color: ColorPallet.secondary,
                  )),
                );
              }
              //* success
              if (state.categoryDataStatus is SuccessCategoryData) {
                  SuccessCategoryData categoryDataCompleted = state.categoryDataStatus as SuccessCategoryData;
                  List<CategoryModel> categoriesList = categoryDataCompleted.inc;
                  //CategoriesModel categoriesModel = categoryDataCompleted.categoriesModel;

                return Scaffold(
                  body: Column(
                    children: [
                      //! search box ----------------------------------------
                      searchBox(context),
                      //! title-----------------------------------
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () => print(categoriesList.length),
                              child: Text(
                                TextConsts.category,
                                style: TextStyles.titleOfPage,
                              ),
                            )),
                      ),
                      //! list ----------------------------------------
                      Expanded(
                        child: ListView.builder(
                            itemCount: categoriesList.length ,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              var data  = categoriesList[index];
                              print(categoriesList.length);
                              //! card
                              return mainCategoryCart(context, index , data );
                            }),
                      )
                    ],
                  ),
                );
              }

              //! error
              if (state.categoryDataStatus is FailedCategoryData) {
                final FailedCategoryData categoryDataError =
                    state.categoryDataStatus as FailedCategoryData;
                return SafeArea(
                  child: Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            categoryDataError.errorMessage,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber.shade800),
                            onPressed: () {
                              /// call all data again
                              BlocProvider.of<CategoryCubit>(context)
                                  .loadCategoryEvent();
                            },
                            child: const Text("تلاش دوباره"),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }

              return Container();
            },
          );
        }));
  }
}
