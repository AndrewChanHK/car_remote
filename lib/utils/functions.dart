import 'enums.dart';

Direction getClockwiseDirection(Direction direction) {
  late Direction res;
  switch (direction) {
    case Direction.up:
      res = Direction.right;
      break;
    case Direction.left:
      res = Direction.up;
      break;
    case Direction.down:
      res = Direction.left;
      break;
    case Direction.right:
      res = Direction.down;
      break;
  }
  return res;
}

Direction getCounterClockwiseDirection(Direction direction) {
  late Direction res;
  switch (direction) {
    case Direction.up:
      res = Direction.left;
      break;
    case Direction.left:
      res = Direction.down;
      break;
    case Direction.down:
      res = Direction.right;
      break;
    case Direction.right:
      res = Direction.up;
      break;
  }
  return res;
}

int newLocation(int location, Direction direction) {
  late bool limit;
  switch (direction) {
    case Direction.up:
      limit = location >= 0 && location <= 9;
      break;
    case Direction.left:
      limit = List.generate(10, (i) => i * 10).contains(location);
      break;
    case Direction.down:
      limit = location >= 90 && location <= 99;
      break;
    case Direction.right:
      limit = List.generate(10, (i) => (i * 10) + 9).contains(location);
      break;
  }
  return limit ? location : location += direction.moveValue;
}
