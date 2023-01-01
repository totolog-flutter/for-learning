import 'package:realm/realm.dart';

part 'schema.g.dart';

@RealmModel()
class _Member {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late String email;
  late List<String> skills;
}

@RealmModel()
class _Department {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late List<_Member> members;
}