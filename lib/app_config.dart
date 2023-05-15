String baseUrl = 'https://erp-dev-api.devslane.com:8080/api';
bool isProduction = false;
String sentryDSNUrl = '';

//TODO to use this pass this variable while running app using => --dart-define=secretClientId=my_value
const secretClientId = String.fromEnvironment('secretClientId');

void setupEnv(Environment env) {
  switch (env) {
    case Environment.dev:
      {
        baseUrl = 'https://myurl.com/dev/';
        break;
      }

    case Environment.prod:
      {
        isProduction = true;
        baseUrl = 'https://myurl.com/';
        break;
      }
    case Environment.stag:
      {
        isProduction = true;
        baseUrl = 'https://myurl.com/stag';
        break;

      }
  }
}

enum Environment { dev, prod, stag }