import 'package:artman_web/features/cart_feature/data/models/cart_product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
part 'cart_product_state.dart';

class CartProductCubit extends Cubit<CartProductState> {
  CartProductCubit() : super(InitialAppState());

  //! get instance of cubit
  static CartProductCubit get(context) => BlocProvider.of(context);

  List<CartProductModel>? cartProductList = [];
  List<int>? keys = [];

  //! read database
  getBox() async {
    print("context");
    var box = await Hive.openBox<CartProductModel>("cartProduct");
    keys = [];
    keys = box.keys.cast<int>().toList();
    cartProductList = [];
    for (var key in keys!) {
      cartProductList!.add(box.get(key)!);
    }

    emit(GetBoxState());
    box.close();
  } 

  //! write product to db
  addProduct(CartProductModel model) async {
    await Hive.openBox<CartProductModel>("cartProduct")
        .then((value) => value.add(model))
        .then((value) => getBox());
    emit(AddToCartState());
  } 
  
  
  //! delete
  deleteProduct(CartProductModel model) async {
    await Hive.openBox<CartProductModel>("cartProduct").then((value) {
      final Map<dynamic, CartProductModel> productMap = value.toMap();
      dynamic desiredKey;
      productMap.forEach((key, value) {
        if (value.productId == model.productId) {
          desiredKey = key;
        }
      });
      return value.delete(desiredKey);
    }).then((value) => getBox());
  }
  
  //! update
  updateQTY(CartProductModel model)async{
    await Hive.openBox<CartProductModel>("cartProduct").then((value) {
      final Map<dynamic , CartProductModel>productMap = value.toMap();
      dynamic desiredKey ; 
      productMap.forEach((key, value) {
        if(value.productId == model.productId ){
          desiredKey = key;
        }
      });
      return value.put(desiredKey, model);
    }).then((value) => getBox());
  }
}
