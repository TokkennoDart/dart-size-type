// Copyright (c) 2017, Minerhub. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library size_type;

import 'dart:math';
import 'package:meta/meta.dart';

class Size implements Comparable<Size> {
  final int Bytes;

  @literal
  const Size([this.Bytes = 0]);

  Size.define(
      {int bytes = 0,
      double kilobytes = 0.0,
      double megabytes = 0.0,
      double gigabytes = 0.0,
      double terabytes = 0.0,
      double petabytes = 0.0,
      double exabytes = 0.0,
      double zettabytes = 0.0,
      double yottabytes = 0.0})
      : this.Bytes = (bytes +
                kilobytes * pow(1024, 1) +
                megabytes * pow(1024, 2) +
                gigabytes * pow(1024, 3) +
                terabytes * pow(1024, 4) +
                petabytes * pow(1024, 5) +
                exabytes * pow(1024, 6) +
                zettabytes * pow(1024, 7) +
                yottabytes * pow(1024, 8))
            .round();

  Size.fromKB(double size) : this.Bytes = (size * pow(1024, 1)).round();
  Size.fromMB(double size) : this.Bytes = (size * pow(1024, 2)).round();
  Size.fromGB(double size) : this.Bytes = (size * pow(1024, 3)).round();
  Size.fromTB(double size) : this.Bytes = (size * pow(1024, 4)).round();
  Size.fromPB(double size) : this.Bytes = (size * pow(1024, 5)).round();
  Size.fromEB(double size) : this.Bytes = (size * pow(1024, 6)).round();
  Size.fromZB(double size) : this.Bytes = (size * pow(1024, 7)).round();
  Size.fromYB(double size) : this.Bytes = (size * pow(1024, 8)).round();

  Size.fromKiB(double size) : this.Bytes = (size * pow(1000, 1)).round();
  Size.fromMiB(double size) : this.Bytes = (size * pow(1000, 2)).round();
  Size.fromGiB(double size) : this.Bytes = (size * pow(1000, 3)).round();
  Size.fromTiB(double size) : this.Bytes = (size * pow(1000, 4)).round();
  Size.fromPiB(double size) : this.Bytes = (size * pow(1000, 5)).round();
  Size.fromEiB(double size) : this.Bytes = (size * pow(1000, 6)).round();
  Size.fromZiB(double size) : this.Bytes = (size * pow(1000, 7)).round();
  Size.fromYiB(double size) : this.Bytes = (size * pow(1000, 8)).round();

  static parse(String input) {
    String num = input.trim().toLowerCase();
    String unit = null;

    RegExp parseRegex = new RegExp(r"([0-9\.,]+) *([A-z]+(b(ytes?))?|bits?)?");

    Iterable<Match> matches = parseRegex.allMatches(num);

    if (matches.first.groupCount > 1) num = matches.first.group(1);
    if (matches.first.groupCount > 2) unit = matches.first.group(2);

    double conversion = double.parse(num);
    if (unit != null) unit = unit.trim();

    switch (unit) {
      case "k":
      case "kb":
      case "kbyte":
      case "kbytes":
      case "kilobyte":
      case "kilobytes":
        return new Size.fromKB(conversion);
      case "m":
      case "mb":
      case "mbyte":
      case "mbytes":
      case "megabyte":
      case "megabytes":
        return new Size.fromMB(conversion);
      case "g":
      case "gb":
      case "gbyte":
      case "gbytes":
      case "gigabyte":
      case "gigabytes":
        return new Size.fromGB(conversion);
      case "t":
      case "tb":
      case "tbyte":
      case "tbytes":
      case "terabyte":
      case "terabytes":
        return new Size.fromTB(conversion);
      case "p":
      case "pb":
      case "pbyte":
      case "pbytes":
      case "petabyte":
      case "petabytes":
        return new Size.fromPB(conversion);
      case "e":
      case "eb":
      case "ebyte":
      case "ebytes":
      case "exabyte":
      case "exabytes":
        return new Size.fromEB(conversion);
      case "z":
      case "zb":
      case "zbyte":
      case "zbytes":
      case "zettabyte":
      case "zettabytes":
        return new Size.fromZB(conversion);
      case "y":
      case "yb":
      case "ybyte":
      case "ybytes":
      case "yottabyte":
      case "yottabytes":
        return new Size.fromYB(conversion);
      case "kib":
      case "kibyte":
      case "kibytes":
      case "kibibyte":
      case "kibibytes":
        return new Size.fromKiB(conversion);
      case "mib":
      case "mibyte":
      case "mibytes":
      case "mebibyte":
      case "mebibytes":
        return new Size.fromMiB(conversion);
      case "gib":
      case "gibyte":
      case "gibytes":
      case "gibibyte":
      case "gibibytes":
        return new Size.fromGiB(conversion);
      case "tib":
      case "tibyte":
      case "tibytes":
      case "tebibyte":
      case "tebibytes":
        return new Size.fromTiB(conversion);
      case "pib":
      case "pibyte":
      case "pibytes":
      case "pebibyte":
      case "pebibytes":
        return new Size.fromPiB(conversion);
      case "eib":
      case "eibyte":
      case "eibytes":
      case "exbibyte":
      case "exbibytes":
        return new Size.fromEiB(conversion);
      case "zib":
      case "zibyte":
      case "zibytes":
      case "zebibyte":
      case "zebibytes":
        return new Size.fromZiB(conversion);
      case "yib":
      case "yibyte":
      case "yibytes":
      case "yobibyte":
      case "yobibytes":
        return new Size.fromYiB(conversion);
      case "bit":
      case "bits":
        return new Size((conversion / 8).round());
      case "b":
      case "byte":
      case "bytes":
      default:
        return new Size(conversion.round());
    }
  }

  double get KB => Bytes / 1024;
  double get MB => KB / 1024;
  double get GB => MB / 1024;
  double get TB => GB / 1024;
  double get PB => TB / 1024;
  double get EB => PB / 1024;
  double get ZB => EB / 1024;
  double get YB => ZB / 1024;

  double get KiB => Bytes / 1000;
  double get MiB => KiB / 1000;
  double get GiB => MiB / 1000;
  double get TiB => GiB / 1000;
  double get PiB => TiB / 1000;
  double get EiB => PiB / 1000;
  double get ZiB => EiB / 1000;
  double get YiB => ZiB / 1000;

  int compareTo(Size ct) => this.Bytes.compareTo(ct.Bytes);

  @override
  bool operator ==(Object ct) => ct is Size && this.Bytes == ct.Bytes;

  @override
  int get hashCode => this.Bytes;

  Size operator +(Size ct) => new Size(this.Bytes + ct.Bytes);
  Size operator -(Size ct) => new Size(this.Bytes - ct.Bytes);
  Size operator -() => new Size(-this.Bytes);
  Size operator *(Size ct) => new Size(this.Bytes * ct.Bytes);

  Size operator ~/(Size ct) {
    if (ct.Bytes == 0)
      throw new IntegerDivisionByZeroException();
    else
      return new Size(this.Bytes ~/ ct.Bytes);
  }

  bool operator <(Size ct) => this.Bytes < ct.Bytes;
  bool operator >(Size ct) => this.Bytes > ct.Bytes;
  bool operator <=(Size ct) => this.Bytes <= ct.Bytes;
  bool operator >=(Size ct) => this.Bytes >= ct.Bytes;

  @override
  String toString() {
    if (this.Bytes.abs() < 1000)
      return "${this.Bytes} Bytes";
    else if (this.KB.abs() < 1000)
      return "${this.KB.toStringAsFixed(2)} Kb";
    else if (this.MB.abs() < 1000)
      return "${this.MB.toStringAsFixed(2)} Mb";
    else if (this.GB.abs() < 1000)
      return "${this.GB.toStringAsFixed(2)} Gb";
    else if (this.TB.abs() < 1000)
      return "${this.TB.toStringAsFixed(2)} Tb";
    else if (this.PB.abs() < 1000)
      return "${this.PB.toStringAsFixed(2)} Pb";
    else if (this.EB.abs() < 1000)
      return "${this.EB.toStringAsFixed(2)} Eb";
    else if (this.ZB.abs() < 1000)
      return "${this.ZB.toStringAsFixed(2)} Zb";
    else
      return "${this.YB.toStringAsFixed(2)} Yb";
  }
}
