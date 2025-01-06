import 'package:equatable/equatable.dart';

class Auth extends Equatable{
  final String? token;

 const Auth({this.token});
 
  @override
  List<Object?> get props => [token];
}