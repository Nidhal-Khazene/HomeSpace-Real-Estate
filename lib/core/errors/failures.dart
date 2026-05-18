class Failures {
  final String errMessage;

  Failures({required this.errMessage});
}

class LocalFailure extends Failures {
  LocalFailure({required super.errMessage});
}
