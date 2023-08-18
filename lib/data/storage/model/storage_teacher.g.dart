// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_teacher.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStorageTeacherCollection on Isar {
  IsarCollection<StorageTeacher> get storageTeachers => this.collection();
}

const StorageTeacherSchema = CollectionSchema(
  name: r'StorageTeacher',
  id: 5967363369712483575,
  properties: {
    r'classroom': PropertySchema(
      id: 0,
      name: r'classroom',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.string,
    ),
    r'initials': PropertySchema(
      id: 2,
      name: r'initials',
      type: IsarType.string,
    ),
    r'institutionId': PropertySchema(
      id: 3,
      name: r'institutionId',
      type: IsarType.string,
    ),
    r'titleId': PropertySchema(
      id: 4,
      name: r'titleId',
      type: IsarType.string,
    )
  },
  estimateSize: _storageTeacherEstimateSize,
  serialize: _storageTeacherSerialize,
  deserialize: _storageTeacherDeserialize,
  deserializeProp: _storageTeacherDeserializeProp,
  idName: r'localId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _storageTeacherGetId,
  getLinks: _storageTeacherGetLinks,
  attach: _storageTeacherAttach,
  version: '3.1.0+1',
);

int _storageTeacherEstimateSize(
  StorageTeacher object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.initials.length * 3;
  bytesCount += 3 + object.institutionId.length * 3;
  bytesCount += 3 + object.titleId.length * 3;
  return bytesCount;
}

void _storageTeacherSerialize(
  StorageTeacher object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.classroom);
  writer.writeString(offsets[1], object.id);
  writer.writeString(offsets[2], object.initials);
  writer.writeString(offsets[3], object.institutionId);
  writer.writeString(offsets[4], object.titleId);
}

StorageTeacher _storageTeacherDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StorageTeacher(
    classroom: reader.readLong(offsets[0]),
    id: reader.readString(offsets[1]),
    initials: reader.readString(offsets[2]),
    institutionId: reader.readString(offsets[3]),
    titleId: reader.readString(offsets[4]),
  );
  return object;
}

P _storageTeacherDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _storageTeacherGetId(StorageTeacher object) {
  return object.localId;
}

List<IsarLinkBase<dynamic>> _storageTeacherGetLinks(StorageTeacher object) {
  return [];
}

void _storageTeacherAttach(
    IsarCollection<dynamic> col, Id id, StorageTeacher object) {}

extension StorageTeacherQueryWhereSort
    on QueryBuilder<StorageTeacher, StorageTeacher, QWhere> {
  QueryBuilder<StorageTeacher, StorageTeacher, QAfterWhere> anyLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StorageTeacherQueryWhere
    on QueryBuilder<StorageTeacher, StorageTeacher, QWhereClause> {
  QueryBuilder<StorageTeacher, StorageTeacher, QAfterWhereClause>
      localIdEqualTo(Id localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: localId,
        upper: localId,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterWhereClause>
      localIdNotEqualTo(Id localId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: localId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: localId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: localId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: localId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterWhereClause>
      localIdGreaterThan(Id localId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: localId, includeLower: include),
      );
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterWhereClause>
      localIdLessThan(Id localId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: localId, includeUpper: include),
      );
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterWhereClause>
      localIdBetween(
    Id lowerLocalId,
    Id upperLocalId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerLocalId,
        includeLower: includeLower,
        upper: upperLocalId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StorageTeacherQueryFilter
    on QueryBuilder<StorageTeacher, StorageTeacher, QFilterCondition> {
  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      classroomEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'classroom',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      classroomGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'classroom',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      classroomLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'classroom',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      classroomBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'classroom',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
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

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
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

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition> idBetween(
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

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
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

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
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

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition> idMatches(
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

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      initialsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'initials',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      initialsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'initials',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      initialsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'initials',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      initialsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'initials',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      initialsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'initials',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      initialsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'initials',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      initialsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'initials',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      initialsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'initials',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      initialsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'initials',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      initialsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'initials',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      institutionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'institutionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      institutionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'institutionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      institutionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'institutionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      institutionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'institutionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      institutionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'institutionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      institutionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'institutionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      institutionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'institutionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      institutionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'institutionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      institutionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'institutionId',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      institutionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'institutionId',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      localIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      localIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      localIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      localIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      titleIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      titleIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      titleIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      titleIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      titleIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'titleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      titleIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'titleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      titleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'titleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      titleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'titleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      titleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleId',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      titleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'titleId',
        value: '',
      ));
    });
  }
}

extension StorageTeacherQueryObject
    on QueryBuilder<StorageTeacher, StorageTeacher, QFilterCondition> {}

extension StorageTeacherQueryLinks
    on QueryBuilder<StorageTeacher, StorageTeacher, QFilterCondition> {}

extension StorageTeacherQuerySortBy
    on QueryBuilder<StorageTeacher, StorageTeacher, QSortBy> {
  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy> sortByClassroom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classroom', Sort.asc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy>
      sortByClassroomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classroom', Sort.desc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy> sortByInitials() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initials', Sort.asc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy>
      sortByInitialsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initials', Sort.desc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy>
      sortByInstitutionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'institutionId', Sort.asc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy>
      sortByInstitutionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'institutionId', Sort.desc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy> sortByTitleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleId', Sort.asc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy>
      sortByTitleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleId', Sort.desc);
    });
  }
}

extension StorageTeacherQuerySortThenBy
    on QueryBuilder<StorageTeacher, StorageTeacher, QSortThenBy> {
  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy> thenByClassroom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classroom', Sort.asc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy>
      thenByClassroomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classroom', Sort.desc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy> thenByInitials() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initials', Sort.asc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy>
      thenByInitialsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initials', Sort.desc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy>
      thenByInstitutionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'institutionId', Sort.asc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy>
      thenByInstitutionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'institutionId', Sort.desc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy> thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy>
      thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy> thenByTitleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleId', Sort.asc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy>
      thenByTitleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleId', Sort.desc);
    });
  }
}

extension StorageTeacherQueryWhereDistinct
    on QueryBuilder<StorageTeacher, StorageTeacher, QDistinct> {
  QueryBuilder<StorageTeacher, StorageTeacher, QDistinct>
      distinctByClassroom() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classroom');
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QDistinct> distinctByInitials(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'initials', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QDistinct>
      distinctByInstitutionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'institutionId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QDistinct> distinctByTitleId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titleId', caseSensitive: caseSensitive);
    });
  }
}

extension StorageTeacherQueryProperty
    on QueryBuilder<StorageTeacher, StorageTeacher, QQueryProperty> {
  QueryBuilder<StorageTeacher, int, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<StorageTeacher, int, QQueryOperations> classroomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classroom');
    });
  }

  QueryBuilder<StorageTeacher, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StorageTeacher, String, QQueryOperations> initialsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'initials');
    });
  }

  QueryBuilder<StorageTeacher, String, QQueryOperations>
      institutionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'institutionId');
    });
  }

  QueryBuilder<StorageTeacher, String, QQueryOperations> titleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titleId');
    });
  }
}
