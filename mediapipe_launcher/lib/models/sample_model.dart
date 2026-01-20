/// Sample category enum
enum SampleCategory { vision, audio, text, genai, custom }

/// Platform support enum
enum Platform { android, ios, web, python, raspberryPi }

/// MediaPipe Sample model
class Sample {
  final String id;
  final String name;
  final String description;
  final String icon;
  final SampleCategory category;
  final List<Platform> platforms;
  final String githubPath;
  final String? docUrl;

  const Sample({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.category,
    required this.platforms,
    required this.githubPath,
    this.docUrl,
  });

  String get categoryLabel {
    switch (category) {
      case SampleCategory.vision:
        return 'Vision';
      case SampleCategory.audio:
        return 'Audio';
      case SampleCategory.text:
        return 'Text';
      case SampleCategory.genai:
        return 'GenAI';
      case SampleCategory.custom:
        return 'Custom';
    }
  }

  String get githubUrl =>
      'https://github.com/google-ai-edge/mediapipe-samples/tree/main/examples/$githubPath';
}

extension PlatformExtension on Platform {
  String get label {
    switch (this) {
      case Platform.android:
        return 'Android';
      case Platform.ios:
        return 'iOS';
      case Platform.web:
        return 'Web';
      case Platform.python:
        return 'Python';
      case Platform.raspberryPi:
        return 'Raspberry Pi';
    }
  }

  String get icon {
    switch (this) {
      case Platform.android:
        return '🤖';
      case Platform.ios:
        return '🍎';
      case Platform.web:
        return '🌐';
      case Platform.python:
        return '🐍';
      case Platform.raspberryPi:
        return '🥧';
    }
  }
}
