import 'package:artman_web/features/intro_feature/repository/splash_repository/splash_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';
part 'connection_status.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState(connectionStatus: InitialConnection()));
  SplashRepository splashRepository = SplashRepository();

  checkConnectionEvent()async{
    emit(state.copyWith(newConnectionStatus: InitialConnection()));
    bool isConnect = await splashRepository.checkConnectivity();
    if(isConnect){
      
      emit(state.copyWith(newConnectionStatus: SuccessConnection()));
  }
  else{emit(state.copyWith(newConnectionStatus: FailedConnection()));
  }   
  }
}
