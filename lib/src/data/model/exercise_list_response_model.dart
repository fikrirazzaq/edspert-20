class ExerciseListResponseModel {
  int? status;
  String? message;
  List<ExerciseDataModel>? data;

  ExerciseListResponseModel({this.status, this.message, this.data});

  ExerciseListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ExerciseDataModel>[];
      json['data'].forEach((v) {
        data!.add(ExerciseDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExerciseDataModel {
  String? exerciseId;
  String? exerciseTitle;
  String? accessType;
  String? icon;
  String? exerciseUserStatus;
  String? jumlahSoal;
  int? jumlahDone;

  ExerciseDataModel(
      {this.exerciseId,
      this.exerciseTitle,
      this.accessType,
      this.icon,
      this.exerciseUserStatus,
      this.jumlahSoal,
      this.jumlahDone});

  ExerciseDataModel.fromJson(Map<String, dynamic> json) {
    exerciseId = json['exercise_id'];
    exerciseTitle = json['exercise_title'];
    accessType = json['access_type'];
    icon = json['icon'];
    exerciseUserStatus = json['exercise_user_status'];
    jumlahSoal = json['jumlah_soal'];
    jumlahDone = json['jumlah_done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['exercise_id'] = exerciseId;
    data['exercise_title'] = exerciseTitle;
    data['access_type'] = accessType;
    data['icon'] = icon;
    data['exercise_user_status'] = exerciseUserStatus;
    data['jumlah_soal'] = jumlahSoal;
    data['jumlah_done'] = jumlahDone;
    return data;
  }
}
