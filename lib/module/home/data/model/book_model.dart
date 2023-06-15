// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BooksModel {
  int? totalItems;
  List<Items>? items;

  BooksModel({ this.items});

  factory BooksModel.fromJson(Map<String, dynamic> json) => _$BooksModelFromJson(json);

  Map<String, dynamic> toJson() => _$BooksModelToJson(this);
}

@JsonSerializable()
class Items {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  Items(
      { this.kind,
       this.id,
       this.etag,
       this.selfLink,
       this.volumeInfo,
       this.saleInfo,
       this.accessInfo,
       this.searchInfo});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class VolumeInfo {
  String? title;
  String? subtitle;
  List<String>? authors;
  String? publishedDate;
  List<IndustryIdentifiers>? industryIdentifiers;
  ReadingModes? readingModes;
  int? pageCount;
  String? printType;
  List<String>? categories;
  String? maturityRating;
  bool allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;
  String? publisher;
  String? description;
  int? averageRating;
  int? ratingsCount;

  VolumeInfo(
      { this.title,
       this.subtitle,
       this.authors,
       this.publishedDate,
       this.industryIdentifiers,
       this.readingModes,
       this.pageCount,
       this.printType,
       this.categories,
       this.maturityRating,
       required this.allowAnonLogging,
       this.contentVersion,
       this.panelizationSummary,
       this.imageLinks,
       this.language,
       this.previewLink,
       this.infoLink,
       this.canonicalVolumeLink,
       this.publisher,
       this.description,
       this.averageRating,
       this.ratingsCount});

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => _$VolumeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeInfoToJson(this);
}

@JsonSerializable()
class IndustryIdentifiers {
  String? type;
  String? identifier;

  IndustryIdentifiers({ this.type,  this.identifier});

  factory IndustryIdentifiers.fromJson(Map<String, dynamic> json) =>
      _$IndustryIdentifiersFromJson(json);

  Map<String, dynamic> toJson() => _$IndustryIdentifiersToJson(this);
}

@JsonSerializable()
class ReadingModes {
  bool text;
  bool image;

  ReadingModes({ required this.text, required this.image});

  factory ReadingModes.fromJson(Map<String, dynamic> json) =>
      _$ReadingModesFromJson(json);

  Map<String, dynamic> toJson() => _$ReadingModesToJson(this);
}

@JsonSerializable()
class PanelizationSummary {
  bool containsEpubBubbles;
  bool containsImageBubbles;

  PanelizationSummary(
      {required this.containsEpubBubbles, required this.containsImageBubbles});

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) =>
      _$PanelizationSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$PanelizationSummaryToJson(this);
}

@JsonSerializable()
class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinks({ this.smallThumbnail,  this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) => _$ImageLinksFromJson(json);

  Map<String, dynamic> toJson() => _$ImageLinksToJson(this);
}

@JsonSerializable()
class SaleInfo {
  String? country;
  String? saleability;
  bool isEbook;
  String? buyLink;
  List<Offers>? offers;

  SaleInfo(
      { this.country,
       this.saleability,
      required this.isEbook,
       this.buyLink,
       this.offers});

  factory SaleInfo.fromJson(Map<String, dynamic> json) => _$SaleInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SaleInfoToJson(this);
}

@JsonSerializable()
class Offers {
  int? finskyOfferType;
  bool giftable;

  Offers({ this.finskyOfferType, required this.giftable});

  factory Offers.fromJson(Map<String, dynamic> json) => _$OffersFromJson(json);

  Map<String, dynamic> toJson() => _$OffersToJson(this);
}

@JsonSerializable()
class AccessInfo {
  String? country;
  String? viewability;
  bool embeddable;
  bool publicDomain;
  String? textToSpeechPermission;
  Epub? epub;
  Epub? pdf;
  String? webReaderLink;
  String? accessViewStatus;
  bool quoteSharingAllowed;

  AccessInfo(
      { this.country,
       this.viewability,
      required this.embeddable,
      required this.publicDomain,
       this.textToSpeechPermission,
       this.epub,
       this.pdf,
       this.webReaderLink,
       this.accessViewStatus,
      required this.quoteSharingAllowed});

  factory AccessInfo.fromJson(Map<String, dynamic> json) => _$AccessInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AccessInfoToJson(this);
}

@JsonSerializable()
class Epub {
  bool isAvailable;
  String? downloadLink;
  String? acsTokenLink;

  Epub(
      {required this.isAvailable,
       this.downloadLink,
       this.acsTokenLink});

  factory Epub.fromJson(Map<String, dynamic> json) => _$EpubFromJson(json);

  Map<String, dynamic> toJson() => _$EpubToJson(this);
}

@JsonSerializable()
class SearchInfo {
  String? textSnippet;

  SearchInfo({ this.textSnippet});

  factory SearchInfo.fromJson(Map<String, dynamic> json) => _$SearchInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchInfoToJson(this);
}
