import 'package:artman_web/features/product_list_feature/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(InitialWishState());

  //! get instance of cubit
  static WishlistCubit get(context) => BlocProvider.of(context);

  List<ProductModel>? wishList = [];
  List<int>? keys = [];

  //! read database
  getWishBox() async {
    var box = await Hive.openBox<ProductModel>("getwish");
    keys = [];
    keys = box.keys.cast<int>().toList();
    wishList = [];
    for (var key in keys!) {
      wishList!.add(box.get(key)!);
    }
    emit(AddWishState());
    box.close();
  }

  //! write product to db
  addWish(ProductModel  model) async {
    await Hive.openBox<ProductModel>("getwish")
        .then((value) => value.add(model))
        .then((value) => getWishBox());

    emit(AddWishState());
  }

  //! delete
  deleteProduct(ProductModel model) async {
    await Hive.openBox<ProductModel>("getwish").then((value) {
      final Map<dynamic, ProductModel> wishMap = value.toMap();
      dynamic desiredKey;
      wishMap.forEach((key, value) {
        if (value.id == model.id) {
          desiredKey = key;
        }
      });
      return value.delete(desiredKey);
    }).then((value) => getWishBox());
  }  
  
  checkExist(ProductModel model) async {
    bool flag = false ; 
    await Hive.openBox<ProductModel>("getwish").then((value) {
      final Map<dynamic, ProductModel> wishMap = value.toMap();
      
      wishMap.forEach((key, value) {
        if (value.id == model.id) {
        flag = true;
        }
      });
      
    });
    return flag ;
  }
}
