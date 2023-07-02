part of 'splash_cubit.dart';

@immutable
abstract class ConnectionStatus{}

class SuccessConnection extends ConnectionStatus{}
class FailedConnection extends ConnectionStatus{}
class InitialConnection extends ConnectionStatus{}