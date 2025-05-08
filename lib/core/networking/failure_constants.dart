abstract class Failure {
  final String message;
  const Failure(this.message);
}

// Server/API related issues (500, 404, etc.)
class ServiceError extends Failure {
  final int? statusCode;
  const ServiceError({required String message, this.statusCode})
    : super(message);
}

// Data format/parsing/JSON issues
class UnexpectedFormat extends Failure {
  const UnexpectedFormat() : super('Unexpected data format');
}

// Client-side or connectivity issue (e.g. no internet)
class NetworkFailure extends Failure {
  const NetworkFailure() : super('No internet connection');
}

// Timeouts or slow connection
class TimeoutFailure extends Failure {
  const TimeoutFailure() : super('Request timed out');
}

// Auth-related error
class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

// Catch-all for unknown/unexpected errors
class UnknownFailure extends Failure {
  const UnknownFailure() : super('Something went wrong');
}

class CustomFailure extends Failure {
  const CustomFailure(super.message);
}
