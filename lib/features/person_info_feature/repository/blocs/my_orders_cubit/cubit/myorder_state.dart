part of 'myorder_cubit.dart';

@immutable
abstract class MyOrderState {}

class OrderInitial extends MyOrderState {}

class OrderLoaded  extends MyOrderState{
 final List<OrderModel> orders ;
 OrderLoaded(this.orders);
}

class OrderLoading extends MyOrderState{
  final List<OrderModel> oldOrder;
  final bool isFirstFetch ; 
  OrderLoading(this.oldOrder, {this.isFirstFetch = false});
}
