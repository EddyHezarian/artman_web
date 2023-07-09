// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:artman_web/config/resources/data_state/data_state.dart';
import 'package:artman_web/features/category_feature/repository/model/category_model.dart';

import '../../../config/error_handling/app_exeption.dart';
import '../../../config/error_handling/check_exeptions.dart';
import 'category_api_providers.dart';

class CategoryRepository {
  CategoryApiProvider apiProvider;
  CategoryRepository({
    required this.apiProvider,
  });

  Future<DataState<List<CategoryModel>>> fetchCategoryData()async{
    try {
      var res = await apiProvider.getCategories();
      List<CategoryModel> models = res;
      return SucessData(models); 
    } on AppException catch (e) {
      return await CheckExceptions.getError(e);
      
    }

  }
  
}
