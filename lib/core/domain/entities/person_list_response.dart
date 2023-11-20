import 'package:flutter_exam/core/domain/entities/person.dart';

class PersonListResponse {
  final String? status;
  final int? code;
  final int? total;
  final List<Person>? data;

  PersonListResponse(this.status, this.code, this.total, this.data);
}
