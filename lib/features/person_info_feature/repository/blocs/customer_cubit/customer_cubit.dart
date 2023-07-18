import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../../auth_feature/data/models/customer_model.dart';

part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit() : super(InitialCustomerState());

  //! get instance of cubit
  static CustomerCubit get(context) => BlocProvider.of(context);
  List<CustomerModel>? customerBox = [];
  List<int>? keys = [];

  //! read database
  getCustomer() async {
    print("get customer");
    var box = await Hive.openBox<CustomerModel>("customers");
    keys = [];
    keys = box.keys.cast<int>().toList();
    customerBox = [];
    for (var key in keys!) {
      customerBox!.add(box.get(key)!);
    }
    emit(SaveCustomerState());
    box.close();
  }

  //! write product to db
  addCustomerToBox(CustomerModel model) async {
    await Hive.openBox<CustomerModel>("customers")
        .then((value) => value.add(model))
        .then((value) => getCustomer());

    emit(SaveCustomerState());
  }

  //! delete
  deleteCustomer(CustomerModel model) async {
    await Hive.openBox<CustomerModel>("customers").then((value) {
      final Map<dynamic, CustomerModel> wishMap = value.toMap();
      dynamic desiredKey;
      wishMap.forEach((key, value) {
        if (value.email == model.email) {
          desiredKey = key;
        }
      });
      return value.delete(desiredKey);
    }).then((value) => getCustomer());
  }

  //! update
  updateCustomer(CustomerModel model) async {
    await Hive.openBox<CustomerModel>("customers").then((value) {
      final Map<dynamic, CustomerModel> productMap = value.toMap();
      dynamic desiredKey;
      productMap.forEach((key, value) {
        if (value.email == model.email) {
          desiredKey = key;
        }
      });
      return value.put(desiredKey, model);
    }).then((value) => getCustomer());
  }
}
