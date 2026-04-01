class BeRespnse {
  String? code;
  String? name;
  int? areaSqKm;
  int? population;
  List<String>? lines;
  int? countries;
  List<String>? oceans;
  List<String>? developedCountries;

  BeRespnse(
      {this.code,
        this.name,
        this.areaSqKm,
        this.population,
        this.lines,
        this.countries,
        this.oceans,
        this.developedCountries});

  BeRespnse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    areaSqKm = json['areaSqKm'];
    population = json['population'];
    lines = json['lines'].cast<String>();
    countries = json['countries'];
    oceans = json['oceans'].cast<String>();
    developedCountries = json['developedCountries'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['areaSqKm'] = this.areaSqKm;
    data['population'] = this.population;
    data['lines'] = this.lines;
    data['countries'] = this.countries;
    data['oceans'] = this.oceans;
    data['developedCountries'] = this.developedCountries;
    return data;
  }
}