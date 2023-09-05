// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_time.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStorageTimeCollection on Isar {
  IsarCollection<StorageTime> get storageTimes => this.collection();
}

const StorageTimeSchema = CollectionSchema(
  name: r'StorageTime',
  id: -8413710719197785782,
  properties: {
    r'createdBy': PropertySchema(
      id: 0,
      name: r'createdBy',
      type: IsarType.string,
    ),
    r'end': PropertySchema(
      id: 1,
      name: r'end',
      type: IsarType.string,
    ),
    r'number': PropertySchema(
      id: 2,
      name: r'number',
      type: IsarType.long,
    ),
    r'start': PropertySchema(
      id: 3,
      name: r'start',
      type: IsarType.string,
    )
  },
  estimateSize: _storageTimeEstimateSize,
  serialize: _storageTimeSerialize,
  deserialize: _storageTimeDeserialize,
  deserializeProp: _storageTimeDeserializeProp,
  idName: r'localId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _storageTimeGetId,
  getLinks: _storageTimeGetLinks,
  attach: _storageTimeAttach,
  version: '3.1.0+1',
);

int _storageTimeEstimateSize(
  StorageTime object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.createdBy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.end.length * 3;
  bytesCount += 3 + object.start.length * 3;
  return bytesCount;
}

void _storageTimeSerialize(
  StorageTime object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.createdBy);
  writer.writeString(offsets[1], object.end);
  writer.writeLong(offsets[2], object.number);
  writer.writeString(offsets[3], object.start);
}

StorageTime _storageTimeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StorageTime(
    createdBy: reader.readStringOrNull(offsets[0]),
    end: reader.readString(offsets[1]),
    number: reader.readLong(offsets[2]),
    start: reader.readString(offsets[3]),
  );
  return object;
}

P _storageTimeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _storageTimeGetId(StorageTime object) {
  return object.localId;
}

List<IsarLinkBase<dynamic>> _storageTimeGetLinks(StorageTime object) {
  return [];
}

void _storageTimeAttach(
    IsarCollection<dynamic> col, Id id, StorageTime object) {}

extension StorageTimeQueryWhereSort
    on QueryBuilder<StorageTime, StorageTime, QWhere> {
  QueryBuilder<StorageTime, StorageTime, QAfterWhere> anyLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StorageTimeQueryWhere
    on QueryBuilder<StorageTime, StorageTime, QWhereClause> {
  QueryBuilder<StorageTime, StorageTime, QAfterWhereClause> localIdEqualTo(
      Id localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: localId,
        upper: localId,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterWhereClause> localIdNotEqualTo(
      Id localId) {
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

  QueryBuilder<StorageTime, StorageTime, QAfterWhereClause> localIdGreaterThan(
      Id localId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: localId, includeLower: include),
      );
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterWhereClause> localIdLessThan(
      Id localId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: localId, includeUpper: include),
      );
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterWhereClause> localIdBetween(
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

extension StorageTimeQueryFilter
    on QueryBuilder<StorageTime, StorageTime, QFilterCondition> {
  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition>
      createdByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdBy',
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition>
      createdByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdBy',
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition>
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

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition>
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

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition>
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

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition>
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

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition>
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

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition>
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

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition>
      createdByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition>
      createdByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition>
      createdByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdBy',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition>
      createdByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdBy',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> endEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'end',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> endGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'end',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> endLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'end',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> endBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'end',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> endStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'end',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> endEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'end',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> endContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'end',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> endMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'end',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> endIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'end',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition>
      endIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'end',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> localIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition>
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

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> localIdLessThan(
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

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> localIdBetween(
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

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> numberEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition>
      numberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> numberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> numberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'number',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> startEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition>
      startGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> startLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> startBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'start',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> startStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> startEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> startContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> startMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'start',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition> startIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'start',
        value: '',
      ));
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterFilterCondition>
      startIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'start',
        value: '',
      ));
    });
  }
}

extension StorageTimeQueryObject
    on QueryBuilder<StorageTime, StorageTime, QFilterCondition> {}

extension StorageTimeQueryLinks
    on QueryBuilder<StorageTime, StorageTime, QFilterCondition> {}

extension StorageTimeQuerySortBy
    on QueryBuilder<StorageTime, StorageTime, QSortBy> {
  QueryBuilder<StorageTime, StorageTime, QAfterSortBy> sortByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterSortBy> sortByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterSortBy> sortByEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end', Sort.asc);
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterSortBy> sortByEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end', Sort.desc);
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterSortBy> sortByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.asc);
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterSortBy> sortByNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.desc);
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterSortBy> sortByStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.asc);
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterSortBy> sortByStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.desc);
    });
  }
}

extension StorageTimeQuerySortThenBy
    on QueryBuilder<StorageTime, StorageTime, QSortThenBy> {
  QueryBuilder<StorageTime, StorageTime, QAfterSortBy> thenByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterSortBy> thenByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterSortBy> thenByEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end', Sort.asc);
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterSortBy> thenByEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end', Sort.desc);
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterSortBy> thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterSortBy> thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterSortBy> thenByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.asc);
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterSortBy> thenByNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.desc);
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterSortBy> thenByStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.asc);
    });
  }

  QueryBuilder<StorageTime, StorageTime, QAfterSortBy> thenByStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.desc);
    });
  }
}

extension StorageTimeQueryWhereDistinct
    on QueryBuilder<StorageTime, StorageTime, QDistinct> {
  QueryBuilder<StorageTime, StorageTime, QDistinct> distinctByCreatedBy(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StorageTime, StorageTime, QDistinct> distinctByEnd(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'end', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StorageTime, StorageTime, QDistinct> distinctByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'number');
    });
  }

  QueryBuilder<StorageTime, StorageTime, QDistinct> distinctByStart(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'start', caseSensitive: caseSensitive);
    });
  }
}

extension StorageTimeQueryProperty
    on QueryBuilder<StorageTime, StorageTime, QQueryProperty> {
  QueryBuilder<StorageTime, int, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<StorageTime, String?, QQueryOperations> createdByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdBy');
    });
  }

  QueryBuilder<StorageTime, String, QQueryOperations> endProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'end');
    });
  }

  QueryBuilder<StorageTime, int, QQueryOperations> numberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'number');
    });
  }

  QueryBuilder<StorageTime, String, QQueryOperations> startProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'start');
    });
  }
}
