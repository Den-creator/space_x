enum EnvType { dev, prod }

extension EnvTypeExtension on EnvType {
  String get fileName {
    switch (this) {
      case EnvType.dev:
        return '.env.dev';
      case EnvType.prod:
        return '.env.prod';
    }
  }

  String get title {
    switch (this) {
      case EnvType.dev:
        return 'DEV';
      case EnvType.prod:
        return 'PROD';
    }
  }
}
