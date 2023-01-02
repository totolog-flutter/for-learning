import 'package:flutter_youtube1/schemas/schema.dart';
import 'package:flutter_youtube1/service/realm.dart';
import 'package:realm/realm.dart';

class MainController {
  void getDepartments() {
    final departments =
        RealmService.realmInstance.getDepartments('TRUEPREDICATE SORT(id ASC)');
    print('department一覧: $departments');
  }

  void getMembers() {
    final members =
        RealmService.realmInstance.getMembers('TRUEPREDICATE SORT(id ASC)');
    print('全member数: ${members.length}');
  }

  void addMember(int counterNum) {
    final member = Member(
      ObjectId(),
      'Hana Kojima$counterNum',
      'hana.kojima$counterNum@sample.com',
    );
    RealmService.realmInstance.addMemberSampleData(member);
    final members =
        RealmService.realmInstance.getMembers('TRUEPREDICATE SORT(id ASC)');
    print('追加後: 全member数: ${members.length}');
    for (var member in members) {
      print(member.name);
    }
  }

  MainController();
}
