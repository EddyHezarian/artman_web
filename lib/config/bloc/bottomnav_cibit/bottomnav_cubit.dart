import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);
//! usage : changing the page controller of buttom navigation and change the UI screens 
  changeState(newState)=>emit(newState); 

}