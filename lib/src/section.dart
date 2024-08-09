// Copyright 2024 Brian Wo. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in LICENSE or at https://opensource.org/license/BSD-3-clause.

/// Mark a section of Kara file
enum KaraSection {
  /// Contains metadata of the song.
  header,

  /// Contains singer names.
  singers,

  /// Also known as Introduction.
  /// https://en.wikipedia.org/wiki/Introduction_(music)
  ///
  /// Use to distinguish song sections.
  ///
  /// Also check [verse], [preChorus], [chorus], [postChorus], [bridge], and
  /// [postBridge].
  intro,

  /// Use to distinguish song sections.
  ///
  /// Also check [intro], [preChorus], [chorus], [postChorus], [bridge], and
  /// [postBridge].
  verse,

  /// Use to distinguish song sections.
  ///
  /// Also check [intro], [verse], [chorus], [postChorus], [bridge], and
  /// [postBridge].
  preChorus,

  /// Use to distinguish song sections.
  ///
  /// Also check [intro], [verse], [preChorus], [postChorus], [bridge], and
  /// [postBridge].
  chorus,

  /// Use to distinguish song sections.
  ///
  /// Also check [intro], [verse], [preChorus], [chorus], [bridge], and
  /// [postBridge].
  postChorus,

  /// Use to distinguish song sections.
  ///
  /// Also check [intro], [verse], [preChorus], [chorus], [posChrous], and
  /// [postBridge].
  bridge,

  /// Use to distinguish song sections.
  ///
  /// Also check [intro], [verse], [preChorus], [chorus], [posChrous], and
  /// [bridge].
  postBridge;

  /// Section of a song structure.
  ///
  /// More informations: https://en.wikipedia.org/wiki/Song_structure
  bool get isSongStructure => switch (this) {
        KaraSection.intro ||
        KaraSection.verse ||
        KaraSection.preChorus ||
        KaraSection.chorus ||
        KaraSection.postChorus ||
        KaraSection.bridge ||
        KaraSection.postBridge =>
          true,
        _ => false,
      };
}
