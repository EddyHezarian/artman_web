part of 'cart_product_cubit.dart';

@immutable
abstract class  CartProductState{}
class InitialAppState extends CartProductState {}
class SetCurrentIndexAppState extends CartProductState {}
class SetDateState extends CartProductState {}
class GetBoxState extends CartProductState {}
class AddToCartState extends CartProductState {}