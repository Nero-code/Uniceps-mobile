class Version {
  static const currentMajor = 3;
  static const currentMinor = 3;
  static const currentPatch = 3;
  static const currentBuild = 18;

  final int major, minor, patch, build;
  final String changeLogEn, changeLogAr;
  final bool isUpdateUrgent;

  const Version({
    required this.major,
    required this.minor,
    required this.patch,
    required this.build,
    required this.changeLogEn,
    required this.changeLogAr,
    this.isUpdateUrgent = false,
  });

  factory Version.fromJson(Map<String, dynamic> json) {
    final versionString = json['version'] as String;
    final [major, minor, patch, build] = versionString.split('.').map((v) => int.parse(v)).toList();
    final isUrgent = json['isUrgent'] ?? (major > currentMajor || patch - 10 > currentPatch);
    return Version(
      major: major,
      minor: minor,
      patch: patch,
      build: build,
      changeLogEn: json['changeLog'] ?? '',
      changeLogAr: json['changeLogAr'] ?? '',
      isUpdateUrgent: isUrgent,
    );
  }

  Map<String, dynamic> toJson() => {
    "version": '$major.$minor.$patch.$build',
    "isUrgent": isUpdateUrgent,
    "changeLog": changeLogEn,
    "changeLogAr": changeLogAr,
  };

  factory Version.current() => const Version(
    major: currentMajor,
    minor: currentMinor,
    patch: currentPatch,
    build: currentBuild,
    changeLogEn: '',
    changeLogAr: '',
  );

  @override
  bool operator ==(Object other) {
    // 1. Check if they are the same instance in memory
    if (identical(this, other)) return true;

    // 2. Check type and compare all relevant fields
    return other is Version &&
        other.major == major &&
        other.minor == minor &&
        other.patch == patch &&
        other.build == build;
  }

  @override
  int get hashCode => Object.hash(major, minor, patch, build);

  @override
  String toString() => 'v$major.$minor.$patch.$build';

  static String code() => '$currentMajor.$currentMinor.$currentPatch.$currentBuild';
}
