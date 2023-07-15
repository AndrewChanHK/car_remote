enum Direction {
  up(1 / 360, -10),
  down(180 / 360, 10),
  left(270 / 360, -1),
  right(90 / 360, 1);

  final double value;
  final int moveValue;
  const Direction(this.value, this.moveValue);
}
