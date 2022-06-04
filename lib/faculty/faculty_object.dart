import 'dart:collection';

class IndividualFaculty {
  String img;
  String name;
  String specializations;

  IndividualFaculty(this.img, this.name, this.specializations);

  @override
  String toString() {
    return 'IndividualFaculty{\n\t img: $img,\n\t name: $name, \n\t specializations: $specializations \n}';
  }
}

class Faculty {
  List<IndividualFaculty> facultyList;
  Faculty(this.facultyList);
  factory Faculty.fromJson(data) {
    List<IndividualFaculty> _facultyList = [];
    for (var faculty in data) {
      _facultyList.add(IndividualFaculty(
          faculty['img'], faculty['name'], faculty['specialization']));
    }
    return Faculty(_facultyList);
  }

  List<IndividualFaculty> getFaculty() => facultyList;
}
