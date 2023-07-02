import 'package:flutter/material.dart';

/*
  ---------------------
  | 12 | 13 | 14 | 15 |  - Player 2 : [8 - 15]
  |----|----|----|----|  - Orientation : 1  => Clockwise
  | 08 | 09 | 10 | 11 |                 -1  => Counterclockwise
  |----|----|----|----|
  | 04 | 05 | 06 | 07 |
  |----|----|----|----|
  | 00 | 01 | 02 | 03 |
  ---------------------
*/

@immutable
class Katro {
  const Katro(
      {required this.board,
      required this.mainPlayer,
      required this.orientation,
      required this.isMoving,
      required this.isPlaying,
      required this.totalInHand,
      required this.currentIndex});

  final List<int> board;
  final Map<int, int> orientation;
  final bool isMoving;
  final bool isPlaying;
  final int mainPlayer;
  final int totalInHand;
  final int currentIndex;

  Katro copyWith(
      {List<int>? board,
      Map<int, int>? orientation,
      bool? isMoving,
      bool? isPlaying,
      int? mainPlayer,
      int? totalInHand,
      int? currentIndex}) {
    return Katro(
        board: board ?? this.board,
        isPlaying: isPlaying ?? this.isPlaying,
        isMoving: isMoving ?? this.isMoving,
        mainPlayer: mainPlayer ?? this.mainPlayer,
        orientation: orientation ?? this.orientation,
        currentIndex: currentIndex ?? this.currentIndex,
        totalInHand: totalInHand ?? this.totalInHand);
  }

  bool _isRangeEmpty(int start, int end) {
    bool isEmpty = true;
    for (var i = start; i <= end; i++) {
      if (board[i] != 0) isEmpty = false;
    }
    return isEmpty;
  }

  bool isFrontEmptyFrom(int index) {
    var isEmpty = true;
    if (index > 7 && index < 12) isEmpty = _isRangeEmpty(8, 11);
    if (index > 3 && index < 8) isEmpty = _isRangeEmpty(4, 7);
    return isEmpty;
  }

  bool canMoveFrom(int index) {
    if (board[index] == 0) return false;
    if (index < 0 || index > 15) return false;
    if (mainPlayer == 1 && index > 7) return false;
    if (mainPlayer == -1 && index < 8) return false;
    if (isMoving) return false;
    return true;
  }

  static int next(int index, int orientation) {
    var mod = index > 7 ? 16 : 8;

    if (orientation == 1 && ((index + 8) % mod == 0)) return (index + 20) % mod;
    if (orientation == 1 && ((index + 8) % mod == 7)) return (index + 12) % mod;
    if (orientation == 1 && ((index + 8) % mod > 0 && (index + 8) % mod < 4)) {
      return (index - 17) % mod;
    }
    if (orientation == 1 && ((index + 8) % mod > 3 && (index + 8) % mod < 7)) {
      return (index - 15) % mod;
    }

    if (orientation == -1 && ((index + 8) % mod == 3)) {
      return (index + 20) % mod;
    }
    if (orientation == -1 && ((index + 8) % mod == 4)) {
      return (index + 12) % mod;
    }
    if (orientation == -1 &&
        ((index + 8) % mod >= 0 && (index + 8) % mod < 3)) {
      return (index - 15) % mod;
    }
    if (orientation == -1 &&
        ((index + 8) % mod > 4 && (index + 8) % mod <= 7)) {
      return (index - 17) % mod;
    }

    return -1;
  }
}
