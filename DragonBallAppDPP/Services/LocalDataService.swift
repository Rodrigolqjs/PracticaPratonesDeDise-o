
import Foundation

private enum Constant {
  static let heroKey = "KCToken"
}

final class LocalDataService {
  private static let userDefaults = UserDefaults.standard
  
  static func getToken() -> String? {
    userDefaults.string(forKey: Constant.heroKey)
  }
  
    static func saveToken(token: String) {
    userDefaults.set(token, forKey: Constant.heroKey)
  }
}
