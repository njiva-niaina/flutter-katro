import 'dart:collection';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utilities/katro.dart';

final katroProvider =
    StateNotifierProvider<KatroNotifier, Katro>((ref) => KatroNotifier());

class KatroNotifier extends StateNotifier<Katro> {
  KatroNotifier()
      : super(Katro(
            board: List<int>.filled(16, 2),
            orientation: HashMap.from({1: 1, -1: 1}),
            isMoving: false,
            mainPlayer: 1,
            currentIndex: -1,
            totalInHand: 0));

  Future<void> _put(int index) async {
    await Future.delayed(const Duration(milliseconds: 250));
    var newBoard = List<int>.from(state.board);
    newBoard[index] += 1;
    state = state.copyWith(
        board: newBoard,
        totalInHand: state.totalInHand - 1,
        currentIndex: index);
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<void> _take(int index) async {
    var newBoard = List<int>.from(state.board);
    var total = newBoard[index];
    newBoard[index] = 0;
    state =
        state.copyWith(board: newBoard, totalInHand: state.totalInHand + total);
    await Future.delayed(const Duration(milliseconds: 250));
  }

  Future<void> _takeWithOpponent(int index) async {
    await _take(index);
    if ((index >= 0 && index < 4) || (index > 11 && index <= 15)) return;
    var mod = index > 7 ? 8 : 16;
    if (state.board[(index + 4) % mod] == 0 &&
        state.isFrontEmptyFrom((index + 4) % mod)) {
      await _take((index + 8) % mod);
    }
    await _take((index + 4) % mod);
  }

  Future<void> _move(int index, {isDefault = true}) async {
    state = state.copyWith(currentIndex: index);
    if (isDefault) {
      await _take(index);
    } else {
      await _takeWithOpponent(index);
    }
    while (state.totalInHand > 0) {
      index = Katro.next(index, state.orientation[state.mainPlayer]!);
      await _put(index);
      if (state.totalInHand == 0 && state.board[index] > 1) {
        await _move(index, isDefault: false);
        await Future.delayed(const Duration(milliseconds: 250));
      }
    }
  }

  Future<void> play(int index) async {
    if (!state.canMoveFrom(index)) return;
    state = state.copyWith(isMoving: true);
    await _move(index);
    state = state.copyWith(
        mainPlayer: -state.mainPlayer, isMoving: false, currentIndex: -1);
  }
}
