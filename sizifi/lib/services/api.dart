
abstract class Api {
  static post({endpoint, data, headers}) async {}

  static get({endpoint, headers, params}) async {}

  static delete({endpoint, headers, params}) async {}

  static patch({endpoint, data, headers}) async {}

  static upload({endpoint, headers, files, location}) async {}
}
