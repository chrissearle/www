---
title: Splitting MKV files on chapter marks
date: 2011-10-02 17:49:10 +0200
tags: mkv, mkvtoolsnix, mkvmerge, mkvinfo, matroska
---

I had the need to split some mkv (matroska video) files on chapter marks.

I'd normally use handbrake for this - split and encode. But I didn't really want to reencode each time.

Downloaded mkvtoolsnix (machomebrew: brew install mkvtoolsnix).

Most tutorials concentrate on mkvmerge gui which I didn't have - just the command line

So - an example:

    $ mkvinfo testfile.mkv  | grep ChapterTimeStart
        |   + ChapterTimeStart: 00:00:00.000000000
        |   + ChapterTimeStart: 00:08:45.000000000
        |   + ChapterTimeStart: 00:14:47.856000000
        |   + ChapterTimeStart: 00:19:03.576000000
        |   + ChapterTimeStart: 00:27:23.656000000
        |   + ChapterTimeStart: 00:36:08.496000000
        |   + ChapterTimeStart: 00:41:30.776000000
        |   + ChapterTimeStart: 00:45:42.896000000
        |   + ChapterTimeStart: 00:51:40.256000000
        |   + ChapterTimeStart: 01:03:57.336000000
        |   + ChapterTimeStart: 01:16:19.296000000
        |   + ChapterTimeStart: 01:26:53.456000000

Let's say we want to split off the first chapter:

    $ mkvmerge -o output.mkv --split "timecodes:00:08:45.00" testfile.mkv

timecodes has hh:mm:ss.ss (hours, mins, secs in decimal) as format and can take comma sep list for splitting at several points.

Bingo - chapter split matroska video still in matroska with all video and subtitles intact and no reencoding.