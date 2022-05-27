import 'dart:collection';

class AcademicHistory {
  HashMap<String, String>? subjects;
  HashMap<String, double?>? summary;
  AcademicHistory(this.subjects, this.summary);

  factory AcademicHistory.fromJson(dynamic data) {
    if (data == null) AcademicHistory(null, null);

    // converting subjects data from json to Hashmap
    HashMap<String, String>? subjects;
    if (data['subjects'] != null && data['subjects'].length > 0) {
      subjects = HashMap<String, String>();
      data["subjects"].forEach((key, value) {
        subjects![key] = value;
      });
    }

    // converting summary from json to Hashmap
    HashMap<String, double?>? summary;
    if (data['summary'] != null && data['summary'].length > 0) {
      summary = HashMap<String, double?>();
      data["summary"].forEach((key, value) {
        summary![key] = double.parse(value.toString());
      });
    }
    return AcademicHistory(subjects, summary);
  }
}

class AttendanceInfoSlot {
  int attended;
  int totalClasses;
  String code;
  String courseName;
  String faculty;
  double percentage;
  String typeOfClass;

  AttendanceInfoSlot(this.attended, this.code, this.courseName, this.faculty,
      this.percentage, this.totalClasses, this.typeOfClass);

  factory AttendanceInfoSlot.fromJson(dynamic data) {
    return AttendanceInfoSlot(
        int.parse(data["attended"]),
        data["code"],
        data["courseName"],
        data["faculty"],
        double.parse(data["percentage"]),
        int.parse(data["total"]),
        data["type"]);
  }

  @override
  String toString() {
    return "AttendanceInfoSlot{attended: $attended, code: $code, courseName: $courseName, faculty: $faculty, percentage: $percentage, totalClasses: $totalClasses, typeOfClass: $typeOfClass}";
  }
}

class Attendance {
  List<AttendanceInfoSlot>? attendance;
  Attendance(this.attendance);

  factory Attendance.fromJson(dynamic data) {
    if (data == null) Attendance(null);

    var attendance = <AttendanceInfoSlot>[];
    data.forEach((key, value) {
      attendance.add(AttendanceInfoSlot.fromJson(value));
    });
    return Attendance(attendance);
  }

  @override
  String toString() {
    return "Attendance{attendance object: $attendance}";
  }
}

class Profile {
  String name;
  String rollNumber;
  String branch;
  String proctorName;
  String proctorEmail;

  Profile(this.name, this.rollNumber, this.branch, this.proctorName,
      this.proctorEmail);
  factory Profile.fromJson(dynamic data) {
    return Profile(data["name"], data["appNo"], data["branch"],
        data["proctorName"], data["proctorEmail"]);
  }

  @override
  String toString() {
    return "Profile{name: $name, rollNumber: $rollNumber, branch: $branch, proctorName: $proctorName, proctorEmail: $proctorEmail}";
  }
}

class TimeSlot {
  String slot;
  String startTime;
  String endTime;
  String classRoom;
  String courseName;
  TimeSlot(
      this.slot, this.startTime, this.endTime, this.classRoom, this.courseName);
  factory TimeSlot.fromJson(dynamic data) {
    return TimeSlot(data["slot"], data["startTime"], data["endTime"],
        data["class"], data["courseName"]);
  }
  @override
  String toString() {
    return "TimeSlot{slot: $slot, startTime: $startTime, endTime: $endTime, classRoom: $classRoom, courseName: $courseName}";
  }
}

class TimeTable {
  HashMap<String, List<TimeSlot>>? timeTable;
  TimeTable(this.timeTable);
  factory TimeTable.fromJson(dynamic data) {
    if (data == null || data.length < 0) TimeTable(null);

    HashMap<String, List<TimeSlot>>? timeTable =
        HashMap<String, List<TimeSlot>>();
    // converting timetable data from json to Hashmap
    // iterating throught each day
    data.forEach((day, classes) {
      // if only there's data in that day
      if (classes.length > 0) {
        List<TimeSlot> timeSlots = <TimeSlot>[];
        // for every slot in a day
        classes.forEach((val) {
          timeSlots.add(TimeSlot.fromJson(val));
        });
        timeTable[day] = timeSlots;
      }
    });
    return TimeTable(timeTable);
  }

  @override
  String toString() {
    return "TimeTable{timeTable: $timeTable}";
  }
}

class Student {
  AcademicHistory academicHistory;
  Attendance attendance;
  Profile profile;
  TimeTable timeTable;
  Student(this.academicHistory, this.attendance, this.profile, this.timeTable);
  factory Student.fromJson(dynamic data) {
    return Student(
        AcademicHistory.fromJson(data["academic_history"]),
        Attendance.fromJson(data["attendance"]),
        Profile.fromJson(data["profile"]),
        TimeTable.fromJson(data["timetable"]));
  }

  HashMap<String, List<TimeSlot>>? getTimeTable() {
    return timeTable.timeTable;
  }

  Profile getProfile() {
    return profile;
  }

  AcademicHistory getAcacemicHistory() {
    return academicHistory;
  }

  List<AttendanceInfoSlot>? getAttendace() {
    return attendance.attendance;
  }
}
