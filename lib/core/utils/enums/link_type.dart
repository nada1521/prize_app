enum LinkType {
  pdf,
  image,
  other;

  bool get isPdf => this == LinkType.pdf;

  bool get isImage => this == LinkType.image;

  bool get isOther => this == LinkType.other;

  static LinkType fromString(String value) {
    switch (value.toLowerCase()) {
      case "pdf":
        return LinkType.pdf;
      case "png":
      case "jpg":
      case "jpeg":
      case "webp":
      case "heic":
        return LinkType.image;
      default:
        return LinkType.other;
    }
  }
}
