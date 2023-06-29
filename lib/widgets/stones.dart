import 'package:flutter/material.dart';

import 'stone.dart';

class Stones extends StatelessWidget {
  const Stones({super.key, required this.count});
  final int count;

  Widget oneStone() {
    return const Stone();
  }

  Widget twoStones() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Stone(), Stone()],
    );
  }

  Widget _threeStones() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Stone(), Stone(), Stone()],
    );
  }

  Widget _fourStones() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Stone(), Stone(), Stone(), Stone()],
    );
  }

  Widget _fiveStones() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Stone(), Stone(), Stone(), Stone(), Stone()],
    );
  }

  List<Widget> threeStones() {
    return [oneStone(), twoStones()];
  }

  List<Widget> fourStones() {
    return [oneStone(), twoStones(), oneStone()];
  }

  List<Widget> fiveStones() {
    return [oneStone(), _threeStones(), oneStone()];
  }

  List<Widget> sixStones() {
    return [_threeStones(), _threeStones()];
  }

  List<Widget> sevenStones() {
    return [oneStone(), _threeStones(), _threeStones()];
  }

  List<Widget> eightStones() {
    return [oneStone(), _threeStones(), _threeStones(), oneStone()];
  }

  List<Widget> nineStones() {
    return [_threeStones(), _threeStones(), _threeStones()];
  }

  List<Widget> tenStones() {
    return [_fiveStones(), _fiveStones()];
  }

  List<Widget> defaultStones() {
    return [
      _threeStones(),
      _fourStones(),
      _fiveStones(),
      _fourStones(),
      _threeStones()
    ];
  }

  dynamic stones() {
    switch (count) {
      case 0:
        return Container();
      case 1:
        return oneStone();
      case 2:
        return twoStones();
      case 3:
        return threeStones();
      case 4:
        return fourStones();
      case 5:
        return fiveStones();
      case 6:
        return sixStones();
      case 7:
        return sevenStones();
      case 8:
        return eightStones();
      case 9:
        return nineStones();
      case 10:
        return tenStones();
      default:
        return defaultStones();
    }
  }

  @override
  Widget build(BuildContext context) {
    return count > 2
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [...stones()],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [stones()],
          );
  }
}
