part of 'customer_cubit.dart';

@immutable
abstract class  CustomerState{}
class InitialCustomerState extends CustomerState {}
class GetCustomer extends CustomerState {}
class LoadedData extends CustomerState {}
class LoadingData extends CustomerState {}
class SaveCustomerState extends CustomerState {}