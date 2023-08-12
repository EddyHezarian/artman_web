import 'package:artman_web/config/conststants/text_consts.dart';
import 'package:artman_web/config/extensions/extention.dart';
import 'package:artman_web/config/theme/color_pallet.dart';
import 'package:artman_web/config/widgets/search_box.dart';
import 'package:artman_web/features/category_feature/presentation/cards/main_category_card.dart';
import 'package:artman_web/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/widgets/title_of_page.dart';
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
              //? loading_______________________________________________________
              if (state.categoryDataStatus is LoadingCategoryData) {
                return Scaffold(
                  body: Center(
                      child: CircularProgressIndicator(
                    color: ColorPallet.secondary,
                  )),
                );
              }
              //* success_______________________________________________________
              if (state.categoryDataStatus is SuccessCategoryData) {
                SuccessCategoryData categoryDataCompleted =
                    state.categoryDataStatus as SuccessCategoryData;
                List<CategoryModel> categoriesList = categoryDataCompleted.inc;
                //CategoriesModel categoriesModel = categoryDataCompleted.categoriesModel;

                return Scaffold(
                  body: Column(
                    children: [
                      //! search box -------------------------------------------
                      searchBox(
                        context,
                      ),
                      //! title-------------------------------------------------
                      const TitleOfPage(title: TextConsts.category),
                      //! list of category -------------------------------------
                      Expanded(
                        child: ListView.builder(
                            itemCount: categoriesList.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              var data = categoriesList[index];
                              //! card
                              return mainCategoryCart(context, index, data);
                            }),
                      )
                    ],
                  ),
                );
              }

              //! error_________________________________________________________
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
                          10.0.sizedBoxheightExtention, //! sizedbox extension
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
              //!
              return Container();
            },
          );
        }));
  }
}
