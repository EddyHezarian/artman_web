
//! managing data when its recive by cubits

abstract class DataState<T> {
  final T? data ; 
  final String? error ;

  DataState(this.data, this.error);
}

class SucessData extends DataState{
  SucessData(super.data, super.error);

}
class ErrorData extends DataState{
  ErrorData(super.data, super.error);

}