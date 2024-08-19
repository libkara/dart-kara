// Copyright 2024 Brian Wo. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in LICENSE or at https://opensource.org/license/BSD-3-clause.

import 'dart:io';

import 'package:kara/kara.dart';
import 'package:test/test.dart';

void main() {
  test('test', () {
    expect(
      parse(
        File.fromUri(
          Uri.file(
            'test/test_file/example.kara',
          ),
        ).readAsStringSync(),
      ).toString(),
      Kara(
          title: "Shooting Star",
          artist: "Kep1er",
          year: 2024,
          album: "Kep1going On",
          languages: [
            "kor"
          ],
          singers: [
            "Xiaoting",
            "Chaehyun",
            "Yujin",
            "Huening Bahiyyih",
            "Mashiro",
            "Yeseo",
            "Yeongeun",
            "Dayeon",
            "Hikaru",
          ],
          lines: [
            KaraLine(
              section: KaraSection.intro,
              singers: [
                true, // Xiaoting
                false, // Chaehyun
                false, // Yujin
                false, // Huening Bahiyyih
                false, // Mashiro
                false, // Yeseo
                false, // Yeongeun
                false, // Dayeon
                false, // Hikaru
              ],
              lyric: "Da ra da da da da ooh",
              start: Duration(seconds: 3, milliseconds: 503),
              end: Duration(seconds: 11, milliseconds: 117),
              time: [
                KaraChunk(
                  start: Duration(seconds: 3, milliseconds: 503),
                  end: Duration(seconds: 11, milliseconds: 117),
                  original: 'Da ra da da da da ooh',
                ),
              ],
            ),
            KaraLine(
              section: KaraSection.verse,
              singers: [
                false, // Xiaoting
                true, // Chaehyun
                true, // Yujin
                true, // Huening Bahiyyih
                true, // Mashiro
                false, // Yeseo
                false, // Yeongeun
                false, // Dayeon
                false, // Hikaru
              ],
              lyric: "날 끌어당긴 감정의 Blasting",
              translations: {
                "eng": "Blasting of the emotion that draws me in",
                "jpn": "私を引き寄せた感情の Blasting",
                "zho": "吸引我的情感 Blasting"
              },
              start: Duration(seconds: 12, milliseconds: 929),
              end: Duration(seconds: 15, milliseconds: 765),
              time: [
                KaraChunk(
                  start: Duration(seconds: 12, milliseconds: 929),
                  end: Duration(seconds: 15, milliseconds: 765),
                  original: "날",
                  roman: "nal",
                ),
                KaraChunk(
                  start: Duration(seconds: 12, milliseconds: 929),
                  end: Duration(seconds: 15, milliseconds: 765),
                  original: "끌",
                  roman: "kkeu",
                ),
                KaraChunk(
                  start: Duration(seconds: 12, milliseconds: 929),
                  end: Duration(seconds: 15, milliseconds: 765),
                  original: "어",
                  roman: "oe",
                ),
                KaraChunk(
                  start: Duration(seconds: 12, milliseconds: 929),
                  end: Duration(seconds: 15, milliseconds: 765),
                  original: "당",
                  roman: "dang",
                ),
                KaraChunk(
                  start: Duration(seconds: 12, milliseconds: 929),
                  end: Duration(seconds: 15, milliseconds: 765),
                  original: "긴",
                  roman: "gin",
                ),
                KaraChunk(
                  start: Duration(seconds: 12, milliseconds: 929),
                  end: Duration(seconds: 15, milliseconds: 765),
                  original: "감",
                  roman: "gam",
                ),
                KaraChunk(
                  start: Duration(seconds: 12, milliseconds: 929),
                  end: Duration(seconds: 15, milliseconds: 765),
                  original: "정",
                  roman: "jeong",
                ),
                KaraChunk(
                  start: Duration(seconds: 12, milliseconds: 929),
                  end: Duration(seconds: 15, milliseconds: 765),
                  original: "의",
                  roman: "ui",
                ),
                KaraChunk(
                  start: Duration(seconds: 12, milliseconds: 929),
                  end: Duration(seconds: 15, milliseconds: 765),
                  original: "Blas",
                ),
                KaraChunk(
                  start: Duration(seconds: 12, milliseconds: 929),
                  end: Duration(seconds: 15, milliseconds: 765),
                  original: "ting",
                ),
              ],
            ),
            KaraLine(
              section: KaraSection.preChorus,
              singers: [
                true, // Xiaoting
                true, // Chaehyun
                false, // Yujin
                false, // Huening Bahiyyih
                false, // Mashiro
                false, // Yeseo
                false, // Yeongeun
                false, // Dayeon
                false, // Hikaru
              ],
              lyric: "또 다른 시작을 알려와 (Let's start)",
              start: Duration(seconds: 20, milliseconds: 976),
              end: Duration(seconds: 25, milliseconds: 108),
              time: [
                KaraChunk(
                  start: Duration(seconds: 20, milliseconds: 976),
                  end: Duration(seconds: 25, milliseconds: 108),
                  original: "또",
                  roman: "tto",
                ),
                KaraChunk(
                  start: Duration(seconds: 20, milliseconds: 976),
                  end: Duration(seconds: 25, milliseconds: 108),
                  original: "다",
                  roman: "da",
                ),
                KaraChunk(
                  start: Duration(seconds: 20, milliseconds: 976),
                  end: Duration(seconds: 25, milliseconds: 108),
                  original: "른",
                  roman: "reun",
                ),
                KaraChunk(
                  start: Duration(seconds: 20, milliseconds: 976),
                  end: Duration(seconds: 25, milliseconds: 108),
                  original: "시",
                  roman: "si",
                ),
                KaraChunk(
                  start: Duration(seconds: 20, milliseconds: 976),
                  end: Duration(seconds: 25, milliseconds: 108),
                  original: "작",
                  roman: "jag",
                ),
                KaraChunk(
                  start: Duration(seconds: 20, milliseconds: 976),
                  end: Duration(seconds: 25, milliseconds: 108),
                  original: "을",
                  roman: "uel",
                ),
                KaraChunk(
                  start: Duration(seconds: 20, milliseconds: 976),
                  end: Duration(seconds: 25, milliseconds: 108),
                  original: "알",
                  roman: "all",
                ),
                KaraChunk(
                  start: Duration(seconds: 20, milliseconds: 976),
                  end: Duration(seconds: 25, milliseconds: 108),
                  original: "려",
                  roman: "yeo",
                ),
                KaraChunk(
                  start: Duration(seconds: 20, milliseconds: 976),
                  end: Duration(seconds: 25, milliseconds: 108),
                  original: "와",
                  roman: "wa",
                ),
                KaraChunk(
                  start: Duration(seconds: 20, milliseconds: 976),
                  end: Duration(seconds: 25, milliseconds: 108),
                  original: "(Let's start)",
                  roman: "(Let's start)",
                )
              ],
            ),
          ]).toString(),
    );
  });
}
