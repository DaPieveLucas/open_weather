abstract class Failure {
  Failure({required this.message});
  final String? message;

  @override
  bool operator ==(covariant Failure other) {
    if (identical(this, other)) {
      return true;
    }

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(message: message);
}

class CacheFailure extends Failure {
  CacheFailure({required String message}) : super(message: message);
}
