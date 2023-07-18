import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:artman_web/config/resources/data_state/data_state.dart';
import 'package:artman_web/features/category_feature/data/remote_data/category_repository.dart';

import '../../../data/model/category_model.dart';



part 'category_data_status.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryRepository categoryRepository ; 
  CategoryCubit(this.categoryRepository) : super(CategoryState(categoryDataStatus: LoadingCategoryData()));

  void loadCategoryEvent ()async{
    emit(state.copyWith(newDataStatus:  LoadingCategoryData()));

    DataState dataState = await categoryRepository.fetchCategoryData();
    
    if(dataState is SucessData){
      emit(state.copyWith(newDataStatus: SuccessCategoryData(dataState.data)));
      
    }
    if(dataState is ErrorData){
      emit(state.copyWith(newDataStatus: FailedCategoryData(dataState.error!)));
    }
  }
}
