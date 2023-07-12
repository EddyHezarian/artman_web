import 'package:artman_web/features/product_list_feature/data/product_api_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/product_model.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productApiProvider) : super(ProductInitial());

  int page = 1;
  ProductApiProvider productApiProvider;

  void loadProducts(
      {String? search, String? tag, String? category, bool? isfirstCall}) {
    if (state is ProductLoading) {
      return; //! if state is loading so dont need to load products again
    }
    //
    final current = state;
    var oldProduct = <ProductModel>[];
    oldProduct.clear();
    if (current is ProductLoaded) {
      //! now data need to be load
      isfirstCall == true ? current.Product.clear() : current.Product;
      oldProduct = current.Product;
    }

    emit(ProductLoading(oldProduct, isFirstFetch: page == 1));
    if (category != null) {
      isfirstCall == true ? page = 1 : page;
      productApiProvider
          .getProducts(categoryId: category, pageNumber: page, pageSize: "7")
          .then((newProducts) {
        page++;
        final products = (state as ProductLoading).oldProduct;
        products.addAll(newProducts);
        emit(ProductLoaded(products));
      });
    }
    if (tag != null) {
      isfirstCall == true ? page = 1 : page;
      productApiProvider
          .getProducts(tagName: tag, pageNumber: page, pageSize: "7")
          .then((newProducts) {
        page++;
        final products = (state as ProductLoading).oldProduct;
        products.addAll(newProducts);
        emit(ProductLoaded(products));
      });
    }
    if (search != null) {
      isfirstCall == true ? page = 1 : page;
      productApiProvider
          .getProducts(strSearch: search, pageNumber: page, pageSize: "7")
          .then((newProducts) {
        page++;
        final products = (state as ProductLoading).oldProduct;
        products.addAll(newProducts);
        emit(ProductLoaded(products));
      });
    }


// if(tag!= null){
//       productApiProvider.getProducts(  tagName: tag, pageNumber: page , pageSize: "7").then((newProducts){
//       page ++ ;
//       final  products =  (state as ProductLoading).oldProduct;
//       products.addAll(newProducts);
//       emit(ProductLoaded(products));
//     } );
// }
// if(category!= null){
//       productApiProvider.getProducts(  categoryId: category ,pageNumber: page , pageSize: "7").then((newProducts){
//       page ++ ;
//       final  products =  (state as ProductLoading).oldProduct;
//       products.addAll(newProducts);
//       emit(ProductLoaded(products));
//     } );
// }
  }
}
