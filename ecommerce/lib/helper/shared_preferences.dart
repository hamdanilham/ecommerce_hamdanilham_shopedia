import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Future<void> SetLoginCredential(int id, String nama, String email,
      String nomor_hp, String password, double saldo, String tgl_daftar) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("id", id);
    sharedPreferences.setString("nama", nama);
    sharedPreferences.setString("email", email);
    sharedPreferences.setString("nomor_hp", nomor_hp);
    sharedPreferences.setString("password", password);
    sharedPreferences.setDouble("saldo", saldo);
    sharedPreferences.setString("tgl_daftar", tgl_daftar);
  }

  Future<int> getId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? data = sharedPreferences.getInt("nama");
    int strReturn = data == null ? 0 : data;

    return strReturn;
  }

  Future<String> getNama() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? data = sharedPreferences.getString("nama");
    String strReturn = data == null ? "" : data;

    return strReturn;
  }

  Future<String> getEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? data = sharedPreferences.getString("email");
    String strReturn = data == null ? "" : data;

    return strReturn;
  }

  Future<String> getNoHP() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? data = sharedPreferences.getString("nomor_hp");
    String strReturn = data == null ? "" : data;

    return strReturn;
  }

  Future<String> getPassword() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? data = sharedPreferences.getString("password");
    String strReturn = data == null ? "" : data;

    return strReturn;
  }

  Future<double> getSaldo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    double? data = sharedPreferences.getDouble("saldo");
    double strReturn = data == null ? 0 : data;

    return strReturn;
  }

  Future<String> getTglDaftar() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? data = sharedPreferences.getString("tgl_daftar");
    String strReturn = data == null ? "" : data;

    return strReturn;
  }
}
