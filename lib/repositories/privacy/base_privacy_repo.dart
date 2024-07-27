import '../../models/models.dart';

abstract class BasePrivacyRepository{
  Stream<Info> getPrivacy();
}