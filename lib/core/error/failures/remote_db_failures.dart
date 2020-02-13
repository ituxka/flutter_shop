import 'package:flutter_udemy_shop/core/error/failures/failures.dart';

class DBFailure extends Failure {
  const DBFailure(String message) : super(message);
}

class NoEntityFailure extends Failure {
  const NoEntityFailure(String message) : super(message);
}
