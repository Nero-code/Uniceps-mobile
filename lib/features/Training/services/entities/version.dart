class Version {
  final String versionNum, playUrl, mainUrl;

  Version({
    required this.versionNum,
    required this.playUrl,
    required this.mainUrl,
  });

  factory Version.fromJson(Map<String, dynamic> json) {
    return Version(
      versionNum: json['version'] ?? "",
      playUrl: json['store'] ?? "",
      mainUrl: json['url'] ?? "",
    );
  }
}
