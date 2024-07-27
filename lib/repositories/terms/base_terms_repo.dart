import '../../models/models.dart';

abstract class BaseTermsRepository{
  Stream<Info> getTerms();
}