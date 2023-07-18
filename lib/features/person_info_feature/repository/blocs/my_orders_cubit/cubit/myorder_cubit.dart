import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../../../auth_feature/data/models/customer_model.dart';
import '../../../../../cart_feature/data/models/order.dart';
import '../../../../../cart_feature/data/remote_data/order_api_provider.dart';

part 'myorder_state.dart';

class MyorderCubit extends Cubit<MyOrderState> {
  MyorderCubit( this.orderAPiProvider) : super(OrderInitial());
  OrderAPiProvider orderAPiProvider;
  void loadOrders() async{
    if (state is OrderLoading) {
      return;
    }
    final current = state;
    var oldOrders = <OrderModel>[];
    if (current is OrderLoaded) {
      oldOrders = current.orders;
    }
    emit(OrderLoading(oldOrders,));
    List<CustomerModel>customerBox= [];
    List<int>keys =[];
    var box = await Hive.openBox<CustomerModel>("customers");
    keys = box.keys.cast<int>().toList();
    for (var key in keys) {
      customerBox.add(box.get(key)!);
    }
    box.close();
    orderAPiProvider.getOrders(id:  customerBox[0].id.toString()).then((value) {
      final orders = (state as OrderLoading).oldOrder;
      orders.replaceRange(0 , orders.length , value);
      emit(OrderLoaded(orders));
    });
  }
}
