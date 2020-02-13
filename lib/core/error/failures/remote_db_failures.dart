import 'package:flutter_udemy_shop/core/error/failures/failures.dart';

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}

class NoEntityFailure extends Failure {
  const NoEntityFailure(String message) : super(message);
}
