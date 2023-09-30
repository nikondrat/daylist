// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_subject.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStorageSubjectCollection on Isar {
  IsarCollection<StorageSubject> get storageSubjects => this.collection();
}

const StorageSubjectSchema = CollectionSchema(
  name: r'StorageSubject',
  id: -9038469283834222307,
  properties: {
    r'groupId': PropertySchema(
      id: 0,
      name: r'groupId',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.string,
    ),
    r'showInWeek': PropertySchema(
      id: 2,
      name: r'showInWeek',
      type: IsarType.boolList,
    ),
    r'weekday': PropertySchema(
      id: 3,
      name: r'weekday',
      type: IsarType.long,
    )
  },
  estimateSize: _storageSubjectEstimateSize,
  serialize: _storageSubjectSerialize,
  deserialize: _storageSubjectDeserialize,
  deserializeProp: _storageSubjectDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {
    r'teacher': LinkSchema(
      id: -7792998063618046110,
      name: r'teacher',
      target: r'StorageTeacher',
      single: true,
    ),
    r'time': LinkSchema(
      id: 2956412363496374230,
      name: r'time',
      target: r'StorageTime',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _storageSubjectGetId,
  getLinks: _storageSubjectGetLinks,
  attach: _storageSubjectAttach,
  version: '3.1.0+1',
);

int _storageSubjectEstimateSize(
  StorageSubject object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.groupId.length * 3;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.showInWeek.length;
  return bytesCount;
}

void _storageSubjectSerialize(
  StorageSubject object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.groupId);
  writer.writeString(offsets[1], object.id);
  writer.writeBoolList(offsets[2], object.showInWeek);
  writer.writeLong(offsets[3], object.weekday);
}

StorageSubject _storageSubjectDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StorageSubject(
    groupId: reader.readString(offsets[0]),
    id: reader.readString(offsets[1]),
    showInWeek: reader.readBoolList(offsets[2]) ?? [],
    weekday: reader.readLong(offsets[3]),
  );
  return object;
}

P _storageSubjectDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBoolList(offset) ?? []) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _storageSubjectGetId(StorageSubject object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _storageSubjectGetLinks(StorageSubject object) {
  return [object.teacher, object.time];
}

void _storageSubjectAttach(
    IsarCollection<dynamic> col, Id id, StorageSubject object) {
  object.teacher
      .attach(col, col.isar.collection<StorageTeacher>(), r'teacher', id);
  object.time.attach(col, col.isar.collection<StorageTime>(), r'time', id);
}

extension StorageSubjectQueryWhereSort
    on QueryBuilder<StorageSubject, StorageSubject, QWhere> {
  QueryBuilder<StorageSubject, StorageSubject, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StorageSubjectQueryWhere
    on QueryBuilder<StorageSubject, StorageSubject, QWhereClause> {
  QueryBuilder<StorageSubject, StorageSubject, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StorageSubjectQueryFilter
    on QueryBuilder<StorageSubject, StorageSubject, QFilterCondition> {
  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      groupIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      groupIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      groupIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      groupIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      groupIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      groupIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      groupIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      groupIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groupId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      groupIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupId',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      groupIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groupId',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      showInWeekElementEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showInWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      showInWeekLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'showInWeek',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      showInWeekIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'showInWeek',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      showInWeekIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'showInWeek',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      showInWeekLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'showInWeek',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      showInWeekLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'showInWeek',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      showInWeekLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'showInWeek',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      weekdayEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weekday',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      weekdayGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weekday',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      weekdayLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weekday',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      weekdayBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weekday',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StorageSubjectQueryObject
    on QueryBuilder<StorageSubject, StorageSubject, QFilterCondition> {}

extension StorageSubjectQueryLinks
    on QueryBuilder<StorageSubject, StorageSubject, QFilterCondition> {
  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition> teacher(
      FilterQuery<StorageTeacher> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'teacher');
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      teacherIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'teacher', 0, true, 0, true);
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition> time(
      FilterQuery<StorageTime> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'time');
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterFilterCondition>
      timeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'time', 0, true, 0, true);
    });
  }
}

extension StorageSubjectQuerySortBy
    on QueryBuilder<StorageSubject, StorageSubject, QSortBy> {
  QueryBuilder<StorageSubject, StorageSubject, QAfterSortBy> sortByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterSortBy>
      sortByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterSortBy> sortByWeekday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekday', Sort.asc);
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterSortBy>
      sortByWeekdayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekday', Sort.desc);
    });
  }
}

extension StorageSubjectQuerySortThenBy
    on QueryBuilder<StorageSubject, StorageSubject, QSortThenBy> {
  QueryBuilder<StorageSubject, StorageSubject, QAfterSortBy> thenByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterSortBy>
      thenByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterSortBy> thenByWeekday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekday', Sort.asc);
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QAfterSortBy>
      thenByWeekdayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekday', Sort.desc);
    });
  }
}

extension StorageSubjectQueryWhereDistinct
    on QueryBuilder<StorageSubject, StorageSubject, QDistinct> {
  QueryBuilder<StorageSubject, StorageSubject, QDistinct> distinctByGroupId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QDistinct>
      distinctByShowInWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showInWeek');
    });
  }

  QueryBuilder<StorageSubject, StorageSubject, QDistinct> distinctByWeekday() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weekday');
    });
  }
}

extension StorageSubjectQueryProperty
    on QueryBuilder<StorageSubject, StorageSubject, QQueryProperty> {
  QueryBuilder<StorageSubject, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<StorageSubject, String, QQueryOperations> groupIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupId');
    });
  }

  QueryBuilder<StorageSubject, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StorageSubject, List<bool>, QQueryOperations>
      showInWeekProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showInWeek');
    });
  }

  QueryBuilder<StorageSubject, int, QQueryOperations> weekdayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weekday');
    });
  }
}