part of 'user_repo.dart';

abstract class BaseUserRepository {
  Stream<CurrentUser> getUser(String userId);

  Future<void> updateUser(
      {required CurrentUser updatedUser,
      // required User currentUser,
      required String userId});

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}
