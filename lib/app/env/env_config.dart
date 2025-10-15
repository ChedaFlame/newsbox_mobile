

class EnvConfig {
  final String baseUrl;
  final String xapiKey;
  EnvConfig(this.baseUrl, this.xapiKey);
}

enum EnvironmentEnums { dev, qa, prod }

mixin EnvironmentValue {

  static const xapiKey = String.fromEnvironment('API_KEY', defaultValue: "Env.xKey");
  static const xprodapiKey = String.fromEnvironment('API_KEY', defaultValue: "Env.prdKey");

  static final EnvConfig dev = EnvConfig("https://chedadigital.co.za/public/api", xapiKey);


}
