enum CardSize { small, medium, large }


extension CardSizeX on CardSize {
  double get size {
    switch (this) {
      case CardSize.small:
        return 160.0;
      case CardSize.medium:
        return 180.0;
      case CardSize.large:
        return 240.0;
    }
  }
}