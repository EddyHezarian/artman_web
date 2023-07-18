part of 'category_cubit.dart';

class CategoryState { 
  CategoryDataStatus categoryDataStatus ;
  CategoryState({required this.categoryDataStatus});
  
  CategoryState copyWith({
    CategoryDataStatus? newDataStatus }){
      return CategoryState(
        categoryDataStatus: newDataStatus ?? categoryDataStatus
        );
  }
}