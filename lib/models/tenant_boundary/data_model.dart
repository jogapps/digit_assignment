import 'package:dart_mappable/dart_mappable.dart';

part 'data_model.mapper.dart';

@MappableEnum()
enum ApiOperation { login, create, search, update, delete }

@MappableEnum()
enum DataModelType {
  user,
  address,
  individual,
  attendanceRegister,
  attendance,
  project,
  projectFacility,
  projectProductVariant,
  projectStaff,
  projectResource,
  projectType,
  facility,
  product,
  productVariant,
  stock,
  stockReconciliation,
}

// // @MappableClass()
class ActionPathModel {
  final DataModelType type;
  final String path;
  final ApiOperation operation;

  const ActionPathModel({
    required this.operation,
    required this.type,
    required this.path,
  });
}

@MappableClass()
class AuditDetails with AuditDetailsMappable {
  final String? createdBy;
  final String? lastModifiedBy;
  final int? createdTime;
  final int? lastModifiedTime;

  const AuditDetails({
    required this.createdBy,
    required this.createdTime,
    String? lastModifiedBy,
    int? lastModifiedTime,
  }) : lastModifiedBy = lastModifiedBy ?? createdBy,
       lastModifiedTime = lastModifiedTime ?? createdTime;
}

@MappableClass()
class ClientAuditDetails with ClientAuditDetailsMappable {
  final int? createdTime;
  final int? lastModifiedTime;
  final String? createdBy;
  final String? lastModifiedBy;

  ClientAuditDetails({
    required this.createdBy,
    required this.createdTime,
    String? lastModifiedBy,
    int? lastModifiedTime,
  }) : lastModifiedBy = lastModifiedBy ?? createdBy,
       lastModifiedTime = lastModifiedTime ?? createdTime;
}

@MappableClass()
abstract class AdditionalFields with AdditionalFieldsMappable {
  final String schema;
  final int version;
  final List<AdditionalField> fields;

  const AdditionalFields({
    required this.schema,
    required this.version,
    this.fields = const [],
  });
}

@MappableClass(includeSubClasses: [])
class AdditionalField with AdditionalFieldMappable {
  final String key;
  final dynamic value;

  const AdditionalField(this.key, this.value);
}
