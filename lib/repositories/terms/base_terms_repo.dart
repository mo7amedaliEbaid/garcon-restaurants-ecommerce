part of 'terms_repo.dart';

abstract class BaseTermsRepository {
  Stream<Info> getTerms();
}
