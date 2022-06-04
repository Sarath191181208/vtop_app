import 'dart:collection';

class AcademicCalender {
  List<String> imgList;
  AcademicCalender(this.imgList);
  factory AcademicCalender.fromJson(data) {
    List<String> _imgList = [];
    for (var img in data) {
      _imgList.add(img);
    }
    return AcademicCalender(_imgList);
  }

  List<String> getAcademicCalender() => imgList;
}
