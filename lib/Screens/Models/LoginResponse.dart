class LoginResponse {
  Result? result;

  LoginResponse({this.result});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  int? login;
  String? sessionId;
  String? phone;
  String? email;
  String? apiKey;
  int? partner_id;

  Result({this.login, this.sessionId,this.phone,this.email, this.apiKey, this.partner_id});

  Result.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    sessionId = json['session_id'];
    phone = json['phone'];
    email = json['email'];
    apiKey = json['api_key'];
    partner_id = json['partner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['session_id'] = this.sessionId;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['api_key'] = this.apiKey;
    data['partner_id'] = this.partner_id;
    return data;
  }
}