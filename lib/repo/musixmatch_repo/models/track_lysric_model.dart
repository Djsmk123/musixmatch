class TrackLyriscModel {
  int lyricsId;
  int explicit;
  String lyricsBody;
  String scriptTrackingUrl;
  String pixelTrackingUrl;
  String lyricsCopyright;
  String updatedTime;

  TrackLyriscModel({
    required this.lyricsId,
    required this.explicit,
    required this.lyricsBody,
    required this.scriptTrackingUrl,
    required this.pixelTrackingUrl,
    required this.lyricsCopyright,
    required this.updatedTime,
  });

  // Factory constructor to parse the JSON data and create an instance of TrackModel.
  factory TrackLyriscModel.fromJson(Map<String, dynamic> json) {
    return TrackLyriscModel(
      lyricsId: json['lyrics_id'] as int,
      explicit: json['explicit'] as int,
      lyricsBody: json['lyrics_body'] as String,
      scriptTrackingUrl: json['script_tracking_url'] as String,
      pixelTrackingUrl: json['pixel_tracking_url'] as String,
      lyricsCopyright: json['lyrics_copyright'] as String,
      updatedTime: json['updated_time'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'lyrics_id': lyricsId,
      'explicit': explicit,
      'lyrics_body': lyricsBody,
      'script_tracking_url': scriptTrackingUrl,
      'pixel_tracking_url': pixelTrackingUrl,
      'lyrics_copyright': lyricsCopyright,
      'updated_time': updatedTime,
    };
  }
}
