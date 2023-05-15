
class AppError{
  final String message;
  final StackTrace? stackTrace;

  AppError(this.message, this.stackTrace);
}