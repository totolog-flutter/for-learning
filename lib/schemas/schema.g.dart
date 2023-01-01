// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Member extends _Member with RealmEntity, RealmObjectBase, RealmObject {
  Member(
    ObjectId id,
    String name,
    String email, {
    Iterable<String> skills = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set<RealmList<String>>(
        this, 'skills', RealmList<String>(skills));
  }

  Member._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get email => RealmObjectBase.get<String>(this, 'email') as String;
  @override
  set email(String value) => RealmObjectBase.set(this, 'email', value);

  @override
  RealmList<String> get skills =>
      RealmObjectBase.get<String>(this, 'skills') as RealmList<String>;
  @override
  set skills(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Member>> get changes =>
      RealmObjectBase.getChanges<Member>(this);

  @override
  Member freeze() => RealmObjectBase.freezeObject<Member>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Member._);
    return const SchemaObject(ObjectType.realmObject, Member, 'Member', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('email', RealmPropertyType.string),
      SchemaProperty('skills', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
    ]);
  }
}

class Department extends _Department
    with RealmEntity, RealmObjectBase, RealmObject {
  Department(
    ObjectId id,
    String name, {
    Iterable<Member> members = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set<RealmList<Member>>(
        this, 'members', RealmList<Member>(members));
  }

  Department._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  RealmList<Member> get members =>
      RealmObjectBase.get<Member>(this, 'members') as RealmList<Member>;
  @override
  set members(covariant RealmList<Member> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Department>> get changes =>
      RealmObjectBase.getChanges<Department>(this);

  @override
  Department freeze() => RealmObjectBase.freezeObject<Department>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Department._);
    return const SchemaObject(
        ObjectType.realmObject, Department, 'Department', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('members', RealmPropertyType.object,
          linkTarget: 'Member', collectionType: RealmCollectionType.list),
    ]);
  }
}
