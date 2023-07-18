part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> product;
  ProductLoaded(this.product);
}

//! loading 
class ProductLoading extends ProductState {
  final List<ProductModel> oldProduct;
  final bool isFirstFetch; //! if first fetch true then show circular indicator in center 
  ProductLoading(this.oldProduct, {this.isFirstFetch=false});
}