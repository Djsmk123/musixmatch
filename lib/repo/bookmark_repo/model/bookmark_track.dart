import 'package:hive/hive.dart';
part 'bookmark_track.g.dart';
@HiveType(typeId: 0)
class Bookmark {
  @HiveField(0)
  int trackId;

  @HiveField(1)
  String trackName;

  Bookmark({required this.trackId, required this.trackName});
  factory Bookmark.fromJson(Map<String, dynamic> json) {
    return Bookmark(
      trackId: json['trackId'],
      trackName: json['trackName'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'trackId': trackId,
      'trackName': trackName,
    };
  }
}
