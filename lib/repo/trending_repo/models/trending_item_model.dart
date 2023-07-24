class TrackModel {
  int trackId;
  String trackName;
  List<TrackNameTranslation>? trackNameTranslationList;
  int trackRating;
  int commontrackId;
  int instrumental;
  int explicit;
  int hasLyrics;
  int hasSubtitles;
  int hasRichsync;
  int numFavourite;
  int albumId;
  String albumName;
  int artistId;
  String artistName;
  String trackShareUrl;
  String trackEditUrl;
  int restricted;
  String updatedTime;
  PrimaryGenres? primaryGenres;

  TrackModel(
      {required this.trackId,
      required this.trackName,
      this.trackNameTranslationList,
      required this.trackRating,
      required this.commontrackId,
      required this.instrumental,
      required this.explicit,
      required this.hasLyrics,
      required this.hasSubtitles,
      required this.hasRichsync,
      required this.numFavourite,
      required this.albumId,
      required this.albumName,
      required this.artistId,
      required this.artistName,
      required this.trackShareUrl,
      required this.trackEditUrl,
      required this.restricted,
      required this.updatedTime,
      this.primaryGenres});

  factory TrackModel.fromJson(Map<String, dynamic> json) {
    return TrackModel(
      trackId: json['track_id'],
      trackName: json['track_name'],
      trackNameTranslationList: List<TrackNameTranslation>.from(
          json['track_name_translation_list'].map((track) =>
              TrackNameTranslation.fromJson(track['track_name_translation']))),
      trackRating: json['track_rating'],
      commontrackId: json['commontrack_id'],
      instrumental: json['instrumental'],
      explicit: json['explicit'],
      hasLyrics: json['has_lyrics'],
      hasSubtitles: json['has_subtitles'],
      hasRichsync: json['has_richsync'],
      numFavourite: json['num_favourite'],
      albumId: json['album_id'],
      albumName: json['album_name'],
      artistId: json['artist_id'],
      artistName: json['artist_name'],
      trackShareUrl: json['track_share_url'],
      trackEditUrl: json['track_edit_url'],
      restricted: json['restricted'],
      updatedTime: json['updated_time'],
      primaryGenres: PrimaryGenres.fromJson(json['primary_genres']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['track_id'] = trackId;
    data['track_name'] = trackName;
    data['track_name_translation_list'] =
        trackNameTranslationList?.map((v) => v.toJson()).toList();
    data['track_rating'] = trackRating;
    data['commontrack_id'] = commontrackId;
    data['instrumental'] = instrumental;
    data['explicit'] = explicit;
    data['has_lyrics'] = hasLyrics;
    data['has_subtitles'] = hasSubtitles;
    data['has_richsync'] = hasRichsync;
    data['num_favourite'] = numFavourite;
    data['album_id'] = albumId;
    data['album_name'] = albumName;
    data['artist_id'] = artistId;
    data['artist_name'] = artistName;
    data['track_share_url'] = trackShareUrl;
    data['track_edit_url'] = trackEditUrl;
    data['restricted'] = restricted;
    data['updated_time'] = updatedTime;
    //data['primary_genres'] = primaryGenres.toJson();
    return data;
  }
}

class TrackNameTranslation {
  String language;
  String translation;

  TrackNameTranslation({required this.language, required this.translation});

  factory TrackNameTranslation.fromJson(Map<String, dynamic> json) {
    return TrackNameTranslation(
      language: json['language'],
      translation: json['translation'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['language'] = language;
    data['translation'] = translation;
    return data;
  }
}

class PrimaryGenres {
  List<MusicGenreList> musicGenreList;

  PrimaryGenres({required this.musicGenreList});

  factory PrimaryGenres.fromJson(Map<String, dynamic> json) {
    return PrimaryGenres(
      musicGenreList: List<MusicGenreList>.from(json['music_genre_list']
          .map((genreList) => MusicGenreList.fromJson(genreList))),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['music_genre_list'] = musicGenreList.map((v) => v.toJson()).toList();
    return data;
  }
}

class MusicGenreList {
  MusicGenre musicGenre;

  MusicGenreList({required this.musicGenre});

  factory MusicGenreList.fromJson(Map<String, dynamic> json) {
    return MusicGenreList(
      musicGenre: MusicGenre.fromJson(json['music_genre']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['music_genre'] = musicGenre.toJson();
    return data;
  }
}

class MusicGenre {
  int musicGenreId;
  int musicGenreParentId;
  String musicGenreName;
  String musicGenreNameExtended;
  String musicGenreVanity;

  MusicGenre(
      {required this.musicGenreId,
      required this.musicGenreParentId,
      required this.musicGenreName,
      required this.musicGenreNameExtended,
      required this.musicGenreVanity});
  factory MusicGenre.fromJson(Map<String, dynamic> json) {
    return MusicGenre(
      musicGenreId: json['music_genre_id'],
      musicGenreParentId: json['music_genre_parent_id'],
      musicGenreName: json['music_genre_name'],
      musicGenreNameExtended: json['music_genre_name_extended'],
      musicGenreVanity: json['music_genre_vanity'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['music_genre_id'] = musicGenreId;
    data['music_genre_parent_id'] = musicGenreParentId;
    data['music_genre_name'] = musicGenreName;
    data['music_genre_name_extended'] = musicGenreNameExtended;
    data['music_genre_vanity'] = musicGenreVanity;
    return data;
  }
}
