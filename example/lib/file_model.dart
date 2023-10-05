class FileModel {
  List<String> files;
  String folder;

  FileModel({required this.files, required this.folder});

  factory FileModel.fromJson(Map<String, dynamic> json) =>
      FileModel(files: json['files'].cast<String>(), folder: json['folderName']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['files'] = files;
    data['folderName'] = folder;
    return data;
  }
}
