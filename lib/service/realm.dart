
import 'package:flutter_youtube1/schemas/schema.dart';
import 'package:realm/realm.dart';


class RealmService {
  static RealmService realmInstance = RealmService();
  late Realm realm;

  final config = Configuration.local([Member.schema, Department.schema]);
  RealmResults<RealmObject> realmAll(String query) => realm.all().query(query);

  void addDepartmentSampleData(Department department) {
    realm.write(() => realm.add(department));
  }
  void addMemberSampleData(Member member) {
    realm.write(() => realm.add(member));
  }

  List<Department> getDepartments(String query) => realm.all<Department>().query(query).toList();
  
  List<Member> getMembers(String query) => realm.all<Member>().query(query).toList();

  void initialize() {
    realm = Realm(config);
    print('realmPath: ${config.path}');
  }
}