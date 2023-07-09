import 'package:artman_web/features/product_list_feature/data/product_api_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/product_model.dart';
part 'product_state.dart';


class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productApiProvider) : super(ProductInitial());

  int page = 1 ; 
  ProductApiProvider productApiProvider  ; 
  
  void loadProducts (){
    if (state is ProductLoading ){
      return ; //! if state is loading so dont need to load products again
    }
    //
    final current = state ; 
    var oldProduct = <ProductModel>[];

    if(current is ProductLoaded){//! now data need to be load 
      oldProduct = current.Product;
    }
    emit(ProductLoading(oldProduct , isFirstFetch: page == 1));

    productApiProvider.getProducts(pageNumber: page , pageSize: "7").then((newProducts){
      page ++ ;
      final  products =  (state as ProductLoading).oldProduct;
      products.addAll(newProducts);
      emit(ProductLoaded(products));
    } );



  }
}
