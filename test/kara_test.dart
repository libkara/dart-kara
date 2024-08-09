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
            'test/example.kara',
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
                KaraTime(
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
                KaraTime(
                  start: Duration(seconds: 12, milliseconds: 929),
                  end: Duration(seconds: 15, milliseconds: 765),
                  original: "날",
                  roman: "nal",
                ),
                KaraTime(
                  start: Duration(seconds: 12, milliseconds: 929),
                  end: Duration(seconds: 15, milliseconds: 765),
                  original: "끌",
                  roman: "kkeu",
                ),
                KaraTime(
                  start: Duration(seconds: 12, milliseconds: 929),
                  end: Duration(seconds: 15, milliseconds: 765),
                  original: "어",
                  roman: "oe",
                ),
                KaraTime(
                  start: Duration(seconds: 12, milliseconds: 929),
                  end: Duration(seconds: 15, milliseconds: 765),
                  original: "당",
                  roman: "dang",
                ),
                KaraTime(
                  start: Duration(seconds: 12, milliseconds: 929),
                  end: Duration(seconds: 15, milliseconds: 765),
                  original: "긴",
                  roman: "gin",
                ),
                KaraTime(
                  start: Duration(seconds: 12, milliseconds: 929),
                  end: Duration(seconds: 15, milliseconds: 765),
                  original: "감",
                  roman: "gam",
                ),
                KaraTime(
                  start: Duration(seconds: 12, milliseconds: 929),
                  end: Duration(seconds: 15, milliseconds: 765),
                  original: "정",
                  roman: "jeong",
                ),
                KaraTime(
                  start: Duration(seconds: 12, milliseconds: 929),
                  end: Duration(seconds: 15, milliseconds: 765),
                  original: "의",
                  roman: "ui",
                ),
                KaraTime(
                  start: Duration(seconds: 12, milliseconds: 929),
                  end: Duration(seconds: 15, milliseconds: 765),
                  original: "Blas",
                ),
                KaraTime(
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
                KaraTime(
                  start: Duration(seconds: 20, milliseconds: 976),
                  end: Duration(seconds: 25, milliseconds: 108),
                  original: "또",
                  roman: "tto",
                ),
                KaraTime(
                  start: Duration(seconds: 20, milliseconds: 976),
                  end: Duration(seconds: 25, milliseconds: 108),
                  original: "다",
                  roman: "da",
                ),
                KaraTime(
                  start: Duration(seconds: 20, milliseconds: 976),
                  end: Duration(seconds: 25, milliseconds: 108),
                  original: "른",
                  roman: "reun",
                ),
                KaraTime(
                  start: Duration(seconds: 20, milliseconds: 976),
                  end: Duration(seconds: 25, milliseconds: 108),
                  original: "시",
                  roman: "si",
                ),
                KaraTime(
                  start: Duration(seconds: 20, milliseconds: 976),
                  end: Duration(seconds: 25, milliseconds: 108),
                  original: "작",
                  roman: "jag",
                ),
                KaraTime(
                  start: Duration(seconds: 20, milliseconds: 976),
                  end: Duration(seconds: 25, milliseconds: 108),
                  original: "을",
                  roman: "uel",
                ),
                KaraTime(
                  start: Duration(seconds: 20, milliseconds: 976),
                  end: Duration(seconds: 25, milliseconds: 108),
                  original: "알",
                  roman: "all",
                ),
                KaraTime(
                  start: Duration(seconds: 20, milliseconds: 976),
                  end: Duration(seconds: 25, milliseconds: 108),
                  original: "려",
                  roman: "yeo",
                ),
                KaraTime(
                  start: Duration(seconds: 20, milliseconds: 976),
                  end: Duration(seconds: 25, milliseconds: 108),
                  original: "와",
                  roman: "wa",
                ),
                KaraTime(
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
