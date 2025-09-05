import 'entities.dart';

abstract class ProfileRepository {
  Future<Profile> fetchProfile();
}


