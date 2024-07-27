import '../../models/models.dart';

abstract class BaseTermsRepository{
  Stream<Terms> getTerms();
}