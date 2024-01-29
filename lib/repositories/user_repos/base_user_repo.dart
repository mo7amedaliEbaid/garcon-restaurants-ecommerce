part of 'user_repo.dart';

abstract class BaseUserRepository {
  Stream<User> getUser(String userId);

  Future<void> updateUser(
      {required User updatedUser,
      required User currentUser,
      required String userId});
}
