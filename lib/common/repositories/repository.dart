abstract class Repository {

  String get endpoint;
  String get uri => '$endpoint';
}