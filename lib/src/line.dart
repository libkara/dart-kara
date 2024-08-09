// Copyright 2024 Brian Wo. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in LICENSE or at https://opensource.org/license/BSD-3-clause.

import 'section.dart';

typedef KaraTranslation = Map<String, String>;

///
///
class KaraLine {
  const KaraLine({
    required this.section,
    required this.singers,
    required this.lyric,
    required this.start,
    required this.end,
    this.translations,
    required this.time,
  });

  final KaraSection section;
  final List<bool> singers;
  final String lyric;
  final KaraTranslation? translations;
  final Duration start;
  final Duration end;
  final List<KaraTime> time;
}

class KaraTime {
  const KaraTime({
    required this.start,
    required this.end,
    required this.original,
    this.roman,
    this.furigana,
  });

  final Duration start;
  final Duration end;
  final String original;
  final String? roman;
  final String? furigana;
}
