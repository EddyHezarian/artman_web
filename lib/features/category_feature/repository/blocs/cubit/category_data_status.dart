part of 'category_cubit.dart';

@immutable
abstract class CategoryDataStatus{}

class SuccessCategoryData extends CategoryDataStatus{
  final  List<CategoryModel>  inc; 
  SuccessCategoryData(this.inc);  
}
class LoadingCategoryData extends CategoryDataStatus{}
class FailedCategoryData extends CategoryDataStatus{
  final String errorMessage ; 
  FailedCategoryData(this.errorMessage);
}
class InitialCategoryData extends CategoryDataStatus{}
