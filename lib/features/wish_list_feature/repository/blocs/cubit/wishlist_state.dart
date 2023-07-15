part of 'wishlist_cubit.dart';

@immutable
abstract class  WishlistState{}
class InitialWishState extends WishlistState {}
class SetDateState extends WishlistState {}
class GetWishBoxState extends WishlistState {}
class AddWishState extends WishlistState {}