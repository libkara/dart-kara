// Copyright 2024 Brian Wo. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in LICENSE or at https://opensource.org/license/BSD-3-clause.

library kara;

import 'package:kara/src/exception.dart';

import 'src/line.dart';
import 'src/section.dart';

export 'src/line.dart';
export 'src/section.dart';

({String key, String value})? _parseKeyValue(String line) {
  final split = line.split(":");

  if (split.length != 2) {
    return null;
  }
  // if (split.length != 2) {
  // throw "Invalid key value pair";
  // }

  return (key: split.first.trim(), value: split.last.trim());
}

Duration? _parseDuration(String duration) {
  final split = duration.split(":");

  if (split.length == 3) {
    final hours = int.tryParse(split.first);
    final minutes = int.tryParse(split[1]);

    final secondsMiliseconds = split.last.split('.');
    if (secondsMiliseconds.length != 2) return null;
    final seconds = int.tryParse(secondsMiliseconds.first);
    final milliseconds = int.tryParse(secondsMiliseconds.last);

    if (hours == null ||
        minutes == null ||
        seconds == null ||
        milliseconds == null) return null;

    return Duration(
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      milliseconds: milliseconds,
    );
  } else if (split.length == 2) {
    final minutes = int.tryParse(split.first);

    final secondsMiliseconds = split.last.split('.');
    if (secondsMiliseconds.length != 2) return null;
    final seconds = int.tryParse(secondsMiliseconds.first);
    final miliseconds = int.tryParse(secondsMiliseconds.last);

    if (minutes == null || seconds == null || miliseconds == null) return null;

    return Duration(
      minutes: minutes,
      seconds: seconds,
      milliseconds: miliseconds,
    );
  } else {
    return null;
  }
}

KaraTime? _parseTimestamp(String line) {
  final split = line.split("-->");

  if (split.length != 2) return null;

  late final Duration start;
  if (_parseDuration(split.first) case Duration parsedDuration) {
    start = parsedDuration;
  } else {
    return null;
  }

  final lyricSplit = split.last.trim().split(" ");

  late final Duration end;
  if (_parseDuration(lyricSplit.first) case Duration parsedDuration) {
    end = parsedDuration;
  } else {
    return null;
  }

  String original = lyricSplit.elementAt(1);
  String? roman = lyricSplit.elementAtOrNull(2);
  String? furigana = lyricSplit.elementAtOrNull(3);

  return KaraTime(
    start: start,
    end: end,
    original: original,
    roman: roman,
    furigana: furigana,
  );
}

Kara? parse(String raw) {
  if (!raw.startsWith("KARA")) {
    throw NotKaraException;
  }

  late String title;
  late String artist;
  late int year;
  late String album;
  late List<String> languages;
  Map<int, String> singers = {};

  KaraSection currentSection = KaraSection.header;
  List<bool>? currentSingers;
  String? currentLyric;
  Duration? currentStart;
  Duration? currentEnd;

  List<KaraLine> lines = [];
  List<KaraTime> time = [];

  for (final line in raw.split('\n').skip(1)) {
    if (line.startsWith("#") || line.isEmpty) continue;

    // Section
    // e.g `[Singers]`, `[Intro]`, `[Chorus]`
    if (line.startsWith("[")) {
      final sectionName = line.substring(1, line.length - 1);

      currentSection = switch (sectionName) {
        "Singers" => KaraSection.singers,
        "Intro" => KaraSection.intro,
        "Verse" => KaraSection.verse,
        "Pre-Chorus" => KaraSection.preChorus,
        "Chorus" => KaraSection.chorus,
        "Post-Chorus" => KaraSection.postChorus,
        "Bridge" => KaraSection.bridge,
        "Post-Bridge" => KaraSection.postBridge,
        _ => KaraSection.header,
      };
      continue;
      if (currentSection.isSongStructure && time.isNotEmpty) {}
    }

    if (currentSection == KaraSection.header) {
      final parsed = _parseKeyValue(line);
      if (parsed == null) {
        continue;
      }

      final (:key, :value) = parsed;
      switch (key) {
        case "Title":
          title = value;
        case "Artist":
          artist = value;
        case "Year":
          year = int.tryParse(value) ?? 0;
        case "Album":
          album = value;
        case "Languages":
          languages = value.split(",").map((e) => e.trim()).toList();
      }
    }

    if (currentSection == KaraSection.singers) {
      final parsed = _parseKeyValue(line);
      if (parsed == null) {
        continue;
      }

      final (:key, :value) = parsed;
      singers.update(
        int.tryParse(key) ?? 0,
        (_) => value,
        ifAbsent: () => value,
      );
    }

    if (currentSection.isSongStructure) {
      if (_parseTimestamp(line) case KaraTime parsedTimestamp) {
        if (currentStart == null ||
            currentEnd == null ||
            parsedTimestamp.start < currentStart) {
          currentStart = parsedTimestamp.start;
          currentEnd = parsedTimestamp.end;
        }

        if (parsedTimestamp.end > currentEnd) {
          currentEnd = parsedTimestamp.end;
        }

        time.add(parsedTimestamp);
        continue;
      }

      if (time.isNotEmpty) {
        if (currentLyric == null ||
            currentStart == null ||
            currentEnd == null) {
          continue;
        }
        lines.add(KaraLine(
          section: currentSection,
          singers: currentSingers,
          lyric: currentLyric,
          start: currentStart,
          end: currentEnd,
          time: time,
        ));
        currentLyric = null;
        currentStart = null;
        currentEnd = null;
        time = [];
      }

      final parsed = _parseKeyValue(line);
      if (parsed != null) {
        currentSingers =
            parsed.value.split(",").map((e) => int.tryParse(e.trim())).fold(
                List<bool>.generate(
                  singers.length,
                  (index) => false,
                  growable: false,
                ), (singers, parsedSingerIndex) {
          if (parsedSingerIndex == null) {
            return singers;
          }
          singers?[parsedSingerIndex] = true;
          return singers;
        });
      }
      if (currentLyric != null) {
        // TODO: translations
        continue;
      }
      currentLyric = line;
    }
  }

  return Kara(
    title: title,
    artist: artist,
    year: year,
    album: album,
    languages: languages,
    singers: singers.values.toList(), // FIXME: doesn't allow reordering
    lines: lines,
  );
}

/// **KARA** implementation in Dart.
class Kara {
  const Kara({
    required this.title,
    required this.artist,
    required this.year,
    required this.album,
    required this.languages,
    required this.singers,
    required this.lines,
  });

  /// Title of a song.
  ///
  /// E.g: `Shooting Star`.
  final String title;

  /// Artist name used for display.
  ///
  /// E.g: `Kep1er`.
  ///
  /// For listing each individual singers name, use [singers].
  final String artist;

  /// Year of album release.
  ///
  /// E.g: `2024`.
  final int year;

  /// Album name of the song.
  ///
  /// Recommended to use the name of the album where the song first (if the
  /// artist release the song in multiple)
  ///
  /// E.g: `Kep1going On`.
  final String album;

  /// TODO: document
  final List<String> languages;

  /// List of singers who sing the song.
  /// TODO: document
  final List<String> singers;

  /// TODO: document
  final List<KaraLine> lines;

  @override
  String toString() {
    return """KARA
Title: $title
Artist: $artist
Year: $year
Album: $album
Languages: $languages
Singers: $singers
Lines: $lines""";
  }
}
