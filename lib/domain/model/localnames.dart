class LocalNames {
  String af;
  String ar;
  String ascii;
  String bg;
  String ca;
  String da;
  String de;
  String el;
  String en;
  String eu;
  String fa;
  String featureName;
  String fi;
  String fr;
  String gl;
  String he;
  String hi;
  String hr;
  String hu;
  String id;
  String it;
  String ja;
  String la;
  String lt;
  String mk;
  String nl;
  String no;
  String pl;
  String pt;
  String ro;
  String ru;
  String sk;
  String sl;
  String sr;
  String th;
  String tr;
  String vi;

  LocalNames(
      {this.af,
      this.ar,
      this.ascii,
      this.bg,
      this.ca,
      this.da,
      this.de,
      this.el,
      this.en,
      this.eu,
      this.fa,
      this.featureName,
      this.fi,
      this.fr,
      this.gl,
      this.he,
      this.hi,
      this.hr,
      this.hu,
      this.id,
      this.it,
      this.ja,
      this.la,
      this.lt,
      this.mk,
      this.nl,
      this.no,
      this.pl,
      this.pt,
      this.ro,
      this.ru,
      this.sk,
      this.sl,
      this.sr,
      this.th,
      this.tr,
      this.vi});

  LocalNames.fromJson(Map<String, dynamic> json) {
    af = json['af'] as String;
    ar = json['ar'] as String;
    ascii = json['ascii'] as String;
    bg = json['bg'] as String;
    ca = json['ca'] as String;
    da = json['da'] as String;
    de = json['de'] as String;
    el = json['el'] as String;
    en = json['en'] as String;
    eu = json['eu'] as String;
    fa = json['fa'] as String;
    featureName = json['feature_name'] as String;
    fi = json['fi'] as String;
    fr = json['fr'] as String;
    gl = json['gl'] as String;
    he = json['he'] as String;
    hi = json['hi'] as String;
    hr = json['hr'] as String;
    hu = json['hu'] as String;
    id = json['id'] as String;
    it = json['it'] as String;
    ja = json['ja'] as String;
    la = json['la'] as String;
    lt = json['lt'] as String;
    mk = json['mk'] as String;
    nl = json['nl'] as String;
    no = json['no'] as String;
    pl = json['pl'] as String;
    pt = json['pt'] as String;
    ro = json['ro'] as String;
    ru = json['ru'] as String;
    sk = json['sk'] as String;
    sl = json['sl'] as String;
    sr = json['sr'] as String;
    th = json['th'] as String;
    tr = json['tr'] as String;
    vi = json['vi'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['af'] = af;
    data['ar'] = ar;
    data['ascii'] = ascii;
    data['bg'] = bg;
    data['ca'] = ca;
    data['da'] = da;
    data['de'] = de;
    data['el'] = el;
    data['en'] = en;
    data['eu'] = eu;
    data['fa'] = fa;
    data['feature_name'] = featureName;
    data['fi'] = fi;
    data['fr'] = fr;
    data['gl'] = gl;
    data['he'] = he;
    data['hi'] = hi;
    data['hr'] = hr;
    data['hu'] = hu;
    data['id'] = id;
    data['it'] = it;
    data['ja'] = ja;
    data['la'] = la;
    data['lt'] = lt;
    data['mk'] = mk;
    data['nl'] = nl;
    data['no'] = no;
    data['pl'] = pl;
    data['pt'] = pt;
    data['ro'] = ro;
    data['ru'] = ru;
    data['sk'] = sk;
    data['sl'] = sl;
    data['sr'] = sr;
    data['th'] = th;
    data['tr'] = tr;
    data['vi'] = vi;
    return data;
  }
}
