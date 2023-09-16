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
      type: IsarType.string,
    ),
    r'createdBy': PropertySchema(
      id: 1,
      name: r'createdBy',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.string,
    ),
    r'initials': PropertySchema(
      id: 3,
      name: r'initials',
      type: IsarType.string,
    ),
    r'institutionId': PropertySchema(
      id: 4,
      name: r'institutionId',
      type: IsarType.string,
    )
  },
  estimateSize: _storageTeacherEstimateSize,
  serialize: _storageTeacherSerialize,
  deserialize: _storageTeacherDeserialize,
  deserializeProp: _storageTeacherDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {
    r'title': LinkSchema(
      id: 7629797123489243148,
      name: r'title',
      target: r'StorageTitle',
      single: true,
    )
  },
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
  bytesCount += 3 + object.classroom.length * 3;
  {
    final value = object.createdBy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.initials.length * 3;
  bytesCount += 3 + object.institutionId.length * 3;
  return bytesCount;
}

void _storageTeacherSerialize(
  StorageTeacher object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.classroom);
  writer.writeString(offsets[1], object.createdBy);
  writer.writeString(offsets[2], object.id);
  writer.writeString(offsets[3], object.initials);
  writer.writeString(offsets[4], object.institutionId);
}

StorageTeacher _storageTeacherDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StorageTeacher(
    classroom: reader.readString(offsets[0]),
    createdBy: reader.readStringOrNull(offsets[1]),
    id: reader.readString(offsets[2]),
    initials: reader.readString(offsets[3]),
    institutionId: reader.readString(offsets[4]),
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
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
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
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _storageTeacherGetLinks(StorageTeacher object) {
  return [object.title];
}

void _storageTeacherAttach(
    IsarCollection<dynamic> col, Id id, StorageTeacher object) {
  object.title.attach(col, col.isar.collection<StorageTitle>(), r'title', id);
}

extension StorageTeacherQueryWhereSort
    on QueryBuilder<StorageTeacher, StorageTeacher, QWhere> {
  QueryBuilder<StorageTeacher, StorageTeacher, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StorageTeacherQueryWhere
    on QueryBuilder<StorageTeacher, StorageTeacher, QWhereClause> {
  QueryBuilder<StorageTeacher, StorageTeacher, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterWhereClause>
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

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterWhereClause> isarIdBetween(
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

extension StorageTeacherQueryFilter
    on QueryBuilder<StorageTeacher, StorageTeacher, QFilterCondition> {
  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      classroomEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'classroom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      classroomGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'classroom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      classroomLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'classroom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      classroomBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'classroom',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      classroomStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'classroom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      classroomEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'classroom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      classroomContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'classroom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      classroomMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'classroom',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      classroomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'classroom',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      classroomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'classroom',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      createdByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdBy',
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      createdByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdBy',
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      createdByEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      createdByGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      createdByLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      createdByBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      createdByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      createdByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      createdByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      createdByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      createdByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdBy',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      createdByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdBy',
        value: '',
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
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
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

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
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

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
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
}

extension StorageTeacherQueryObject
    on QueryBuilder<StorageTeacher, StorageTeacher, QFilterCondition> {}

extension StorageTeacherQueryLinks
    on QueryBuilder<StorageTeacher, StorageTeacher, QFilterCondition> {
  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition> title(
      FilterQuery<StorageTitle> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'title');
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'title', 0, true, 0, true);
    });
  }
}

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

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy> sortByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy>
      sortByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
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

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy> thenByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy>
      thenByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
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

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }
}

extension StorageTeacherQueryWhereDistinct
    on QueryBuilder<StorageTeacher, StorageTeacher, QDistinct> {
  QueryBuilder<StorageTeacher, StorageTeacher, QDistinct> distinctByClassroom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classroom', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StorageTeacher, StorageTeacher, QDistinct> distinctByCreatedBy(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdBy', caseSensitive: caseSensitive);
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
}

extension StorageTeacherQueryProperty
    on QueryBuilder<StorageTeacher, StorageTeacher, QQueryProperty> {
  QueryBuilder<StorageTeacher, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<StorageTeacher, String, QQueryOperations> classroomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classroom');
    });
  }

  QueryBuilder<StorageTeacher, String?, QQueryOperations> createdByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdBy');
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
}
