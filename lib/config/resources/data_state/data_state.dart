
//! managing data when its recive by cubits

abstract class DataState<T> {
  final T? data ; 
  final String? error ;

  DataState(this.data, this.error);
}

//* success 
class SucessData<T> extends DataState<T>{
  SucessData(T data ) :super(data , null);

}
//! failed 
class ErrorData<T> extends DataState<T>{
  ErrorData(String error):super(null , error);
}