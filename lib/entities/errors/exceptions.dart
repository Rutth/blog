abstract class BlogException implements Exception {
  final String message;
  BlogException(this.message);
}

class NoInternetException extends BlogException {
  NoInternetException() : super('Você está sem internet no momento.');
}

class TimeoutException extends BlogException {
  TimeoutException()
      : super(
            'Não foi possível realizar ação. Verifique sua conexão e tente novamente.');
}

class GeneralException extends BlogException {
  GeneralException(String message) : super(message);
}

class ProfileException extends BlogException {
  ProfileException(String message) : super(message);
}
