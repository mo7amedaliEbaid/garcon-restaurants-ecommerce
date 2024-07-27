part of 'privacy_repo.dart';
abstract class BasePrivacyRepository{
  Stream<Info> getPrivacy();
}