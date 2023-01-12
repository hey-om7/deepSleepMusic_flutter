import 'package:gsheets/gsheets.dart';

const _credintials = r'''
{
  "type": "service_account",
  "project_id": "deepsleepmusic",
  "private_key_id": "6350f2d81b77c98667206643a39c73561c46805b",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDMrEt012Gadftl\nYKZiLA2B/5UOHTGzXhid2Qgr4qmGBKdsCAgvryFkBQpua06DHHVU31jS1fmTo+Hz\n2iTbtOFw28Pm4Zq/oNXnEANgR0VR3gPjJkkVKcVs3bKO0N5nH7m261DdrcPi3hrD\nrLXPvUnh97M8XN3pUdAjljvYAcDr0zh6odE672H41MubM2cY8fWSLG67nkpJtKgR\nhtn2TV4dNRrK6ErIFxY3fozOq8ZW8/WZq9kc/XKBobr0QSqBTNuZGp5dNrg7/oun\nZHZXCkCHdoHvoXGZmzBZWrnM/xmexaz+1hr85RK2Mj/2eMrHvIdKtELwWdeHL8AC\nzYT73Ex7AgMBAAECggEAEx4CWK7uQLvFnonkU9K8Wqi686JW2Ra9HK+zHrF0lvFq\nV4hGIEYVMiVyYvvs5zwwpwIxme4++imNjY+SCV+GZMDYnIEoFiWstRqYZiH7rJKD\nMT1YCDA3O4+9m0j3hqq+iwJemRLsJnQLP4mrQo5YqOpp0gXByIawXUXHRmOevg55\nCYpkH3wCLRiqoIaM7B1L/QJPgYgIv79uy0c7FVmAcFQPe88fk3USOqVPJliVKFhl\nKcn5XC6LKQW0tNqOBegjwzO6wW6nJ6wdS1wniCQ7/HohSUyi3rzdXahtUKzx3fxI\nPOZoExAgcxALizBtDvCSa3pDr46b0hOS3R7DqdvUmQKBgQD7tLJYjumO0GIT36Iy\nSqYAbtx2uSkaQ9rwJFtC7HdYbGrgOtEqcggXEB6fqDseUyo+ysEGpYqWrIWMueZ5\nxTTtndnyMvm03RU0F+v8PeOk7Gpec0HbOoYEXhHEo+KBdT172vhK4+fQDvh6OwX3\nAOuRZMSFhWBH6U/CKV1hfCOeBwKBgQDQKi+0ewDt5uniXWWRmlJGys7Fp+1gV8+g\nG/VAAsK35zgoWe64UAr2KnaxkgN5soqCqsl33lboh9TWeTddlauck3vXiNG4Emb0\nmgYpNHxxeJUcUy71tN4dbmikWcnKzSk3dKuP+9+yai42gyarjhs8RYsBFSFRBkrp\nkiQrEUUA7QKBgQCqt7om+ndK1+dNl2aJObwxmv+Ivrk0CUXbjq0fTQb9QDuU7g+j\n/EekbNh4bT/7p2iFwjr9aRYAb+78rbG2cZ0edOu3q/9VPoX9GSSDpu5Zk8fpW78V\nFDKFj8/5UTZ1m7Eh6jhxgvZdVWoObS30g/lCWdg4v2e4HnRsOmYNkocNzQKBgFhh\nYOm+w7E+NhT+1G3SWJZn6wxudNFP1v5CgIkR4vxTtjsjm8Azc8P6WXSg6srTrA04\nV9uF0d5eNVZuFrysHDWZRJ5JH8mIPqAhePYrq549tQlWo/x8M0XJp7IH0S5ClvpN\nlb3HEb3daQuJ+XQjHJslZ5QpFYEiK9IpUyPZ7DMtAoGAVk8OZriVlG73ykNhadmC\nTw9CqqZfGM52FGED1pPM9mair+QzXWqxhwAfxc+YBIm6NuyVrQMe/K4bXLzcfGsU\nEzxXMbL3/GnTIeES6azVcnIX86KTPSCQDbo0FHsz2fi5P94FQDamPzUgjR4cojv/\nPmia9UQ5LqKTRlfeSGOq3FM=\n-----END PRIVATE KEY-----\n",
  "client_email": "deepsleepmusicapp@deepsleepmusic.iam.gserviceaccount.com",
  "client_id": "111175544390272671102",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/deepsleepmusicapp%40deepsleepmusic.iam.gserviceaccount.com"
}
''';

const _spreadsheetID = "1WVh_izV5cMGql7-Yb6Zxt7ivEvVhXqoYrN1e0W5DTmU";

Future<List<String>> gsheetss() async {
  final gsheets = GSheets(_credintials);
  final grabSpreadsheet = await gsheets.spreadsheet(_spreadsheetID);
  var currentSheet = grabSpreadsheet.worksheetByTitle("Sounds");
  // await currentSheet!.values.appendRow(allDetails);
  return currentSheet!.values.column(3, fromRow: 2);
}
