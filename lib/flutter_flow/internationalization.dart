import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ko', 'en', 'ja', 'zh_Hans'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? koText = '',
    String? enText = '',
    String? jaText = '',
    String? zh_HansText = '',
  }) =>
      [koText, enText, jaText, zh_HansText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // TomatoJuice
  {
    'e4ew4t1u': {
      'ko': '조리시간 약 8분',
      'en': 'Cooking time: approx. 8 minutes',
      'ja': '調理時間約8分',
      'zh_Hans': '烹饪时间约8分钟',
    },
    'a0os78oy': {
      'ko': '농장에서 바로가져온 토마토를 자연 그대로\n 갈아넣어 건강과 맛 모두잡은 생 토마토 주스',
      'en':
          'Fresh tomato juice made with tomatoes straight from the farm, blended naturally to capture both health and taste',
      'ja': '農場からすぐに持ってきたトマトを自然のまま\n 着替えて健康と味の両方をつかんだ生トマトジュース',
      'zh_Hans': '直接从农场带来的天然番茄\n 磨碎的生番茄汁既健康又美味',
    },
    '2ffmo10k': {
      'ko': '주재료: 토마토',
      'en': 'Main ingredient: Tomato',
      'ja': '主材料：トマト',
      'zh_Hans': '主料：番茄',
    },
    'aft8e9z9': {
      'ko': '원산지\n토마토: 국내산',
      'en': 'Origin\nTomatoes: Domestic',
      'ja': '原産地\nトマト：国内産',
      'zh_Hans': '起源\n西红柿：国产',
    },
    'd9qzkogr': {
      'ko': '얼음 X',
      'en': 'Ice X',
      'ja': '氷X',
      'zh_Hans': '冰x',
    },
    'nmthb7c6': {
      'ko': '사이즈 업(L) +1000원',
      'en': 'Size up (L) +1000 won',
      'ja': 'サイズアップ（L）+1000ウォン',
      'zh_Hans': '尺码加大(L) +1000韩元',
    },
    'slaw4may': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // pizzahome
  {
    '1wpcanrf': {
      'ko': '씬 도우 화덕 피자',
      'en': 'Thin crust oven pizza',
      'ja': 'シンドウ花徳ピザ',
      'zh_Hans': '薄面团木火披萨',
    },
    'my90686v': {
      'ko': '푸드트럭 소개',
      'en': 'Food Truck Introduction',
      'ja': 'フードトラック紹介',
      'zh_Hans': '餐车介绍',
    },
    '9zc2ovls': {
      'ko': '다양한 맛의 피자를 오븐에 직접 구워 만듭니다. ',
      'en': 'We make a variety of pizzas by baking them directly in the oven.',
      'ja': '様々な味のピザをオーブンに直接焼きます。',
      'zh_Hans': '各种口味的披萨直接在烤箱中烘烤。',
    },
    'iil5h33e': {
      'ko': '7.6km',
      'en': '7.6km',
      'ja': '7.6km',
      'zh_Hans': '7.6公里',
    },
    'njeaua3a': {
      'ko': '전화 : 041-0000-0000',
      'en': 'Phone: 041-0000-0000',
      'ja': '電話番号：041-0000-0000',
      'zh_Hans': '电话：041-0000-0000',
    },
    'j4sv0vxm': {
      'ko': '메뉴 보기',
      'en': 'View menu',
      'ja': 'メニューを見る',
      'zh_Hans': '查看菜单',
    },
    'uuqdhkx8': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // pizzamenu
  {
    '1w8nveea': {
      'ko': 'Page Title',
      'en': 'Page Title',
      'ja': 'ページタイトル',
      'zh_Hans': '页面标题',
    },
    'ze4358k8': {
      'ko': '페퍼로니 피자 6.0',
      'en': 'Pepperoni Pizza 6.0',
      'ja': 'ペパロニピザ6.0',
      'zh_Hans': '意大利辣香肠披萨 6.0',
    },
    'hsqekc1i': {
      'ko': '슈퍼콤비네이션 피자 7.0',
      'en': 'Super Combination Pizza 7.0',
      'ja': 'スーパーコンビネーションピザ7.0',
      'zh_Hans': '超级组合披萨7.0',
    },
    'u0orr04s': {
      'ko': '고구마 피자 7.0',
      'en': 'Sweet Potato Pizza 7.0',
      'ja': 'さつまいもピザ7.0',
      'zh_Hans': '红薯披萨7.0',
    },
    'g9c9ruj3': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // StrawberryJuice
  {
    'q6pnhk3a': {
      'ko': '조리시간 약 8분',
      'en': 'Cooking time: approx. 8 minutes',
      'ja': '調理時間約8分',
      'zh_Hans': '烹饪时间约8分钟',
    },
    'cm5nlfsc': {
      'ko': '농장에서 바로가져온 딸기를 생과일 그대로\n 갈아넣어 건강과 맛 모두잡은 생 딸기 주스',
      'en':
          'Fresh strawberry juice made with strawberries straight from the farm, blended with fresh fruit to capture both health and taste',
      'ja': '農場からすぐに持ってきたイチゴを生果実そのまま\n 着替えて健康と味の両方をつかんだ生いちごジュース',
      'zh_Hans': '直接来自农场的新鲜草莓\n 新鲜研磨的草莓汁，健康又美味',
    },
    'zh5fi57a': {
      'ko': '주재료: 딸기',
      'en': 'Main ingredient: strawberry',
      'ja': '主材料：イチゴ',
      'zh_Hans': '主要成分: 草莓',
    },
    'xcrf7hva': {
      'ko': '원산지\n딸기: 국내산',
      'en': 'Origin\nStrawberries: Domestic',
      'ja': '原産地\nイチゴ：国内産',
      'zh_Hans': '起源\n草莓：国产',
    },
    's08jd5rk': {
      'ko': '얼음 X',
      'en': 'Ice X',
      'ja': '氷X',
      'zh_Hans': '冰x',
    },
    '26ladwiu': {
      'ko': '사이즈 업(L) +1000원',
      'en': 'Size up (L) +1000 won',
      'ja': 'サイズアップ（L）+1000ウォン',
      'zh_Hans': '尺码加大(L) +1000韩元',
    },
    'dakcuzt5': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // KiwiJuice
  {
    'yswk00d3': {
      'ko': '조리시간 약 8분',
      'en': 'Cooking time: approx. 8 minutes',
      'ja': '調理時間約8分',
      'zh_Hans': '烹饪时间约8分钟',
    },
    'l2onbzuh': {
      'ko': '탄지니아에서 바로가져온 키위를 생과일 그대로\n 갈아넣어 건강과 맛 모두잡은 생 키위 주스',
      'en':
          'Fresh kiwi juice made with fresh kiwi fruit directly imported from Tanzania, capturing both health and taste',
      'ja': 'タンジニアからすぐに来たキウイを生の果物のまま\n 着替えて健康と味の両方をつかんだ生キウイジュース',
      'zh_Hans': '直接来自坦桑尼亚的新鲜猕猴桃\n 健康与口感兼备的奇异果原汁研磨',
    },
    'pptv28r3': {
      'ko': '주재료: 키위',
      'en': 'Main ingredient: Kiwi',
      'ja': '主材料：キウイ',
      'zh_Hans': '主料：猕猴桃',
    },
    '4uqptfcw': {
      'ko': '원산지\n키위: 탄지니아산',
      'en': 'Origin\nKiwi: Tanzania',
      'ja': '原産地\nキウイ：タンジニア産',
      'zh_Hans': '起源\n猕猴桃：来自坦桑尼亚',
    },
    'mh0nk1vw': {
      'ko': '얼음 X',
      'en': 'Ice X',
      'ja': '氷X',
      'zh_Hans': '冰x',
    },
    'm2v65r8t': {
      'ko': '사이즈 업(L) +1000원',
      'en': 'Size up (L) +1000 won',
      'ja': 'サイズアップ（L）+1000ウォン',
      'zh_Hans': '尺码加大(L) +1000韩元',
    },
    'xqdusxzd': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // pizza
  {
    'fy2iojea': {
      'ko': '조리시간 약 15분',
      'en': 'Cooking time: about 15 minutes',
      'ja': '調理時間約15分',
      'zh_Hans': '烹饪时间约15分钟',
    },
    'glmc7nf9': {
      'ko': '짭잘한 페퍼로니와 풍성한 맛의 치즈, 다양한 재료가 어우러져 만들어내는 환상의 콤비네이션',
      'en':
          'A fantastic combination of salty pepperoni, rich cheese, and various ingredients.',
      'ja': '濃厚なペパロニと豊かな味わいのチーズ、様々な食材が調和して生み出す幻のコンビネーション',
      'zh_Hans': '咸味意大利辣香肠、浓郁奶酪和各种配料的奇妙组合。',
    },
    '1ufyzs5e': {
      'ko': '주재료: 치즈, 토마토소스, 페퍼로니, \n버섯, 피망',
      'en':
          'Main ingredients: cheese, tomato sauce, pepperoni, mushrooms, green peppers',
      'ja': '主材料：チーズ、トマトソース、ペパロニ、 \nきのこ、ピーマン',
      'zh_Hans': '主要原料：奶酪、番茄酱、意大利辣香肠、 \n蘑菇、青椒',
    },
    '6tjix5yp': {
      'ko': '원산지: 치즈(국내산)\n페퍼로니(소고기: 국내산)',
      'en': 'Origin: Cheese (domestic)\nPepperoni (beef: domestic)',
      'ja': '原産地：チーズ（国内産）\nペパロニ（牛肉：国内産）',
      'zh_Hans': '原产国：奶酪（国内）\n意大利辣香肠（牛肉：国产）',
    },
    'bnn37sux': {
      'ko': '피클 추가',
      'en': 'Add pickles',
      'ja': 'ピクルスを追加',
      'zh_Hans': '添加泡菜',
    },
    'as9ksxb5': {
      'ko': '핫소스 추가 (+500)',
      'en': 'Add Hot Sauce (+500)',
      'ja': 'ホットソースを追加（+500）',
      'zh_Hans': '添加辣酱（+500）',
    },
    '9d5pgz8i': {
      'ko': '치즈볼 (+4000)',
      'en': 'Cheese Ball (+4000)',
      'ja': 'チーズボール（+4000）',
      'zh_Hans': '芝士球 (+4000)',
    },
    'qql0ci19': {
      'ko': '치즈 크러스트 추가 (+2000)',
      'en': 'Add Cheese Crust (+2000)',
      'ja': 'チーズクラストを追加（+2000）',
      'zh_Hans': '添加奶酪皮（+2000）',
    },
    'teebmbma': {
      'ko': '콜라 추가(1.5L) (+2000)',
      'en': 'Add Coke (1.5L) (+2000)',
      'ja': 'コーラ追加(1.5L) (+2000)',
      'zh_Hans': '添加可乐（1.5L）（+2000）',
    },
    'ormq4a05': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // login
  {
    'd1ddbzid': {
      'ko': '로그인',
      'en': 'Sign In',
      'ja': 'サインイン',
      'zh_Hans': '登入',
    },
    '9qqr8hzx': {
      'ko': 'Email Address',
      'en': 'Email Address',
      'ja': 'Email Address',
      'zh_Hans': '电子邮件地址',
    },
    'kkvaplbe': {
      'ko': 'Enter your email...',
      'en': 'Enter your email...',
      'ja': 'Enter your email...',
      'zh_Hans': '输入你的电子邮箱...',
    },
    'mfqlncws': {
      'ko': 'Password',
      'en': 'Password',
      'ja': 'パスワード',
      'zh_Hans': '密码',
    },
    '3l1w5cnn': {
      'ko': 'Enter your password...',
      'en': 'Enter your password...',
      'ja': 'Enter your password...',
      'zh_Hans': '输入您的密码...',
    },
    '5ibcvtnm': {
      'ko': 'Forgot Password?',
      'en': 'Forgot Password?',
      'ja': 'Forgot Password?',
      'zh_Hans': '忘记密码？',
    },
    '61afw5vd': {
      'ko': 'sign in',
      'en': 'sign in',
      'ja': 'sign in',
      'zh_Hans': '登入',
    },
    'n6bvu9h2': {
      'ko': 'Or use a social account to login',
      'en': 'Or use a social account to login',
      'ja': 'Or use a social account to login',
      'zh_Hans': '或使用社交账号登录',
    },
    '4uluyv3q': {
      'ko': '회원가입',
      'en': 'Sign Up',
      'ja': 'サインアップ',
      'zh_Hans': '报名',
    },
    'xwgh1e1n': {
      'ko': 'Email Address',
      'en': 'Email Address',
      'ja': 'Email Address',
      'zh_Hans': '电子邮件地址',
    },
    'rdi6y07e': {
      'ko': 'Enter your email...',
      'en': 'Enter your email...',
      'ja': 'Enter your email...',
      'zh_Hans': '输入你的电子邮箱...',
    },
    'hsjgztqr': {
      'ko': 'Password',
      'en': 'Password',
      'ja': 'パスワード',
      'zh_Hans': '密码',
    },
    'ct28nede': {
      'ko': 'Enter your password...',
      'en': 'Enter your password...',
      'ja': 'Enter your password...',
      'zh_Hans': '输入您的密码...',
    },
    'i2p9vf85': {
      'ko': 'Password',
      'en': 'Password',
      'ja': 'パスワード',
      'zh_Hans': '密码',
    },
    'sulbyxc2': {
      'ko': 'Enter your password...',
      'en': 'Enter your password...',
      'ja': 'Enter your password...',
      'zh_Hans': '输入您的密码...',
    },
    '9wnlpxrk': {
      'ko': 'phone number',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'jw7sx33p': {
      'ko': 'Enter your phone number...',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'wx6sbrh3': {
      'ko': 'Create Acount',
      'en': 'Create Account',
      'ja': 'Create Account',
      'zh_Hans': '创建账户',
    },
    '89ibpnoe': {
      'ko': 'Sign up using a social account',
      'en': 'Sign up using a social account',
      'ja': 'Sign up using a social account',
      'zh_Hans': '使用社交帐户注册',
    },
    'hig1oyzg': {
      'ko': 'weet',
      'en': 'Weet',
      'ja': 'weet',
      'zh_Hans': '威特',
    },
    'ml7s1nyh': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // pizza2
  {
    '4nt08zyl': {
      'ko': '조리시간 약 15분',
      'en': 'Cooking time: about 15 minutes',
      'ja': '調理時間約15分',
      'zh_Hans': '烹饪时间约15分钟',
    },
    'qgltb588': {
      'ko': '짭잘한 페퍼로니와 풍성한 맛의 치즈가 어우러져 내는 환상의 풍미',
      'en':
          'A fantastic flavor created by the combination of salty pepperoni and rich cheese.',
      'ja': '濃厚なペパロニと豊かな味のチーズが調和する幻の風味',
      'zh_Hans': '咸味意大利辣香肠和浓郁奶酪的美妙风味。',
    },
    'bmvqxk4y': {
      'ko': '주재료: 치즈, 토마토소스, 페퍼로니\n',
      'en': 'Main ingredients: cheese, tomato sauce, pepperoni',
      'ja': '主材料：チーズ、トマトソース、ペパロニ',
      'zh_Hans': '主要原料：奶酪、番茄酱、意大利辣香肠',
    },
    'uiip6ysx': {
      'ko': '원산지: 치즈(국내산)\n페퍼로니(소고기: 국내산)',
      'en': 'Origin: Cheese (domestic)\nPepperoni (beef: domestic)',
      'ja': '原産地：チーズ（国内産）\nペパロニ（牛肉：国内産）',
      'zh_Hans': '原产国：奶酪（国内）\n意大利辣香肠（牛肉：国产）',
    },
    'uisy27f7': {
      'ko': '피클 추가',
      'en': 'Add pickles',
      'ja': 'ピクルスを追加',
      'zh_Hans': '添加泡菜',
    },
    'zyj2okfk': {
      'ko': '핫소스 추가 (+500)',
      'en': 'Add Hot Sauce (+500)',
      'ja': 'ホットソースを追加（+500）',
      'zh_Hans': '添加辣酱（+500）',
    },
    '3gt6dpxe': {
      'ko': '치즈볼 (+4000)',
      'en': 'Cheese Ball (+4000)',
      'ja': 'チーズボール（+4000）',
      'zh_Hans': '芝士球 (+4000)',
    },
    '1v1gwgp3': {
      'ko': '치즈 크러스트 추가 (+2000)',
      'en': 'Add Cheese Crust (+2000)',
      'ja': 'チーズクラストを追加（+2000）',
      'zh_Hans': '添加奶酪皮（+2000）',
    },
    'bokot7h5': {
      'ko': '콜라 추가(1.5L) (+2000)',
      'en': 'Add Coke (1.5L) (+2000)',
      'ja': 'コーラ追加(1.5L) (+2000)',
      'zh_Hans': '添加可乐（1.5L）（+2000）',
    },
    'd2l0dqiu': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // pizza3
  {
    'mox5hkw5': {
      'ko': '조리시간 약 15분',
      'en': 'Cooking time: about 15 minutes',
      'ja': '調理時間約15分',
      'zh_Hans': '烹饪时间约15分钟',
    },
    'a5i0y340': {
      'ko': '달콤한 고구마와 풍성한 맛의 치즈가 어우러져 내는 환상의 풍미',
      'en':
          'A fantastic flavor created by the combination of sweet sweet potatoes and rich cheese.',
      'ja': '甘いサツマイモと豊かな味のチーズが調和する幻の味',
      'zh_Hans': '结合了红薯和浓郁奶酪的美妙风味。',
    },
    'obq0a49z': {
      'ko': '주재료: 치즈, 고구마,햄',
      'en': 'Main ingredients: cheese, sweet potato, ham',
      'ja': '主材料：チーズ、サツマイモ、ハム',
      'zh_Hans': '主要原料：奶酪、红薯、火腿',
    },
    'ku6euhnz': {
      'ko': '\n원산지: 치즈(국내산)\n고구마(국내산)',
      'en': 'Origin: Cheese (domestic) Sweet Potato (domestic)',
      'ja': '原産地：チーズ（国内産）\nさつまいも（国内産）',
      'zh_Hans': '原产国：奶酪（国内）\n红薯（国产）',
    },
    'bqg9rjuh': {
      'ko': '피클 추가',
      'en': 'Add pickles',
      'ja': 'ピクルスを追加',
      'zh_Hans': '添加泡菜',
    },
    '6nlng2l7': {
      'ko': '핫소스 추가 (+500)',
      'en': 'Add Hot Sauce (+500)',
      'ja': 'ホットソースを追加（+500）',
      'zh_Hans': '添加辣酱（+500）',
    },
    'ox1amx50': {
      'ko': '치즈볼 (+4000)',
      'en': 'Cheese Ball (+4000)',
      'ja': 'チーズボール（+4000）',
      'zh_Hans': '芝士球 (+4000)',
    },
    'v9jkeybs': {
      'ko': '치즈 크러스트 추가 (+2000)',
      'en': 'Add Cheese Crust (+2000)',
      'ja': 'チーズクラストを追加（+2000）',
      'zh_Hans': '添加奶酪皮（+2000）',
    },
    '97nqscji': {
      'ko': '콜라 추가(1.5L) (+2000)',
      'en': 'Add Coke (1.5L) (+2000)',
      'ja': 'コーラ追加(1.5L) (+2000)',
      'zh_Hans': '添加可乐（1.5L）（+2000）',
    },
    'fel2plri': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // juicemenu
  {
    'titzixti': {
      'ko': 'Page Title',
      'en': 'Page Title',
      'ja': 'ページタイトル',
      'zh_Hans': '页面标题',
    },
    'e5ww6b1f': {
      'ko': '딸기주스 5.0',
      'en': 'Strawberry juice 5.0',
      'ja': 'イチゴジュース5.0',
      'zh_Hans': '草莓汁5.0',
    },
    'jp8yqth0': {
      'ko': '키위주스 5.0',
      'en': 'Kiwi Juice 5.0',
      'ja': 'キウイジュース5.0',
      'zh_Hans': '猕猴桃汁5.0',
    },
    '5vgbpr44': {
      'ko': '토마토주스 5.0',
      'en': 'Tomato juice 5.0',
      'ja': 'トマトジュース5.0',
      'zh_Hans': '番茄汁5.0',
    },
    'kqfpu2xm': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // tatoyakimenu
  {
    'cnkdncaz': {
      'ko': 'Page Title',
      'en': 'Page Title',
      'ja': 'ページタイトル',
      'zh_Hans': '页面标题',
    },
    'h69xvj6x': {
      'ko': '오리지날 타코야끼 4.5',
      'en': 'Original Takoyaki 4.5',
      'ja': 'オリジナルたこ焼き4.5',
      'zh_Hans': '原味章鱼烧 4.5',
    },
    'p8u9tqtk': {
      'ko': '매콤파타코 타코야끼4.5',
      'en': 'Spicy Pataco Takoyaki 4.5',
      'ja': 'マコムパタコたこ焼き4.5',
      'zh_Hans': '麻辣帕塔科章鱼烧 4.5',
    },
    'mezktcuw': {
      'ko': '명란파타코 타코야끼 4.5',
      'en': 'Mentaiko Patako Takoyaki 4.5',
      'ja': '明太子パタコたこ焼き4.5',
      'zh_Hans': '明太鱼子章鱼烧 4.5',
    },
    'm98574vv': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // maratangmenu
  {
    'fujtjmcb': {
      'ko': 'Page Title',
      'en': 'Page Title',
      'ja': 'ページタイトル',
      'zh_Hans': '页面标题',
    },
    'negc7lt6': {
      'ko': '마라탕 7.0',
      'en': 'Mala Tang 7.0',
      'ja': 'マラタン7.0',
      'zh_Hans': '马拉唐7.0',
    },
    'umubpvho': {
      'ko': '마라샹궈  7.0',
      'en': 'Mala Xiang Guo 7.0',
      'ja': 'マラシャンガル7.0',
      'zh_Hans': '马拉鲜果7.0',
    },
    '8szv0qi3': {
      'ko': '꿔바로우 7.0',
      'en': 'Kua Ba Rou 7.0',
      'ja': 'グンバロー7.0',
      'zh_Hans': '夸巴鲁7.0',
    },
    'eu1rskl8': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // tatoyaki3
  {
    'zgjxassu': {
      'ko': '조리시간 약 15분',
      'en': 'Cooking time: about 15 minutes',
      'ja': '調理時間約15分',
      'zh_Hans': '烹饪时间约15分钟',
    },
    'bmwacbne': {
      'ko': '일반 치즈 시즈닝이 들어간 얇은 밀가루 반죽 안에 도톰한 문어 다리 2개가 들어가 입에서 살살 녹는 타코야끼 ',
      'en':
          'Takoyaki that melts in your mouth with two thick octopus legs in a thin flour batter with regular cheese seasoning',
      'ja': '一般チーズシーズニングが入った薄い小麦粉生地の中にドトムハンタコ足2本が入って口からサルサル溶けるたこ焼き',
      'zh_Hans': '章鱼烧入口即化，两条厚厚的章鱼腿被薄薄的面粉面团包裹着，并撒上普通的奶酪调味料。',
    },
    '0ubbzhva': {
      'ko': '주재료: 문어, 밀가루, 체다치즈 시즈닝',
      'en': 'Main ingredients: octopus, flour, cheddar cheese seasoning',
      'ja': '主材料：タコ、小麦粉、チェダーチーズシーズニング',
      'zh_Hans': '主要原料：章鱼、面粉、切达干酪调味料',
    },
    'vjm85a0f': {
      'ko': '원산지:문어(국내산), 치즈(영국),\n밀가루(국내산)',
      'en': 'Origin: Octopus (domestic), Cheese (UK), Flour (domestic)',
      'ja': '原産地：タコ（国内産）、チーズ（イギリス）、\n小麦粉（国内産）',
      'zh_Hans': '原产国：章鱼（国内）、奶酪（英国）、\n面粉（国产）',
    },
    'qxrhdnip': {
      'ko': '가쓰오부시 추가 (+500)',
      'en': 'Add Katsuobushi (+500)',
      'ja': 'かつおぶし追加(+500)',
      'zh_Hans': '添加鲣鱼（+500）',
    },
    'mrtnac07': {
      'ko': '4알 추가 (+4000)',
      'en': 'Add 4 eggs (+4000)',
      'ja': '4粒追加（+4000）',
      'zh_Hans': '添加4个鸡蛋（+4000）',
    },
    'x09evh4e': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // tatoyaki1
  {
    'b7tsxaff': {
      'ko': '조리시간 약 15분',
      'en': 'Cooking time: about 15 minutes',
      'ja': '調理時間約15分',
      'zh_Hans': '烹饪时间约15分钟',
    },
    '1pxq0wsh': {
      'ko': ' 얇은 밀가루 반죽 안에 도톰한 문어 다리 2개가 들어가 입에서 살살 녹는 타코야끼 ',
      'en':
          'Takoyaki that melts in your mouth with two thick octopus legs inside a thin wheat flour dough',
      'ja': '薄い小麦粉生地の中にドトムハンタコ足2本が入って口からサルサル溶けるたこ焼き',
      'zh_Hans': '章鱼烧，两条粗章鱼腿，裹着薄薄的面糊，入口即化',
    },
    'rxtp74w4': {
      'ko': '주재료: 문어, 밀가루, 체다치즈 시즈닝',
      'en': 'Main ingredients: octopus, flour, cheddar cheese seasoning',
      'ja': '主材料：タコ、小麦粉、チェダーチーズシーズニング',
      'zh_Hans': '主要原料：章鱼、面粉、切达干酪调味料',
    },
    'yx7j9q0x': {
      'ko': '\n원산지:문어(국내산), 데리야끼 소스(일본),\n밀가루(국내산)',
      'en':
          'Origin: Octopus (domestic), Teriyaki sauce (Japan), Flour (domestic)',
      'ja': '原産地：タコ（国内産）、照り焼きソース（日本）、\n小麦粉（国内産）',
      'zh_Hans': '原产地：章鱼（国内）、照烧酱（日本）、\n面粉（国产）',
    },
    'f15i61bn': {
      'ko': '가쓰오부시 추가 (+500)',
      'en': 'Add Katsuobushi (+500)',
      'ja': 'かつおぶし追加(+500)',
      'zh_Hans': '添加鲣鱼（+500）',
    },
    '8mruroyl': {
      'ko': '4알 추가 (+4000)',
      'en': 'Add 4 eggs (+4000)',
      'ja': '4粒追加（+4000）',
      'zh_Hans': '添加4个鸡蛋（+4000）',
    },
    'ebuk9wip': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // tatoyaki2
  {
    'lmc5998i': {
      'ko': '조리시간 약 15분',
      'en': 'Cooking time: about 15 minutes',
      'ja': '調理時間約15分',
      'zh_Hans': '烹饪时间约15分钟',
    },
    'r74miwfs': {
      'ko': ' 얇은 밀가루 반죽 안에 도톰한 문어 다리 2개가 들어가 입에서 살살 녹는 타코야끼 ',
      'en':
          'Takoyaki that melts in your mouth with two thick octopus legs inside a thin wheat flour dough',
      'ja': '薄い小麦粉生地の中にドトムハンタコ足2本が入って口からサルサル溶けるたこ焼き',
      'zh_Hans': '章鱼烧，两条粗章鱼腿，裹着薄薄的面糊，入口即化',
    },
    'yy51rj37': {
      'ko': '주재료: 문어, 밀가루, 체다치즈 시즈닝',
      'en': 'Main ingredients: octopus, flour, cheddar cheese seasoning',
      'ja': '主材料：タコ、小麦粉、チェダーチーズシーズニング',
      'zh_Hans': '主要原料：章鱼、面粉、切达干酪调味料',
    },
    'cg909b2d': {
      'ko': '원산지:문어(국내산), 치즈(영국),\n밀가루(국내산)',
      'en': 'Origin: Octopus (domestic), Cheese (UK), Flour (domestic)',
      'ja': '原産地：タコ（国内産）、チーズ（イギリス）、\n小麦粉（国内産）',
      'zh_Hans': '原产国：章鱼（国内）、奶酪（英国）、\n面粉（国产）',
    },
    'gag4f4pu': {
      'ko': '가쓰오부시 추가 (+500)',
      'en': 'Add Katsuobushi (+500)',
      'ja': 'かつおぶし追加(+500)',
      'zh_Hans': '添加鲣鱼（+500）',
    },
    'md8ga3r1': {
      'ko': '4알 추가 (+4000)',
      'en': 'Add 4 eggs (+4000)',
      'ja': '4粒追加（+4000）',
      'zh_Hans': '添加4个鸡蛋（+4000）',
    },
    'bkpk8koa': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // maratang1
  {
    '7mzjx5ay': {
      'ko': '조리시간 약 15분',
      'en': 'Cooking time: about 15 minutes',
      'ja': '調理時間約15分',
      'zh_Hans': '烹饪时间约15分钟',
    },
    '131ya1b1': {
      'ko': '얼얼하고 매운 중독성 강한 매력',
      'en': 'A cold and spicy addictive charm',
      'ja': '冷ややかで中毒性の強い魅力',
      'zh_Hans': '麻辣鲜香，令人上瘾的魅力',
    },
    'lkxdpi94': {
      'ko':
          '들어가는 재료:  사골육수 숙주, 중국당면, 건두부, 푸주, 알배기, 청경채 , 팽이or느타리or새송이(당일 신선 우선), 백 목이, 스모크햄(2),유부(4) (고기, 고수, 공기밥 별도) 고기',
      'en':
          'Ingredients: beef bone broth, Chinese noodles, dried tofu, pu-ju, cabbage, bok choy, enoki mushrooms or oyster mushrooms or shiitake mushrooms (fresh from the day is preferred), white croaker, smoked ham (2), tofu (4) (meat, coriander, rice sold separately) Meat',
      'ja':
          '入る材料：砂骨スープ宿主、中国当面、ガンドゥブ、プジュ、アルベギ、チョンギョンチェ、コムギorノタor鳥松（当日新鮮優先）、白喉、スモークハム（2）、油部（4）（肉、コリアンダー、エアーバブ) 肉',
      'zh_Hans':
          '材料：牛骨汤，粉丝，豆腐干，豆腐，鱼子，白菜，顶级或蚝或王蚝（当天新鲜优先），白颈耳，熏火腿（2），炸豆腐（4）（肉） , 香菜, 米饭分开) ) 肉',
    },
    'nj520ap7': {
      'ko': '원산지: 마라소스(중국산)\n고기:(국내산)\n버섯:(국내산)',
      'en':
          'Origin: Marasauce (Chinese)\nMeat: (Domestic)\nMushrooms: (Domestic)',
      'ja': '原産地：マラソス（中国産）\n肉：（国内産）\nきのこ：（国内産）',
      'zh_Hans': '原产地：马拉酱（中国制造）\n肉类：（国内）\n蘑菇：（国产）',
    },
    '3ei5ek3u': {
      'ko': '고기추가 (+4000)',
      'en': 'Add meat (+4000)',
      'ja': '肉を追加（+4000）',
      'zh_Hans': '添加肉类（+4000）',
    },
    'xc50t7d3': {
      'ko': '순한맛',
      'en': 'Mild taste',
      'ja': 'まろやかな味',
      'zh_Hans': '味道温和',
    },
    '4eaq54wg': {
      'ko': '중간맛',
      'en': 'Medium flavor',
      'ja': '中味',
      'zh_Hans': '中等味道',
    },
    '4ex9o4ci': {
      'ko': '매운맛',
      'en': 'Spicy',
      'ja': '辛い味',
      'zh_Hans': '辛辣的',
    },
    'hziev6n6': {
      'ko': 'L(3~4인분) (+10000)',
      'en': 'L (for 3~4 people) (+10000)',
      'ja': 'L（3～4人前）（+10000）',
      'zh_Hans': 'L（3-4 份）（+10000）',
    },
    'pkw9lgdj': {
      'ko': 'M(2~3인분) (+5000)',
      'en': 'M (2~3 servings) (+5000)',
      'ja': 'M(2～3人前) (+5000)',
      'zh_Hans': 'M（2-3 份）（+5000）',
    },
    'g7a3l6q8': {
      'ko': 'S (1~2인분)',
      'en': 'S (serves 1~2)',
      'ja': 'S（1～2人前）',
      'zh_Hans': '小号（1-2 份）',
    },
    '88nzwzel': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // maratang2
  {
    'ami7qwfl': {
      'ko': '조리시간 약 15분',
      'en': 'Cooking time: about 15 minutes',
      'ja': '調理時間約15分',
      'zh_Hans': '烹饪时间约15分钟',
    },
    '2e6qixkv': {
      'ko': '얼얼하고 매운 중독성 강한 매력',
      'en': 'A cold and spicy addictive charm',
      'ja': '冷ややかで中毒性の強い魅力',
      'zh_Hans': '麻辣鲜香，令人上瘾的魅力',
    },
    '25yp5l28': {
      'ko': '얼얼한 마라맛과 다양한 재료가 어우러져 한입 먹는 순간 헤븐으로 초대합니다',
      'en':
          'The refreshing taste of Mara and the various ingredients combine to invite you to heaven the moment you take a bite.',
      'ja': '冷たいマラ味と様々な食材が調和し、一口食べる瞬間ヘブンに招待します',
      'zh_Hans': '马拉拉的辛辣味道和各种成分相结合，让您在咬一口的那一刻就进入了天堂。',
    },
    'f8p6ophe': {
      'ko': '원산지: 마라소스(중국산)\n고기:(국내산)\n버섯:(국내산)',
      'en':
          'Origin: Marasauce (Chinese)\nMeat: (Domestic)\nMushrooms: (Domestic)',
      'ja': '原産地：マラソス（中国産）\n肉：（国内産）\nきのこ：（国内産）',
      'zh_Hans': '原产地：马拉酱（中国制造）\n肉类：（国内）\n蘑菇：（国产）',
    },
    'hbknxd0d': {
      'ko': '순한맛',
      'en': 'Mild taste',
      'ja': 'まろやかな味',
      'zh_Hans': '味道温和',
    },
    'gbovtqhw': {
      'ko': '중간맛',
      'en': 'Medium flavor',
      'ja': '中味',
      'zh_Hans': '中等味道',
    },
    '5n4x9rrs': {
      'ko': '매운맛',
      'en': 'Spicy',
      'ja': '辛い味',
      'zh_Hans': '辛辣的',
    },
    '6a7douy0': {
      'ko': 'L(3~4인분) (+10000)',
      'en': 'L (for 3~4 people) (+10000)',
      'ja': 'L（3～4人前）（+10000）',
      'zh_Hans': 'L（3-4 份）（+10000）',
    },
    'bo7a41d7': {
      'ko': 'M(2~3인분) (+5000)',
      'en': 'M (2~3 servings) (+5000)',
      'ja': 'M(2～3人前) (+5000)',
      'zh_Hans': 'M（2-3 份）（+5000）',
    },
    'yplmo0fw': {
      'ko': 'S (1~2인분)',
      'en': 'S (serves 1~2)',
      'ja': 'S（1～2人前）',
      'zh_Hans': '小号（1-2 份）',
    },
    'k017ozn6': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // maratang3
  {
    'x024r05t': {
      'ko': '조리시간 약 15분',
      'en': 'Cooking time: about 15 minutes',
      'ja': '調理時間約15分',
      'zh_Hans': '烹饪时间约15分钟',
    },
    'op5tfcq1': {
      'ko': '바삭하고  소스로 인한 새콤달콤 튀김요리',
      'en': 'Crispy and sweet and sour fried food with sauce',
      'ja': 'サクサクとソースによる甘酸っぱい揚げ物',
      'zh_Hans': '酥脆酸甜的油炸食品',
    },
    '2gvyeoo8': {
      'ko': '\n주재료:  고기,감자전분',
      'en': 'Main ingredients: meat, potato starch',
      'ja': '主材料：肉、ジャガイモ澱粉',
      'zh_Hans': '主要成分：肉、马铃薯淀粉',
    },
    '469tthys': {
      'ko': '원산지:고기:(국내산)\n감자전분:(국내산)',
      'en': 'Origin: Meat: (domestic) Potato starch: (domestic)',
      'ja': '原産地：肉：（国内産）\nじゃがいも澱粉：（国内産）',
      'zh_Hans': '原产国： 肉类：（国内）\n马铃薯淀粉：（国产）',
    },
    '3hpbv1g5': {
      'ko': '순한맛',
      'en': 'Mild taste',
      'ja': 'まろやかな味',
      'zh_Hans': '味道温和',
    },
    's1c9h9ke': {
      'ko': '중간맛',
      'en': 'Medium flavor',
      'ja': '中味',
      'zh_Hans': '中等味道',
    },
    'u5nv4yfs': {
      'ko': '매운맛',
      'en': 'Spicy',
      'ja': '辛い味',
      'zh_Hans': '辛辣的',
    },
    '9ci54vta': {
      'ko': 'L(3~4인분) (+10000)',
      'en': 'L (for 3~4 people) (+10000)',
      'ja': 'L（3～4人前）（+10000）',
      'zh_Hans': 'L（3-4 份）（+10000）',
    },
    'qs60yaoo': {
      'ko': 'M(2~3인분) (+5000)',
      'en': 'M (2~3 servings) (+5000)',
      'ja': 'M(2～3人前) (+5000)',
      'zh_Hans': 'M（2-3 份）（+5000）',
    },
    '4gqu31zb': {
      'ko': 'S (1~2인분)',
      'en': 'S (serves 1~2)',
      'ja': 'S（1～2人前）',
      'zh_Hans': '小号（1-2 份）',
    },
    'jrt3zq0f': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // maratanghome
  {
    'bd0qasj0': {
      'ko': '마라탕',
      'en': 'Mala Tang',
      'ja': 'マラタン',
      'zh_Hans': '麻辣烫',
    },
    'ojxd5xa6': {
      'ko': '푸드트럭 소개',
      'en': 'Food Truck Introduction',
      'ja': 'フードトラック紹介',
      'zh_Hans': '餐车介绍',
    },
    '03qv7pch': {
      'ko': '맛있게 매운 마라 메뉴들과 함께합니다',
      'en': 'With deliciously spicy Mala menus',
      'ja': 'おいしくスパイシーなマラメニューと一緒に',
      'zh_Hans': '我们提供美味和辛辣的马拉菜单。',
    },
    'sxrgpj3a': {
      'ko': '8.6km',
      'en': '8.6km',
      'ja': '8.6km',
      'zh_Hans': '8.6公里',
    },
    'otr3pg65': {
      'ko': '전화 : 041-0000-0000',
      'en': 'Phone: 041-0000-0000',
      'ja': '電話番号：041-0000-0000',
      'zh_Hans': '电话：041-0000-0000',
    },
    'ckb3a2b1': {
      'ko': '메뉴 보기',
      'en': 'View menu',
      'ja': 'メニューを見る',
      'zh_Hans': '查看菜单',
    },
    'yrnfg0mo': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // tacoyakkihome
  {
    '0e98ig25': {
      'ko': '마라 타코야끼',
      'en': 'Spicy Takoyaki',
      'ja': 'マラタコヤキ',
      'zh_Hans': '玛拉章鱼烧',
    },
    'srky3cok': {
      'ko': '푸드트럭 소개',
      'en': 'Food Truck Introduction',
      'ja': 'フードトラック紹介',
      'zh_Hans': '餐车介绍',
    },
    '3y41tzsg': {
      'ko': '얼큰한  마라와 타코야끼의 맛없을 수 없는 조합.',
      'en': 'The irresistible combination of spicy mala and takoyaki.',
      'ja': 'オルクなマラとたこ焼きの味わえない組み合わせ。',
      'zh_Hans': '辛辣的海员酱和章鱼烧的令人难以抗拒的组合。',
    },
    'vtxivg1x': {
      'ko': '6.3km',
      'en': '6.3km',
      'ja': '6.3km',
      'zh_Hans': '6.3公里',
    },
    'ybr8gg2b': {
      'ko': '전화 : 041-0000-0000',
      'en': 'Phone: 041-0000-0000',
      'ja': '電話番号：041-0000-0000',
      'zh_Hans': '电话：041-0000-0000',
    },
    'tsuouk5s': {
      'ko': '메뉴 보기',
      'en': 'View menu',
      'ja': 'メニューを見る',
      'zh_Hans': '查看菜单',
    },
    'zcnryvnu': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // juicehome
  {
    'fwmfnnqq': {
      'ko': '생과일 주스',
      'en': 'Fresh fruit juice',
      'ja': '生フルーツジュース',
      'zh_Hans': '新鲜果汁',
    },
    '7z8m1fx6': {
      'ko': '푸드트럭 소개',
      'en': 'Food Truck Introduction',
      'ja': 'フードトラック紹介',
      'zh_Hans': '餐车介绍',
    },
    'jrw1kiiu': {
      'ko': '신선한 생과일로 만든 fresh한 주스 팝니다',
      'en': 'We sell fresh juice made from fresh fruit.',
      'ja': '新鮮な果物で作られたフレッシュジュースがポップします',
      'zh_Hans': '我们出售由新鲜水果制成的新鲜果汁。',
    },
    '5s1xbqsk': {
      'ko': '4.6km',
      'en': '4.6km',
      'ja': '4.6km',
      'zh_Hans': '4.6公里',
    },
    'qqdqdhj9': {
      'ko': '전화 : 041-0000-0000',
      'en': 'Phone: 041-0000-0000',
      'ja': '電話番号：041-0000-0000',
      'zh_Hans': '电话：041-0000-0000',
    },
    'vl1rf1qc': {
      'ko': '메뉴 보기',
      'en': 'View menu',
      'ja': 'メニューを見る',
      'zh_Hans': '查看菜单',
    },
    'xn94vy1b': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // AlramSetting
  {
    'v3tkon1h': {
      'ko': '알림',
      'en': 'alarm',
      'ja': 'お知らせ',
      'zh_Hans': '警报',
    },
    'i0lht122': {
      'ko': '선택하신 푸드트럭이 해당 지역에 도착하면 \n알려드려요',
      'en':
          'We will notify you when the food truck you selected arrives in your area.',
      'ja': '選択したフードトラックがその地域に到着した場合 \nお知らせします',
      'zh_Hans': '当您选择的餐车到达您所在地区时 \n让我告诉你',
    },
    't4ptrc1z': {
      'ko': '이벤트 혜택 알림',
      'en': 'Event Benefit Notification',
      'ja': 'イベント特典のお知らせ',
      'zh_Hans': '活动福利通知',
    },
    '2onnvzge': {
      'ko': '광고성 정보 수신 동의에 의한 쿠폰 등 헤택 알림',
      'en':
          'Notification of benefits such as coupons based on consent to receive promotional information',
      'ja': '広告性情報受信同意によるクーポン等のヘッジ通知',
      'zh_Hans': '基于同意接收广告信息的优惠券等优惠通知',
    },
    '6vsyfavh': {
      'ko': '알림설정',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'zhcov50n': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // CustomerInfor
  {
    'iyiyn633': {
      'ko': '이름',
      'en': 'name',
      'ja': '名前',
      'zh_Hans': '姓名',
    },
    'who2y36l': {
      'ko': 'Name',
      'en': 'Name',
      'ja': '名前',
      'zh_Hans': '姓名',
    },
    '804tqk52': {
      'ko': '전화번호',
      'en': 'phone number',
      'ja': '電話番号',
      'zh_Hans': '电话号码',
    },
    'ldal5q5k': {
      'ko': 'Phone Call',
      'en': 'Phone Call',
      'ja': 'Phone Call',
      'zh_Hans': '电话',
    },
    'r5nbdc10': {
      'ko': '이메일',
      'en': 'email',
      'ja': 'Eメール',
      'zh_Hans': '电子邮件',
    },
    '8v9w274n': {
      'ko': 'E-mail',
      'en': 'E-mail',
      'ja': 'E-mail',
      'zh_Hans': '电子邮件',
    },
    'cxdzp95o': {
      'ko': '비밀번호',
      'en': 'password',
      'ja': 'パスワード',
      'zh_Hans': '密码',
    },
    '9alpbi6e': {
      'ko': 'Password',
      'en': 'Password',
      'ja': 'パスワード',
      'zh_Hans': '密码',
    },
    'qrsncl92': {
      'ko': '거주지',
      'en': 'residence',
      'ja': '居住地',
      'zh_Hans': '住宅',
    },
    'xrrobnyp': {
      'ko': 'Residence',
      'en': 'Residence',
      'ja': 'Residence',
      'zh_Hans': '住宅',
    },
    '1xsl50wr': {
      'ko': '저장하기',
      'en': 'Save',
      'ja': '保存する',
      'zh_Hans': '节省',
    },
    'm8yz1sno': {
      'ko': '회원정보 수정하기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'rumaxbp0': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // MarketingAgree
  {
    'aj4usjy1': {
      'ko': '개인정보 활용\n및 마케팅 정보 수신',
      'en': 'Use of personal information and receipt of marketing information',
      'ja': '個人情報の活用\nそしてマーケティング情報を受け取る',
      'zh_Hans': '个人信息的使用\n并接收营销信息。',
    },
    'x0tg2mi7': {
      'ko': '개인정보 활용 및 마케팅 정보 수 동의',
      'en':
          'Consent to use personal information and receive marketing information',
      'ja': '個人情報の活用とマーケティング情報の同意',
      'zh_Hans': '同意使用个人信息和营销信息',
    },
    'aidhirvp': {
      'ko': '개인정보 활용 및 마케팅 정보 수신',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'mv9b4dpb': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // Language
  {
    'm8naw2a9': {
      'ko': '언어 바꾸기',
      'en': 'Change language',
      'ja': '言語の変更',
      'zh_Hans': '改变语言',
    },
    '7uqdmzxq': {
      'ko': '한국어',
      'en': 'korean',
      'ja': '韓国語',
      'zh_Hans': '韩国人',
    },
    'm771pl8t': {
      'ko': 'English',
      'en': 'English',
      'ja': 'English',
      'zh_Hans': '英语',
    },
    'issmds90': {
      'ko': '日本語',
      'en': 'Japanese',
      'ja': '日本語',
      'zh_Hans': '日语',
    },
    'myrru8rb': {
      'ko': '简体中文',
      'en': 'Simplified Chinese',
      'ja': '简体中文',
      'zh_Hans': '中文文本',
    },
    'o4k9xqit': {
      'ko': 'Language',
      'en': 'Language',
      'ja': 'Language',
      'zh_Hans': '语言',
    },
    'y2scf6pg': {
      'ko': 'Search for an item...',
      'en': 'Search for an item...',
      'ja': 'Search for an item...',
      'zh_Hans': '搜索一个项目...',
    },
    'yly6qv66': {
      'ko': '언어',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'cusayjr2': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // report
  {
    '7e94cm70': {
      'ko': '신고내용',
      'en': 'Report contents',
      'ja': '報告内容',
      'zh_Hans': '报告详情',
    },
    'ixhebn9n': {
      'ko': '입력하기',
      'en': 'Enter',
      'ja': '入力する',
      'zh_Hans': '进入',
    },
    'f5vc5fbs': {
      'ko': '신고',
      'en': 'Declaration',
      'ja': '報告',
      'zh_Hans': '宣言',
    },
    '28rlpp2r': {
      'ko': '문제 신고',
      'en': 'Report a problem',
      'ja': '問題の報告',
      'zh_Hans': '报告一个问题',
    },
    'a7use0r0': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // accountInfor
  {
    'sj665nr1': {
      'ko': '계정 정보',
      'en': 'Account Information',
      'ja': 'アカウント情報',
      'zh_Hans': '帐户信息',
    },
    'p42x1orm': {
      'ko': '가입한 날짜',
      'en': 'Date of subscription function',
      'ja': '参加した日付機能',
      'zh_Hans': '加入日期函数',
    },
    'fvf94m9d': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // etreInfor
  {
    'c5jufgdb': {
      'ko':
          'Dream School, ICN\n\nCEO: Jesus\n\n321 Yeongjeon 1-gil, Daesan-eup, Seosan-si, Chungcheongnam-do, Korea\n\nCall: 041.681.3411',
      'en':
          'Dream School, ICN CEO: Jesus 321 Yeongjeon 1-gil, Daesan-eup, Seosan-si, Chungcheongnam-do, Korea Call: 041.681.3411',
      'ja':
          'Dream School, ICN\n\nCEO：Jesus\n\n321 Yeongjeon 1-gil, Daesan-eup, Seosan-si, Chungcheongnam-do, Korea\n\nCall: 041.681.3411',
      'zh_Hans': '梦想学校，ICN\n\n首席执行官：耶稣\n\n忠清南道瑞山市大山邑永田1街321\n\n电话：041.681.3411',
    },
    '4c2ohl5a': {
      'ko': '사업자 정보',
      'en': 'Business Information',
      'ja': '事業者情報',
      'zh_Hans': '商业信息',
    },
    '01ee08r9': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // location
  {
    'hf4lxh3z': {
      'ko': '현재 위치',
      'en': 'Current location',
      'ja': '現在位置',
      'zh_Hans': '当前位置',
    },
    '82x4dbh6': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // profileEdit
  {
    '0xtj3v0j': {
      'ko': 'ID',
      'en': 'ID',
      'ja': 'ID',
      'zh_Hans': 'ID',
    },
    '4ztsiube': {
      'ko': 'Type here!',
      'en': 'Type here!',
      'ja': 'Type here!',
      'zh_Hans': '在此输入！',
    },
    'tci7erj8': {
      'ko': '저장하기',
      'en': 'Save',
      'ja': '保存する',
      'zh_Hans': '节省',
    },
    'r4zqy3kd': {
      'ko': '프로필 수정',
      'en': 'Edit Profile',
      'ja': 'プロフィールを編集',
      'zh_Hans': '编辑个人资料',
    },
    'lxw7vzb4': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // homepage
  {
    'ie00ke6e': {
      'ko': '영탑리',
      'en': 'Yeongtap-ri',
      'ja': 'ヨンタプリー',
      'zh_Hans': '永塔普里',
    },
    'xbyfg24d': {
      'ko': '푸드트럭을 찾아보세요!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'c5qqdnt0': {
      'ko': '푸드트럭 \n부르기',
      'en': 'Food Truck\nCall',
      'ja': 'フードトラック \n呼ぶ',
      'zh_Hans': '食物餐车 \n呼叫',
    },
    'q1gwtdi6': {
      'ko': '원하는 푸드트럭을\n우리 동네로',
      'en': 'Bring your favorite food truck to our neighborhood.',
      'ja': '好きなフードトラック\n私たちの近所',
      'zh_Hans': '你想要的餐车\n到我家附近',
    },
    'xsw5qcjt': {
      'ko': '내 주변 \n트럭 찾기',
      'en': 'Find Trucks Near Me',
      'ja': '私の周り \nトラックを探す',
      'zh_Hans': '我周围 \n寻找卡车',
    },
    'e6bvsihv': {
      'ko': '가까운 곳에서\n소소한 행복을',
      'en': 'Small happiness nearby',
      'ja': '近くで\nささいな幸せ',
      'zh_Hans': '附近\n小幸福',
    },
    '49qk7j7m': {
      'ko': '메뉴별 트럭',
      'en': 'Truck by menu',
      'ja': 'メニュー別トラック',
      'zh_Hans': '卡车按菜单',
    },
    '60vgrse5': {
      'ko': '치킨',
      'en': 'chicken',
      'ja': 'チキン',
      'zh_Hans': '鸡',
    },
    'rvm0sr2l': {
      'ko': '피자',
      'en': 'pizza',
      'ja': 'ピザ',
      'zh_Hans': '比萨',
    },
    'g599rfy8': {
      'ko': '분식',
      'en': 'snack bar',
      'ja': '分食',
      'zh_Hans': '小吃店',
    },
    '0rir7g1o': {
      'ko': '한식',
      'en': 'Cup rice',
      'ja': 'カップボップ',
      'zh_Hans': '杯饭',
    },
    'mb9oqtey': {
      'ko': '핫도그',
      'en': 'Hotdog',
      'ja': 'ホットドッグ',
      'zh_Hans': '热狗',
    },
    'a25lenf5': {
      'ko': '중식',
      'en': 'Chinese food',
      'ja': '昼食',
      'zh_Hans': '中国菜',
    },
    'gtzul5bt': {
      'ko': '음료',
      'en': 'beverage',
      'ja': '飲み物',
      'zh_Hans': '饮料',
    },
    '5ird6wkf': {
      'ko': '디저트',
      'en': 'dessert',
      'ja': 'デザート',
      'zh_Hans': '甜点',
    },
    '0xq80ub1': {
      'ko': '인기메뉴',
      'en': 'Popular menu',
      'ja': '人気メニュー',
      'zh_Hans': '热门菜单',
    },
    's05py90h': {
      'ko': '고구마 피자',
      'en': 'Sweet Potato Pizza',
      'ja': 'さつまいもピザ',
      'zh_Hans': '红薯披萨',
    },
    'xpno40ll': {
      'ko': '타코야끼',
      'en': 'Takoyaki',
      'ja': 'たこ焼き',
      'zh_Hans': '章鱼烧',
    },
    '4xlmk5za': {
      'ko': '마라탕후루룰ㄹ',
      'en': 'Mala Tang Hururul',
      'ja': 'マラタンフルルールㄹ',
      'zh_Hans': '马拉唐胡鲁鲁尔',
    },
    've9iiqgl': {
      'ko': '생딸기주스',
      'en': 'Fresh strawberry juice',
      'ja': '生いちごジュース',
      'zh_Hans': '新鲜草莓汁',
    },
    'aingrm4i': {
      'ko': '이달의 트럭 ',
      'en': 'Truck of the Month',
      'ja': '今月のトラック',
      'zh_Hans': '本月卡车',
    },
    'fmuyibd6': {
      'ko': '다인이네 화덕피자',
      'en': 'Dain\'s oven pizza',
      'ja': 'ダインです。',
      'zh_Hans': '戴恩的柴火披萨',
    },
    'cj4aowlp': {
      'ko': '다인이네 화덕피자',
      'en': 'Dain\'s Oven Pizza',
      'ja': 'ダインです。',
      'zh_Hans': '戴恩的燃木披萨',
    },
    '4iq92zmh': {
      'ko': 'weet',
      'en': 'Weet',
      'ja': 'weet',
      'zh_Hans': '威特',
    },
    '91dvbt2j': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // mytruck
  {
    'z806zj5x': {
      'ko': '내 트럭',
      'en': 'my truck',
      'ja': '私のトラック',
      'zh_Hans': '我的卡车',
    },
    'd2c6ibyn': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // logout2
  {
    'pf76jksb': {
      'ko': '로그아웃 하기',
      'en': 'Log out',
      'ja': 'ログアウトする',
      'zh_Hans': '登出',
    },
    'mozw6f18': {
      'ko': '예',
      'en': 'yes',
      'ja': 'はい',
      'zh_Hans': '是的',
    },
    'vv4wcvei': {
      'ko': '아니요',
      'en': 'no',
      'ja': 'いいえ',
      'zh_Hans': '不',
    },
    'uhu4sgiw': {
      'ko': '설정',
      'en': 'setting',
      'ja': '設定',
      'zh_Hans': '环境',
    },
    'y22anlhk': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // setting
  {
    'zf9vr1gk': {
      'ko': '설정',
      'en': 'setting',
      'ja': '設定',
      'zh_Hans': '环境',
    },
    '0shvjr3g': {
      'ko': '  알림',
      'en': 'alarm',
      'ja': 'お知らせ',
      'zh_Hans': '警报',
    },
    'itgmoz3e': {
      'ko': '  회원정보 수정',
      'en': 'Edit member information',
      'ja': '会員情報の修正',
      'zh_Hans': '编辑会员信息',
    },
    'gr92yh9e': {
      'ko': '  언어',
      'en': 'language',
      'ja': '言語',
      'zh_Hans': '语言',
    },
    'degrumba': {
      'ko': '  도움말',
      'en': 'Help',
      'ja': 'ヘルプ',
      'zh_Hans': '帮助',
    },
    '550c1mmg': {
      'ko': '  정보',
      'en': 'information',
      'ja': '情報',
      'zh_Hans': '信息',
    },
    'gcvvq4v4': {
      'ko': '  개인정보 활용 및 마케팅 정보 수신',
      'en': 'Use of personal information and receipt of marketing information',
      'ja': '個人情報の活用とマーケティング情報の受信',
      'zh_Hans': '个人信息的使用和营销信息的接收',
    },
    'stukxj4u': {
      'ko': '  로그아웃',
      'en': 'log out',
      'ja': 'ログアウト',
      'zh_Hans': '登出',
    },
    's7m8fcy9': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // InfromationCopy
  {
    'slrsukyo': {
      'ko': '  계정 정보',
      'en': 'Account Information',
      'ja': 'アカウント情報',
      'zh_Hans': '帐户信息',
    },
    'lxu24ay4': {
      'ko': '  사업자 정보',
      'en': 'Business Information',
      'ja': '事業者情報',
      'zh_Hans': '商业信息',
    },
    '3k6p01t4': {
      'ko': '정보',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '4u3gvsm7': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // helppingwords
  {
    'x6t1uo8r': {
      'ko': '  문제 신고',
      'en': 'Report a problem',
      'ja': '問題の報告',
      'zh_Hans': '报告一个问题',
    },
    '200skxjo': {
      'ko': '도움말',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '2brftnuk': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // MyPage
  {
    'edyczcap': {
      'ko': '나의 페이지',
      'en': 'My Page',
      'ja': '私のページ',
      'zh_Hans': '我的页面',
    },
    '4xis83vf': {
      'ko': 'User Name',
      'en': 'User Name',
      'ja': 'ユーザー名',
      'zh_Hans': '用户名',
    },
    'utwcue8f': {
      'ko': '님',
      'en': 'sir',
      'ja': 'ニム',
      'zh_Hans': '先生',
    },
    'fld8i96z': {
      'ko': '내 위치 설정하기',
      'en': 'Set my location',
      'ja': '自分の位置を設定する',
      'zh_Hans': '设置您的位置',
    },
    '6bwzthp7': {
      'ko': '내 활동',
      'en': 'My activities',
      'ja': '私の活動',
      'zh_Hans': '我的活动',
    },
    '9rn81v7z': {
      'ko': '내 트럭',
      'en': 'my truck',
      'ja': '私のトラック',
      'zh_Hans': '我的卡车',
    },
    'vej1g7f7': {
      'ko': '쿠폰함',
      'en': 'Coupon Box',
      'ja': 'クーポンボックス',
      'zh_Hans': '优惠券盒',
    },
    'h97rcwdy': {
      'ko': '투표 내용',
      'en': 'Voting content',
      'ja': '投票内容',
      'zh_Hans': '投票详情',
    },
    '436u06o8': {
      'ko': '정보',
      'en': 'information',
      'ja': '情報',
      'zh_Hans': '信息',
    },
    'ofs8xaxm': {
      'ko': '결제수단',
      'en': 'payment method',
      'ja': '決済手段',
      'zh_Hans': '付款方式',
    },
    'pfjro7j6': {
      'ko': '설정',
      'en': 'setting',
      'ja': '設定',
      'zh_Hans': '环境',
    },
    'r72hy1o1': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // pay1
  {
    'q76a3ar9': {
      'ko': '장바구니 주문하기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'jjy2qdzq': {
      'ko': 'Total',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '79jflqag': {
      'ko': '결제하기 ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '8n937546': {
      'ko': '장바구니',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'fc4nnuk5': {
      'ko': 'Home',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // pay2
  {
    'p56bs8cc': {
      'ko': '간편결제',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'k9iljh5g': {
      'ko': '카드결제',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'tl7b6o77': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // pay2-1
  {
    'a2bl0qcf': {
      'ko': '장바구니',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ryzb5449': {
      'ko': '                    간편결제',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ljqrt7ny': {
      'ko': '카카오페이',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'cc10yp3g': {
      'ko': 'toss pay 토스페이',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '01h4x0fx': {
      'ko': '결제하기 ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'egi030e4': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // pay2-2
  {
    'k7dbnp0v': {
      'ko': '                    카드결제',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'icqgpqqf': {
      'ko': '신한        ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'f8t83dtb': {
      'ko': '국민          ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '6sa6hjxz': {
      'ko': '농협',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'r6dizd5s': {
      'ko': '우리        ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'bl2vvzwd': {
      'ko': '비씨         ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'id69gzo3': {
      'ko': '하나',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'tf9sd3gc': {
      'ko': '결제하기 ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ghzj1bok': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // pay3
  {
    'ollisyyu': {
      'ko': '주문해 주셔서 감사합니다',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '8tggbyh5': {
      'ko': 'Go Home',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'j73plk95': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // searchingBar
  {
    'vq0ieax6': {
      'ko': '푸드트럭을 찾아보세요!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'kw9zwnd7': {
      'ko': '검색하기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'tsug5i69': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // hotdoghome
  {
    'fyrnbkhu': {
      'ko': '하림 핫도그',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '5obzgf97': {
      'ko': '푸드트럭 소개',
      'en': 'Food Truck Introduction',
      'ja': 'フードトラック紹介',
      'zh_Hans': '餐车介绍',
    },
    'c7i04arg': {
      'ko': '입에서 살살 녹는 소시지와 다양한 토핑으로 가득한 핫도그 가게',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '5gf56ty7': {
      'ko': '1.6km',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '2h330zqf': {
      'ko': '전화 : 041-0000-0000',
      'en': 'Phone: 041-0000-0000',
      'ja': '電話番号：041-0000-0000',
      'zh_Hans': '电话：041-0000-0000',
    },
    'bjn3sdm5': {
      'ko': '메뉴 보기',
      'en': 'View menu',
      'ja': 'メニューを見る',
      'zh_Hans': '查看菜单',
    },
    'yp54yei3': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // chickhome
  {
    'xv8ol8pi': {
      'ko': '치킨로드',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'y5ltyyof': {
      'ko': '푸드트럭 소개',
      'en': 'Food Truck Introduction',
      'ja': 'フードトラック紹介',
      'zh_Hans': '餐车介绍',
    },
    'l5elox59': {
      'ko': '바삭하고 육즙 가득한 치킨을 푸드트럭에서 신속하게 즐기세요!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ifhf4hxd': {
      'ko': '3.9km',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '4mc1xrvf': {
      'ko': '전화 : 041-0000-0000',
      'en': 'Phone: 041-0000-0000',
      'ja': '電話番号：041-0000-0000',
      'zh_Hans': '电话：041-0000-0000',
    },
    '9g5gvhzw': {
      'ko': '메뉴 보기',
      'en': 'View menu',
      'ja': 'メニューを見る',
      'zh_Hans': '查看菜单',
    },
    'qjkjye4e': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // bunsickhome
  {
    '44gpaypv': {
      'ko': '한쌈더분식',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'jys6jt8l': {
      'ko': '푸드트럭 소개',
      'en': 'Food Truck Introduction',
      'ja': 'フードトラック紹介',
      'zh_Hans': '餐车介绍',
    },
    'm8pmnzcv': {
      'ko': '정성 가득한 한 그릇으로 기분 좋은 한 끼를 즐길 수 있는 분식집',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '2eepvyqk': {
      'ko': '1.2km',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '6mfmyjdr': {
      'ko': '전화 : 041-0000-0000',
      'en': 'Phone: 041-0000-0000',
      'ja': '電話番号：041-0000-0000',
      'zh_Hans': '电话：041-0000-0000',
    },
    'c4xrb1h5': {
      'ko': '메뉴 보기',
      'en': 'View menu',
      'ja': 'メニューを見る',
      'zh_Hans': '查看菜单',
    },
    'a8ja239l': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // jallattohome
  {
    'cyd9adks': {
      'ko': '젤라또 스윗',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '4xqw81a2': {
      'ko': '푸드트럭 소개',
      'en': 'Food Truck Introduction',
      'ja': 'フードトラック紹介',
      'zh_Hans': '餐车介绍',
    },
    '99b9jsbt': {
      'ko': '정통 이탈리아 젤라또를 신선한 재료로 만드는 맛집',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'i4ddcr9d': {
      'ko': '110m',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '9mao26bo': {
      'ko': '전화 : 041-0000-0000',
      'en': 'Phone: 041-0000-0000',
      'ja': '電話番号：041-0000-0000',
      'zh_Hans': '电话：041-0000-0000',
    },
    'r2gwv17d': {
      'ko': '메뉴 보기',
      'en': 'View menu',
      'ja': 'メニューを見る',
      'zh_Hans': '查看菜单',
    },
    'wtrdwwxl': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // burgerhome
  {
    'ehx8t1sr': {
      'ko': '세모네모 햄버거',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ybw4wlep': {
      'ko': '푸드트럭 소개',
      'en': 'Food Truck Introduction',
      'ja': 'フードトラック紹介',
      'zh_Hans': '餐车介绍',
    },
    'moxp3g6j': {
      'ko': '수제 버거와 신선한 재료로 만들어진 최고의 햄버거를 만나보세요',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '91mk2yr1': {
      'ko': '110m',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'b40ev296': {
      'ko': '전화 : 041-0000-0000',
      'en': 'Phone: 041-0000-0000',
      'ja': '電話番号：041-0000-0000',
      'zh_Hans': '电话：041-0000-0000',
    },
    'hghix8zs': {
      'ko': '메뉴 보기',
      'en': 'View menu',
      'ja': 'メニューを見る',
      'zh_Hans': '查看菜单',
    },
    '1c9g3du0': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // passward
  {
    'ws1lkqzo': {
      'ko': '결제 전 본인확인',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'xl2epb1j': {
      'ko': 'weet 회원가입 비밀번호를 치고 결제하기 눌러주세요.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'f0wicnjy': {
      'ko': '비밀번호 입력',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'np7p2296': {
      'ko': 'Label here...',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'c6r2pxlm': {
      'ko': ' *비밀번호를 까먹었을 시 상담번호 041-000-000*',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'i9zdvsp5': {
      'ko': '결제하기 ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'm1i8wk42': {
      'ko': '장바구니',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'l2shzjpk': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // burger1
  {
    '3tid8z90': {
      'ko': '조리시간 약 8분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'p23ipw4z': {
      'ko': '풍부한 치즈와 육즙 가득한 패티가 조화로운 치즈버거',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'lqfl5txw': {
      'ko': '들어가는 재료:  100%소고기수제패티, 브리오슈번, 체다치즈, 토마토, 구운양파, 청상추, 특제소스',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '9e97pe3r': {
      'ko': '원산지: 소고기(미국산), 밀가루(국내산), 각종 야채(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'kywy0g6f': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // burger2
  {
    '9othlhbk': {
      'ko': '조리시간 약 14분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'hvwp5ubb': {
      'ko': '베이컨과 바삭한 닭다리살 치킨패티의 깊은 풍미와 식감을 \n최상으로 느낄 수 있는 치킨버거',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'r7ufc82f': {
      'ko': '들어가는 재료:  베이컨, 치킨패티, 브리오슈번, 체다치즈, \n토마토, 구운양파, 청상추, 마요네즈, 특제소스',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'tujp2b8d': {
      'ko': '원산지: 닭고기(미국산), 밀가루(국내산), 각종 야채(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    't6ii0my2': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // burger3
  {
    'ddxd9dfa': {
      'ko': '조리시간 약 8분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'jjuw9pym': {
      'ko': '겉은 바삭하고 속은 육즙가득한 닭다리살 치킨패티에 \n신선한 야채를 더한 오리지널 치킨 버거',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ynxf8cx9': {
      'ko': '들어가는 재료:  치킨패티, 브리오슈번, 체다치즈, 토마토, 구운양파, 청상추, 마요네즈, 특제소스',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '6hytjyte': {
      'ko': '원산지: 닭고기(미국산), 밀가루(국내산), 각종 야채(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'doti0jzi': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // burger4
  {
    '2tae2y67': {
      'ko': '조리시간 약 15분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'kd11c0is': {
      'ko': '구운 베이컨에 꾸덕한 치즈소스가 듬뿍 들어가 \n수제패티 2장과 최상의 풍미를 이룬 정통 아메리칸 버거',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'izrnr7pe': {
      'ko': '들어가는 재료:  소고기 패티, 베이컨, 브리오슈번, \n체다치즈, 특제소스',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'sgw2tsbg': {
      'ko': '원산지: 소고기(미국산), 밀가루(국내산), 각종 야채(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '6ujbmr5t': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // icecream1
  {
    'k5n1hk14': {
      'ko': '조리시간 약 2분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'av9uzr6v': {
      'ko': '상큼하고 진한 딸기의 맛을 가득 담은 젤라또',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '4r78g5kd': {
      'ko': '수제 딸기맛 젤라또',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '0rulg2i1': {
      'ko': '원산지: 우유(국내산), 딸기(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'bieygwz9': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // icecream2
  {
    'cbshm7h5': {
      'ko': '조리시간 약 2분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ztx2tyhw': {
      'ko': '부드럽고 풍부한 바닐라 향이 가득한 클래식 젤라또',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'no57sn93': {
      'ko': '수제 바닐라맛 젤라또',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '86kfdsbr': {
      'ko': '원산지: 우유(국내산), 바나나(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'fd06yqgl': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // icecream3
  {
    'tn8wufeh': {
      'ko': '조리시간 약 2분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'jsw31kvu': {
      'ko': '진하고 부드러운 초콜릿 풍미가 가득한 초코 젤라또',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'b78ftsgo': {
      'ko': '수제 초코 젤라또',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'leyo88fq': {
      'ko': '원산지: 우유(국내산), 카카오빈(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '0whdya0x': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // icecream4
  {
    'oarwizs3': {
      'ko': '조리시간 약 2분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '627gf2zm': {
      'ko': '깊고 풍부한 말차 향이 일품인 녹차 젤라또!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'f5zoe5uw': {
      'ko': '수제 녹차 젤라또',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'b8apaqg3': {
      'ko': '원산지: 우유(국내산), 녹차(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'qe7pxbwr': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // bunsick1
  {
    'ruymcdy6': {
      'ko': '조리시간 약 15분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '7p15u3qh': {
      'ko': '바삭한 튀김옷과 부드러운 고기가 어우러진, 옛날 정통 돈가스',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'wii388qh': {
      'ko': '들어가는 재료:   소고기, 튀김옷, 밀가루, 밥, 피클, 옥수수, \n마요네즈, 양배추, 아몬드, 파프리카',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    't1y5rgn3': {
      'ko': '원산지: 소고기(미국산), 밀가루(국내산), \n각종 야채(국내산), 쌀(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'oz135o74': {
      'ko': '5000원 장바구니 담기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ydbxta55': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // bunsick2
  {
    'b96x3m0u': {
      'ko': '조리시간 약 5분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'hhvmqnxv': {
      'ko': '매콤한 땡초와 신선한 재료가 조화를 이루는 매력적인 땡초김밥',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'f9dy34mn': {
      'ko': '들어가는 재료: 김, 밥, 땡초, 오이, 당근, 단무지, 계란, 햄',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'jpfrsk0a': {
      'ko': '원산지: 각종 야채(국내산), 밥(국내산), 계란(국내산), 햄(미국산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'j0iavnt3': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // bunsick3
  {
    'wu1iwhkj': {
      'ko': '조리시간 약 15분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'dpvi3k55': {
      'ko': '매콤하고 진한 국물에 쫄깃한 떡이 가득한 국물떡복이',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'hefeh3kf': {
      'ko': '들어가는 재료: 떡, 고추장, 대파, 양파, 어묵, 마늘',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'd3knu77a': {
      'ko': '원산지: 각종 야채(국내산), 떡(국내산), 어묵(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'k6ktu65j': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // bunsick4
  {
    'c9paqle4': {
      'ko': '조리시간 약 12분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '2kgczbze': {
      'ko': '진한 국물과 쫄깃한 면발이 매력적인 생생우동',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'jeahbo9h': {
      'ko': '들어가는 재료: 우동 면, 육수, 대파, \n버섯, 간장, 마늘, 생강, 양파, 유부, 고수',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'msfv3nwe': {
      'ko': '원산지: 각종 야채(국내산), 밀가루(중국산), 유부(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '3ojf42rd': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // chick1
  {
    'xg73vj1o': {
      'ko': '조리시간 약 20분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'z5wppk7q': {
      'ko': '바삭한 튀김옷과 부드러운 속살이 일품인 후라이드 치킨',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '4x0tco0u': {
      'ko': '들어가는 재료:  닭고기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '2neoxrvy': {
      'ko': '원산지: 닭고기(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'zi34s23c': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // chick2
  {
    '77u10rnn': {
      'ko': '조리시간 약 15분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '1p8a2q2u': {
      'ko': '매콤달콤한 양념이 풍부하게 배인 양념치킨',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'voka90qd': {
      'ko': '들어가는 재료:  닭고기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'p7i39xqx': {
      'ko': '원산지: 닭고기(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '58tudd02': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // chick3
  {
    'p08hxqrp': {
      'ko': '조리시간 약 20분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'wn8jiyv4': {
      'ko': '간장, 올리고당, 마늘, 굴엑기스 등으로 맛을 내 \n먹어도 먹어도 질리지 않는 깔끔한 간장 치킨',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'c9dsoiqj': {
      'ko': '들어가는 재료:  닭고기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'm2fkl9b2': {
      'ko': '원산지: 닭고기(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '5ocx23vu': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // chick4
  {
    'v94efkq4': {
      'ko': '조리시간 약 20분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'fekwvrb0': {
      'ko': '국내산 마늘을 직접 갈아 만든 치킨으로\n 한국인의 입맛에 잘 맞는 치킨',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'g9zfmi84': {
      'ko': '들어가는 재료:  닭고기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'm9fd6tpp': {
      'ko': '원산지: 닭고기(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'dfvey3yj': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // bunsickcatagori
  {
    '6l84yz6o': {
      'ko': '분식 푸드트럭',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'euwk79x7': {
      'ko': '한쌈더 분식',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'uxo7kzq5': {
      'ko': '#옛날 #한그릇 #추억 #엄마손맛',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'gxbu7y91': {
      'ko': '시간: 8월12일 오후 1시~5시 /\n장소: 호수공원',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'egt3vg68': {
      'ko': '마라 타코야끼',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'lx1yoya7': {
      'ko': '#타코야끼 #일본 #간편 #한입',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'brk9p0wo': {
      'ko': '시간: 8월12일 오후 1시~5시 /\n장소: 호수공원',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'z0kcfff8': {
      'ko': 'Page Title',
      'en': 'Page Title',
      'ja': 'ページタイトル',
      'zh_Hans': '页面标题',
    },
    'qt4zpe3z': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // cupbapcatagori
  {
    'vt2jr7ok': {
      'ko': '컵밥 푸드트럭',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ejuscill': {
      'ko': '한쌈더 분식',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '14zz4wii': {
      'ko': '#옛날 #한그릇 #추억 #엄마손맛',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'hvo7u9mc': {
      'ko': '시간: 8월12일 오후 1시~5시 / \n장소: 호수공원',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'wrkk5mjk': {
      'ko': 'Page Title',
      'en': 'Page Title',
      'ja': 'ページタイトル',
      'zh_Hans': '页面标题',
    },
    '7dymoo0o': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // pizzacatagori
  {
    '2ejj4tuw': {
      'ko': '피자 푸드트럭',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'whumlaqy': {
      'ko': '다인이네 화덕피자',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '1fpidvn5': {
      'ko': '#화덕에직접 #불 #따끈따끈 #이탈리',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '61gdp9ef': {
      'ko': '시간: 8월12일 오후 1시~5시 / \n장소: 호수공원',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'lo7qop9c': {
      'ko': 'Page Title',
      'en': 'Page Title',
      'ja': 'ページタイトル',
      'zh_Hans': '页面标题',
    },
    'yq8cq7xg': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // chickencatagori
  {
    '5bq6lk1z': {
      'ko': '치킨 푸드트럭',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '74bj0kr4': {
      'ko': '치킨로드',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'wr7ksimi': {
      'ko': '#클래식 #후라이드 #고소함 #마늘',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '1gsd6lnw': {
      'ko': '시간: 8월9일 오후 2시~5시 / \n장소: 대산읍 공원',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'e8ryhwdu': {
      'ko': '화락바베큐',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '158jq89d': {
      'ko': '#불맛 #스페셜 #풍미 #바베큐',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '9f07vtfc': {
      'ko': '시간: 8월9일 오후 2시~5시 / \n장소: 대산읍 공원',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'pfg1zzot': {
      'ko': 'Page Title',
      'en': 'Page Title',
      'ja': 'ページタイトル',
      'zh_Hans': '页面标题',
    },
    '2f1frne0': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // hotdogcatagori
  {
    'e1zw98jm': {
      'ko': '핫도그 푸드트럭',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '93r9l8qu': {
      'ko': '하림 핫도그',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'otbx33az': {
      'ko': '#토핑 #스페셜 #치즈 #갓튀긴',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '2cn0juzy': {
      'ko': '시간: 8월9일 오후 2시~5시 / \n장소: 대산읍 공원',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'bi7jlz4a': {
      'ko': 'Page Title',
      'en': 'Page Title',
      'ja': 'ページタイトル',
      'zh_Hans': '页面标题',
    },
    'ci7pjg7f': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // chinacatagori
  {
    'jyvjgwse': {
      'ko': '중식 푸드트럭',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '701gfjwp': {
      'ko': '마라탕',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'sbnmxmit': {
      'ko': '#매운 #중국 #얼얼 #맛있는',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'mbd8f741': {
      'ko': '시간: 8월12일 오후 1시~5시 /\n 장소: 호수공원',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'np5my7kw': {
      'ko': 'Page Title',
      'en': 'Page Title',
      'ja': 'ページタイトル',
      'zh_Hans': '页面标题',
    },
    'wat30r77': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // baveragecatagori
  {
    'qlxgc2r8': {
      'ko': '음료 푸드트럭',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'cmw3x4zv': {
      'ko': '생과일 주스',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'sujokuz2': {
      'ko': '#신선 #가벼운 #과일 #한컵',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'u93s1e4v': {
      'ko': '시간: 8월12일 오후 1시~5시 /\n 장소: 호수공원',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '028hv6pi': {
      'ko': 'Page Title',
      'en': 'Page Title',
      'ja': 'ページタイトル',
      'zh_Hans': '页面标题',
    },
    'qy40o5qr': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // dessertcatagori
  {
    'mcf8veiv': {
      'ko': '디저트 푸드트럭',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ib7ddy9g': {
      'ko': '젤라또 스윗',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'x34y4jft': {
      'ko': '#정통 #쫀득쫀득 #시원 #달콤',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'zbzaw90j': {
      'ko': '시간: 8월12일 오후 1시~5시 / \n장소: 호수공원',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '8r1lt2za': {
      'ko': 'Page Title',
      'en': 'Page Title',
      'ja': 'ページタイトル',
      'zh_Hans': '页面标题',
    },
    '58am3r4y': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // cuopon
  {
    'fs2q0amv': {
      'ko': '신규 가입고객 첫 구매 쿠폰',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '9ek8h2m5': {
      'ko': '메뉴에 상관 없이 첫구매라면 모두\n10,000원 할인🌟',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'akpj3dpp': {
      'ko': '10,000원',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'qzb4a0xq': {
      'ko': '여름맞이 음료 쿠폰🍹',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ca61rw2t': {
      'ko': '시원한 음료수로 \n무더위 날려버리기🌊🌊',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'vtrot0fr': {
      'ko': '3,000원',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'y9mrdj8e': {
      'ko': '내 쿠폰함',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '752p1z8z': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // votemain
  {
    '5w3us3al': {
      'ko': '원하는 푸드트럭에 투표하여',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'uvo3omy0': {
      'ko': '영탑리',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'rrm6z831': {
      'ko': '에 불러보세요!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'uxlx06pn': {
      'ko': '8/17',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '25xwibkk': {
      'ko': '다인이네 화덕피자',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'xt7yel1c': {
      'ko': '50%',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'uy9vlkpk': {
      'ko': '투표하기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '24f8c6w4': {
      'ko': '생과일 주스',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'p82f3ujx': {
      'ko': '63%',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'a1cximb0': {
      'ko': '투표하기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'alypcoi2': {
      'ko': '8/18',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'yeaoqqiu': {
      'ko': '생과일 주스',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'mpbp2oli': {
      'ko': '50%',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'qndtsewq': {
      'ko': '투표하기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'crplaty8': {
      'ko': '마라탕',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'q5x59fpl': {
      'ko': '98%',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'fef6q6t0': {
      'ko': '투표하기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'mwvui57y': {
      'ko': '8/19',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'pb8eo2j1': {
      'ko': '마라탕',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'meyjf3gz': {
      'ko': '81%',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'z28wiyde': {
      'ko': '투표하기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'b4leg8y3': {
      'ko': '투표하기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'kosi0qiz': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // voteresult82
  {
    'mpd3tgkr': {
      'ko': '82%',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '14r8qdwq': {
      'ko': '투표해 주셔서 감사합니다!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    't80a0sc5': {
      'ko': '돌아가기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ez5um6b5': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // voteresult51
  {
    'sg8whupg': {
      'ko': '51%',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'lov1dhx5': {
      'ko': '투표해 주셔서 감사합니다!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'lumuyptl': {
      'ko': '돌아가기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'xz78bglj': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // voteresult9
  {
    '7pzgfqm0': {
      'ko': '99%',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '55xqmgqq': {
      'ko': '투표해 주셔서 감사합니다!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '3j7qt83f': {
      'ko': '돌아가기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ikz67omh': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // voteresult99
  {
    '0naktcre': {
      'ko': '99%',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ejf9sor7': {
      'ko': '투표해 주셔서 감사합니다!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'mr35kkay': {
      'ko': '돌아가기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'pi0bbe0j': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // voteresult64
  {
    '0rzpijbq': {
      'ko': '64%',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ml5hknp5': {
      'ko': '투표해 주셔서 감사합니다!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'lf99v5y0': {
      'ko': '돌아가기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'sotk6hx8': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // BullChickHome
  {
    'dup4wvea': {
      'ko': '화락바베큐',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'xpbbm425': {
      'ko': '푸드트럭 소개',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'qcdtj6xn': {
      'ko': '다양하게 즐기는 직화의 감칠맛.\n',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '7o769h2y': {
      'ko': '1.2km',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '6grgj2b4': {
      'ko': '전화 : 041-0000-0000',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'mr04er7b': {
      'ko': '메뉴 보기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '3ep9pb6r': {
      'ko': 'Home',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // BullChickMenu
  {
    'es301iop': {
      'ko': 'Page Title',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'zafs1wbh': {
      'ko': '직화버터바베큐치킨 18.0',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '9canrujj': {
      'ko': '직화고추장바베큐치킨 18.0',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '80fb9ims': {
      'ko': '직화소금바베큐치킨 16.0',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'qi0hh09n': {
      'ko': 'Home',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // BullChick1
  {
    '2dn31lbf': {
      'ko': '조리시간 약 20분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'zvof4zt1': {
      'ko': '고소한 버터와 강력한 직화의 만남!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'sschs5vp': {
      'ko': '주재료: 닭다리살, 떡, 버터',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'tsxn4x77': {
      'ko': '원산지:닭(국내산), 떡(국내산), 버터(미국)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'nzf1g938': {
      'ko': 'Home',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // Bullchick2
  {
    '3fpcssdz': {
      'ko': '조리시간 약 20분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'cjcg56vo': {
      'ko': '매콤한 고추장과 강력한 직화의 만남!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ip65oygh': {
      'ko': '주재료: 닭다리살, 떡, 고추장',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'dwvmfbcz': {
      'ko': '원산지:닭(국내산), 떡(국내산), 고추장(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'xg45w6br': {
      'ko': 'Home',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // Bullchick3
  {
    'fcww6t8o': {
      'ko': '조리시간 약 20분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'jyg9b42s': {
      'ko': '맛있는 소금과 강력한 직화의 만남!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'pvbakejp': {
      'ko': '주재료: 닭다리살, 떡, 소금',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'lv6kn3oy': {
      'ko': '원산지:닭(국내산), 떡(국내산), 소금(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '4aql5djs': {
      'ko': 'Home',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // hotdogmenu
  {
    '6hq0y900': {
      'ko': 'Page Title',
      'en': 'Page Title',
      'ja': 'ページタイトル',
      'zh_Hans': '页面标题',
    },
    '9xjguade': {
      'ko': '체다치즈핫도그 2.5',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'rvlcls0w': {
      'ko': '감자핫도그 3.0',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'khxuoflg': {
      'ko': '마늘핫도그 3.5',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'nep3z24g': {
      'ko': '점보핫도그 2.5',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'w17tvq6n': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // hamburgermenu
  {
    '18bbhyjy': {
      'ko': 'Page Title',
      'en': 'Page Title',
      'ja': 'ページタイトル',
      'zh_Hans': '页面标题',
    },
    'qryr2hlb': {
      'ko': '치즈버거 6.0',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'flgw4w30': {
      'ko': '베이컨치킨버거 6.5',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '9fsdyeia': {
      'ko': '크리스피치킨버거 6.5',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ghg8pqof': {
      'ko': 'JG버거 6.5',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'c1qj4rbi': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // bunshikmenu
  {
    'u2smzf75': {
      'ko': 'Page Title',
      'en': 'Page Title',
      'ja': 'ページタイトル',
      'zh_Hans': '页面标题',
    },
    'tbkftzml': {
      'ko': '옛날돈가스 5.0',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'd40n2j8i': {
      'ko': '땡초김밥 3.0',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '0p7f8n6u': {
      'ko': '국물떡볶이 4.5',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'z8bn6pmz': {
      'ko': '생생우동 4.5',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'v1ncgmk6': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // chikenmenu
  {
    '4pqeww1m': {
      'ko': 'Page Title',
      'en': 'Page Title',
      'ja': 'ページタイトル',
      'zh_Hans': '页面标题',
    },
    'fexyrrjb': {
      'ko': '후라이드치킨 8.5',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'cv3c8yzx': {
      'ko': '양념치킨 9.0',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'pr4rt1ir': {
      'ko': '간장치킨 9.0',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    't162rdqz': {
      'ko': '마늘치킨 9.0',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'h8vu9mt8': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // icecreammenu
  {
    'hx1l5178': {
      'ko': 'Page Title',
      'en': 'Page Title',
      'ja': 'ページタイトル',
      'zh_Hans': '页面标题',
    },
    'nr96j1q2': {
      'ko': '딸기 젤라또 4.0',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '09qctay3': {
      'ko': '바닐라 젤라또 4.0',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'g0oyqlgz': {
      'ko': '초코 젤라또 4.0',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'hp9qvfzj': {
      'ko': '말차 젤라또 4.0',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'we83kvte': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // alram
  {
    'c8o2njzc': {
      'ko': '알림',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'xifvmkna': {
      'ko': 'ad banner',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '13n8o3jf': {
      'ko': '다인이네 화덕피자',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '65ie8dsn': {
      'ko': '7분 전',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '0po5p9a6': {
      'ko': '투표하신 트럭이 내일 오후 2시-6시까지 영탑리 호수 \n앞으로 찾아갑니다!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'hjw1ohqs': {
      'ko': '생과일 주스',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '3xo8kkr5': {
      'ko': '3일 전',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '8vy0mtnd': {
      'ko': '주문해 주셔서 감사합니다! 별점을 남겨 쿠폰을 \n받아가세요!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'nh5r1wl7': {
      'ko': 'Home',
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '家',
    },
  },
  // TangTangHome
  {
    'im1tx2s6': {
      'ko': '마라탕후루',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'mxcqf86g': {
      'ko': '푸드트럭 소개',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'stzy9sfw': {
      'ko': '과일 디저트 전문 매장입니다. 상큼, 달콤, 바사삭한 식감까지!\n',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '1qa39ap4': {
      'ko': '1.2km',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'gyh97dg6': {
      'ko': '전화 : 041-0000-0000',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'q3mbw9qb': {
      'ko': '메뉴 보기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'd4woppgj': {
      'ko': 'Home',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // TangTangMenu
  {
    '3geq86op': {
      'ko': 'Page Title',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'irnhjeyy': {
      'ko': '오마카세 탕후루4.5',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '3ygg9xlh': {
      'ko': '샤인머스캣 탕후루4.5',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '9sjs8lca': {
      'ko': '통귤 탕후루4.5',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '1dbsliaf': {
      'ko': '스위토망고 탕후루3.5',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'knbdtvlu': {
      'ko': '딸기 탕후루3.5',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'b3jdlgoj': {
      'ko': 'Home',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // TangTang1
  {
    'dihnlmev': {
      'ko': '조리시간 약 5분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '2nxvn552': {
      'ko': '계절에 잘 어울리는 신선한 과일을 \n다양하게 선별하여 톡톡세프가 자신있게 추천합니다!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ig9esxq3': {
      'ko': '주재료: 샤인머스캣, 귤, 딸기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'uob82uxz': {
      'ko': '원산지:샤인머스캣(국내산), 귤(국내산), 딸기(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'j534rbm8': {
      'ko': 'Home',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // TangTang2
  {
    '9p573t1d': {
      'ko': '조리시간 약 5분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'x9euqhj0': {
      'ko': '과즙이 풍풍하고 달콤 탱탱한 샤인머스켓!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '08m7bbku': {
      'ko': '주재료: 샤인머스캣',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '1cdmqabo': {
      'ko': '원산지:샤인머스캣(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'z1311g3z': {
      'ko': 'Home',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // TangTang3
  {
    'l79gblt7': {
      'ko': '조리시간 약 5분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'csl2usz7': {
      'ko': '제주산 통귤을 시원하게 통째로 한입에 쏙!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'zuyz3iao': {
      'ko': '주재료: 귤',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '2q4lkxow': {
      'ko': '원산지: 귤(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'db3stkhu': {
      'ko': 'Home',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // TangTang4
  {
    '3cz5h3w5': {
      'ko': '조리시간 약 5분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'x2tsiyrq': {
      'ko': '스테비아 토망고 [달콤 아삭한 식감의 건강한 단맛!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'f5s0td7m': {
      'ko': '주재료: 스테비아 토마토',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '2k2z1aha': {
      'ko': '원산지: 스테비아 토마토(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'aevsq45v': {
      'ko': 'Home',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // TangTang5
  {
    'jyukasja': {
      'ko': '조리시간 약 5분',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'd4avc865': {
      'ko': '딸기 탕후루 탕후루 대표 과일 잠깐의 망설임 없이 뭐 먹을래!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'cx8iuv5y': {
      'ko': '주재료: 딸기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ygtswgcl': {
      'ko': '원산지: 딸기(국내산)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'dlprudll': {
      'ko': 'Home',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // payWan
  {
    '52vdocrz': {
      'ko': '결제완료!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // loginWan
  {
    'kucdj2v2': {
      'ko': '로그인 완료!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // logoutWan
  {
    'jj8vv8rk': {
      'ko': '로그아웃 됨',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // saveWan
  {
    'mtoe5hic': {
      'ko': '저장완료!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // cuoponwan
  {
    'ht0ueohb': {
      'ko': '다운로드 완ryo✅',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // Miscellaneous
  {
    'iybyybz3': {
      'ko': 'Hello World',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '4i4kdhx3': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'bgevwprf': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'hm49esdb': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'o5ylgm2t': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'xaa4fwa1': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '4nsjhq9q': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '0xs6boi1': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '5s3ojuco': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'a2d3qpgo': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'm50rf1h6': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'lg5bjs25': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'oe7g149z': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '3ukmb8lb': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '2hokodls': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ppx3w7qw': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ygyff97t': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'rsyr36o3': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ux7jtf80': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'q9m6s2yg': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'hmbucofo': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'bglaq4x3': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ddlledk9': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'vn41l7mw': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'zpnnlmgo': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'htrpg4hu': {
      'ko': '',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
