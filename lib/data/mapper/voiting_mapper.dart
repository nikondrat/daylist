import 'package:daylist/data/api/model/api_voiting.dart';
import 'package:daylist/data/mapper/classroom_mapper.dart';
import 'package:daylist/data/mapper/replacement_mapper.dart';
import 'package:daylist/data/mapper/subject_mapper.dart';
import 'package:daylist/data/mapper/teacher_mapper.dart';
import 'package:daylist/data/mapper/time_mapper.dart';
import 'package:daylist/data/mapper/title_mapper.dart';
import 'package:daylist/domain/model/voiting.dart';

class VoitingMapper {
  static Voiting fromApi(ApiVoiting voiting) {
    return Voiting(
        id: voiting.id,
        type: VoitingType.values.firstWhere((e) => e.name == voiting.type),
        pros: voiting.pros,
        cons: voiting.cons,
        time: voiting.time != null ? TimeMapper.fromApi(voiting.time!) : null,
        title:
            voiting.title != null ? TitleMapper.fromApi(voiting.title!) : null,
        teacher: voiting.teacher != null
            ? TeacherMapper.fromApi(voiting.teacher!)
            : null,
        subject: voiting.subject != null
            ? SubjectMapper.fromApi(voiting.subject!)
            : null,
        classroom: voiting.classroom != null
            ? ClassroomMapper.fromApi(voiting.classroom!)
            : null,
        replacement: voiting.replacement != null
            ? ReplacementMapper.fromApi(voiting.replacement!)
            : null);
  }

  // static City fromStorage(StorageCity city) {
  //   return City(id: city.id, title: city.title);
  // }
}
