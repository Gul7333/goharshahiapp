// ignore_for_file: non_constant_identifier_names

class ZikrData {
  String reference;
  String arabic;
  Translation translation;

  ZikrData({
    required this.reference,
    required this.arabic,
    required this.translation,
  });

  factory ZikrData.fromJson(Map<String, dynamic> json) {
    return ZikrData(
      reference: json['reference'] ?? '',
      arabic: json['arabic'] ?? '',
      translation: Translation.fromJson(json['translation']),
    );
  }
}

class Translation {
  String ur;
  String hi;
  String en;

  Translation({
    required this.ur,
    required this.hi,
    required this.en,
  });

  // From JSON
  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      ur: json['ur'] ?? '',
      hi: json['hi'] ?? '',
      en: json['en'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'ur': ur,
      'hi': hi,
      'en': en,
    };
  }
}

class Referr {
  List<ZikrData> Quran;
  List<ZikrData> Hadees;
  List<ZikrData> Aulia;

  Referr({
    required this.Quran,
    required this.Hadees,
    required this.Aulia,
  });

  factory Referr.fromJson(Map<String, dynamic> json) {
    // Use .map to convert the list of maps into List<ZikrData> objects
    List<ZikrData> jj = (json["Quran"] as List)
        .map((value) => ZikrData.fromJson(value as Map<String, dynamic>))
        .toList();
    List<ZikrData> jh = (json["Hadees"] as List)
        .map((value) => ZikrData.fromJson(value as Map<String, dynamic>))
        .toList();
    List<ZikrData> jg = (json["Aulia"] as List)
        .map((value) => ZikrData.fromJson(value as Map<String, dynamic>))
        .toList();
    return Referr(
      Quran: jj,
      Hadees: jh,
      Aulia: jg,
    );
  }
}

Referr zikrDataa = Referr.fromJson({
  "Quran": [
    {
      "reference": "سورۃ التغابن (64:11)",
      "arabic":
          "مَا أَصَابَ مِن مُّصِيبَةٍ إِلَّا بِإِذْنِ ٱللَّهِ ۗ وَمَن يُؤْمِنۢ بِٱللَّهِ يَهْدِ قَلْبَهُۥ ۚ وَٱللَّهُ بِكُلِّ شَىْءٍ عَلِيمٌۭ",
      "translation": {
        "ur":
            "کوئی مصیبت نہیں آتی مگر اللہ کے حکم سے، اور جو کوئی اللہ پر ایمان لائے گا اللہ اس کے دل کو ہدایت دے گا، اور اللہ ہر چیز کو خوب جاننے والا ہے۔",
        "hi":
            "कोई मुसीबत अल्लाह की इजाज़त के बिना नहीं आती। और जो कोई अल्लाह पर ईमान लाता है, अल्लाह उसके दिल को हिदायत देता है। और अल्लाह हर चीज़ को जानने वाला है।",
        "en":
            "No disaster strikes except by permission of Allah. And whoever believes in Allah - He will guide his heart. And Allah is Knowing of all things."
      }
    },
    {
      "reference": "سورۃ الزمر (39:22)",
      "arabic":
          "أَفَمَنْ شَرَحَ ٱللَّهُ صَدْرَهُۥ لِلْإِسْلَـٰمِ فَهُوَ عَلَىٰ نُورٍۢ مِّن رَّبِّهِۦ ۚ فَوَيْلٌۭ لِّلْقَـٰسِيَةِ قُلُوبُهُم مِّن ذِكْرِ ٱللَّهِ ۚ أُو۟لَـٰٓئِكَ فِى ضَلَـٰلٍۢ مُّبِينٍ",
      "translation": {
        "ur":
            "کیا وہ شخص جس کا سینہ اللہ تعالٰی نے اسلام کے لئے کھول دیا ہے پس وہ اپنے پروردگار کی طرف سے ایک نور پر ہے اور ہلاکی ہے ان پر جن کے دل ذکر اللہ کے لیے سخت ہوگئے ہیں (اتنے سخت ہوگئے کہ اللہ کا ذکر ان کے دل میں نہیں اترتا) ۔ یہ لوگ صریح گمراہی میں مبتلا ہیں ۔",
        "hi":
            "क्या वह व्यक्ति जिसका सीना अल्लाह ने इस्लाम के लिए खोल दिया हो और वह अपने रब की ओर से रोशनी पर हो? तबाही है उन लोगों के लिए जिनके दिल अल्लाह की याद के लिए कठोर हैं। यही लोग खुली गुमराही में हैं।",
        "en":
            "So is one whose breast Allah has expanded to [accept] Islam and he is upon a light from his Lord [like one whose heart rejects it]? Then woe to those whose hearts are hardened against the remembrance of Allah. Those are in manifest error."
      }
    },
    {
      "reference": "Quran 49:14",
      "arabic":
          "قَالَتِ ٱلۡأَعۡرَابُ ءَامَنَّاۖ قُل لَّمۡ تُؤۡمِنُواْ وَلَٰكِن قُولُوٓاْ أَسۡلَمۡنَا وَلَمَّا يَدۡخُلِ ٱلۡإِيمَٰنُ فِي قُلُوبِكُمۡۖ وَإِن تُطِيعُواْ ٱللَّهَ وَرَسُولَهُۥ لَا يَلِتۡكُم مِّنۡ أَعۡمَٰلِكُمۡ شَيۡـًٔاۚ إِنَّ ٱللَّهَ غَفُورٌ رَّحِيمٌ",
      "translation": {
        "ur":
            "دیہاتی لوگ کہتے ہیں: ہم ایمان لائے۔ کہہ دو: تم ایمان نہیں لائے بلکہ یوں کہو کہ ہم اسلام لائے، کیونکہ ایمان تو ابھی تمہارے دلوں میں داخل ہی نہیں ہوا۔ اور اگر تم اللہ اور اس کے رسول کی اطاعت کرو تو وہ تمہارے اعمال میں سے کچھ بھی کم نہیں کرے گا۔ بے شک اللہ بڑا بخشنے والا، نہایت رحم کرنے والا ہے۔",
        "hi":
            "अरब के देहाती कहते हैं: 'हम ईमान लाए।' कह दो: 'तुम ईमान नहीं लाए बल्कि यह कहो कि हमने इस्लाम क़ुबूल किया, क्योंकि ईमान अभी तुम्हारे दिलों में दाख़िल नहीं हुआ। और यदि तुम अल्लाह और उसके रसूल का पालन करोगे तो वह तुम्हारे कर्मों में से कुछ भी कम नहीं करेगा।' निश्चय ही अल्लाह बड़ा क्षमाशील, अत्यंत दयालु है।",
        "en":
            "The Bedouins say, 'We have believed.' Say, 'You have not yet believed; but say instead, 'We have submitted,' for faith has not yet entered your hearts. And if you obey Allah and His Messenger, He will not deprive you of your deeds of anything. Indeed, Allah is Forgiving and Merciful.'"
      }
    },
    {
      "reference": "سورۃ الأنعام (6:125)",
      "arabic":
          "فَمَن يُرِدِ اللَّهُ أَنْ يَهْدِيَهُ يَشْرَحْ صَدْرَهُ لِلْإِسْلَامِ وَمَن يُرِدْ أَنْ يُضِلَّهُ يَجْعَلْ صَدْرَهُ ضَيِّقًا حَرَجًا كَأَنَّ مَا يَصَّعَّدُ فِي السَّمَاء",
      "translation": {
        "ur":
            "پس جسے اللہ ہدایت دینا چاہے، اس کا سینہ اسلام کے لیے کھول دیتا ہے اور جسے وہ گمراہ کرنا چاہے، اس کا سینہ تنگ کر دیتا ہے، گویا وہ آسمان میں چڑھ رہا ہو۔",
        "hi":
            "तो जिसे अल्लाह हिदायत देना चाहता है, उसका सीना इस्लाम के लिए खोल देता है और जिसे वह गुमराही में डालना चाहता है, उसका सीना तंग कर देता है जैसे वह आसमान में चढ़ रहा हो।",
        "en":
            "So, whomsoever Allah wills to guide, He opens his heart to Islam, and whomsoever He wills to misguide, He makes his chest tight and constricted as if he were climbing up to the sky."
      }
    },
    {
      "reference": "سورۃ البقرہ (2:152)",
      "arabic": "فَاذْكُرُونِي أَذْكُرْكُمْ وَاشْكُرُوا لِي وَلَا تَكْفُرُونِ",
      "translation": {
        "ur":
            "پس تم میرا ذکر کرو، میں تمہارا ذکر کروں گا، اور میرا شکر ادا کرو اور ناشکری نہ کرو۔",
        "hi":
            "इसलिए तुम मेरा ज़िक्र करो, मैं तुम्हारा ज़िक्र करूँगा, और मेरा शुक्र अदा करो और नाशुक्रे मत बनो।",
        "en":
            "So remember Me; I will remember you. And be grateful to Me and do not deny Me."
      }
    },
    {
      "reference": "سورۃ الرعد (13:28)",
      "arabic":
          "الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُم بِذِكْرِ اللَّهِ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ",
      "translation": {
        "ur":
            "جو لوگ ایمان لائے اور ان کے دل اللہ کے ذکر سے سکون پاتے ہیں، یاد رکھو کہ اللہ کے ذکر سے ہی دل سکون پاتے ہیں۔",
        "hi":
            "जो लोग ईमान लाए और उनके दिल अल्लाह के ज़िक्र से सुकून पाते हैं, जान लो कि अल्लाह के ज़िक्र से ही दिल सुकून पाते हैं।",
        "en":
            "Those who have believed and whose hearts are assured by the remembrance of Allah. Unquestionably, by the remembrance of Allah hearts are assured."
      }
    },
    {
      "reference": "سورۃ الأحزاب (33:41-42)",
      "arabic":
          "يَا أَيُّهَا الَّذِينَ آمَنُوا اذْكُرُوا اللَّهَ ذِكْرًا كَثِيرًا وَسَبِّحُوهُ بُكْرَةً وَأَصِيلًا",
      "translation": {
        "ur":
            "اے ایمان والو! اللہ کو کثرت سے یاد کرو، اور صبح و شام اس کی تسبیح کرو۔",
        "hi":
            "हे ईमान वालों! अल्लाह को कसरत से याद करो और सुबह-शाम उसकी तस्बीह करो।",
        "en":
            "O you who have believed, remember Allah with much remembrance. And exalt Him morning and afternoon."
      }
    },
    {
      "reference": "سورۃ الجمعة (62:10)",
      "arabic":
          "فَإِذَا قُضِيَتِ الصَّلَاةُ فَانتَشِرُوا فِي الْأَرْضِ وَابْتَغُوا مِن فَضْلِ اللَّهِ وَاذْكُرُوا اللَّهَ كَثِيرًا لَعَلَّكُمْ تُفْلِحُونَ",
      "translation": {
        "ur":
            "پھر جب نماز پوری ہو جائے تو زمین میں پھیل جاؤ اور اللہ کا فضل تلاش کرو اور اللہ کو کثرت سے یاد کرو تاکہ تم کامیاب ہو جاؤ۔",
        "hi":
            "जब नमाज़ पूरी हो जाए, तो धरती में फैल जाओ और अल्लाह का फ़ज़ल तलाश करो और अल्लाह को कसरत से याद करो ताकि तुम सफल हो सको।",
        "en":
            "And when the prayer has been concluded, disperse within the land and seek from the bounty of Allah, and remember Allah often that you may succeed."
      }
    },
    {
      "reference": "سورۃ آل عمران (3:191)",
      "arabic":
          "الَّذِينَ يَذْكُرُونَ اللَّهَ قِيَامًا وَقُعُودًا وَعَلَىٰ جُنُوبِهِمْ وَيَتَفَكَّرُونَ فِي خَلْقِ السَّمَاوَاتِ وَالْأَرْضِ رَبَّنَا مَا خَلَقْتَ هَٰذَا بَاطِلًا سُبْحَانَكَ فَقِنَا عَذَابَ النَّارِ",
      "translation": {
        "ur":
            "جو اللہ کو کھڑے، بیٹھے اور اپنے پہلوؤں پر یاد کرتے ہیں اور آسمانوں اور زمین کی تخلیق پر غور و فکر کرتے ہیں، کہتے ہیں: اے ہمارے رب! تو نے یہ بے مقصد نہیں پیدا کیا۔ تو پاک ہے، پس ہمیں آگ کے عذاب سے بچا۔",
        "hi":
            "जो अल्लाह को खड़े, बैठे और अपने पहलुओं पर याद करते हैं और आसमानों और ज़मीन की तख्लीक़ पर ग़ौर करते हैं, कहते हैं: हे हमारे रब! तूने यह व्यर्थ नहीं बनाया। तू पाक है, हमें आग के अज़ाब से बचा।",
        "en":
            "Who remember Allah while standing, sitting, and [lying] on their sides and give thought to the creation of the heavens and the earth, [saying], 'Our Lord, You did not create this aimlessly; exalted are You [above such a thing]; then protect us from the punishment of the Fire.'"
      }
    },
    {
      "reference": "سورۃ النساء (4:103)",
      "arabic":
          "فَإِذَا قَضَيْتُمُ الصَّلَاةَ فَاذْكُرُوا اللَّهَ قِيَامًا وَقُعُودًا وَعَلَىٰ جُنُوبِكُمْ فَإِذَا اطْمَأْنَنتُمْ فَأَقِيمُوا الصَّلَاةَ إِنَّ الصَّلَاةَ كَانَتْ عَلَى الْمُؤْمِنِينَ كِتَابًا مَّوْقُوتًا",
      "translation": {
        "ur":
            "پھر جب تم نماز پوری کر لو تو اللہ کو کھڑے، بیٹھے اور اپنے پہلوؤں پر یاد کرو۔ پھر جب تم اطمینان میں ہو جاؤ تو نماز قائم کرو، بے شک نماز مومنوں پر وقت کی پابندی کے ساتھ فرض کی گئی ہے۔",
        "hi":
            "फिर जब तुम नमाज़ पूरी कर लो तो अल्लाह को खड़े, बैठे और अपने पहलुओं पर याद करो। फिर जब तुम इत्मीनान में हो जाओ तो नमाज़ क़ायम करो, बेशक नमाज़ ईमान वालों पर समय की पाबंदी के साथ फर्ज़ की गई है।",
        "en":
            "And when you have completed the prayer, remember Allah standing, sitting, or [lying] on your sides. But when you become secure, re-establish [regular] prayer. Indeed, prayer has been decreed upon the believers a decree of specified times."
      }
    },
    {
      "reference": "سورۃ البقرة (2:200)",
      "arabic":
          "فَإِذَا قَضَيْتُم مَّنَاسِكَكُمْ فَاذْكُرُوا اللَّهَ كَذِكْرِكُمْ آبَاءَكُمْ أَوْ أَشَدَّ ذِكْرًا",
      "translation": {
        "ur":
            "پھر جب تم اپنے مناسک ادا کر لو تو اللہ کا ذکر کرو جیسے تم اپنے باپ دادا کا ذکر کرتے تھے یا اس سے بھی زیادہ ذکر کرو۔",
        "hi":
            "फिर जब तुम अपने मनासिक अदा कर लो तो अल्लाह का ज़िक्र करो जैसे तुम अपने बाप-दादा का ज़िक्र करते थे या उससे भी अधिक ज़िक्र करो।",
        "en":
            "And when you have completed your rites, remember Allah like your [previous] remembrance of your fathers or with much greater remembrance."
      }
    },
    {
      "reference": "سورۃ النساء (4:142)",
      "arabic":
          "إِنَّ الْمُنَافِقِينَ يُخَادِعُونَ اللَّهَ وَهُوَ خَادِعُهُمْ وَإِذَا قَامُوا إِلَى الصَّلَاةِ قَامُوا كُسَالَىٰ يُرَاءُونَ النَّاسَ وَلَا يَذْكُرُونَ اللَّهَ إِلَّا قَلِيلًا",
      "translation": {
        "ur":
            "بیشک منافق اللہ کو دھوکہ دینے کی کوشش کرتے ہیں، حالانکہ وہ انہیں دھوکہ دینے والا ہے۔ اور جب وہ نماز کے لیے کھڑے ہوتے ہیں تو سستی کے ساتھ کھڑے ہوتے ہیں، لوگوں کو دکھانے کے لیے، اور اللہ کو بہت کم یاد کرتے ہیں۔",
        "hi":
            "निश्‍चित रूप से मुनाफिक अल्लाह को धोखा देने की कोशिश करते हैं, हालाँकि वह उन्हें धोखा देने वाला है। और जब वे नमाज़ के लिए खड़े होते हैं तो सुस्ती से खड़े होते हैं, लोगों को दिखाने के लिए, और अल्लाह को बहुत कम याद करते हैं।",
        "en":
            "Indeed, the hypocrites [think to] deceive Allah, but He is deceiving them. And when they stand for prayer, they stand lazily, showing [themselves] to the people and not remembering Allah except a little."
      }
    },
    {
      "reference": "سورۃ الأحزاب (33:35)",
      "arabic":
          "إِنَّ الْمُسْلِمِينَ وَالْمُسْلِمَاتِ وَالْمُؤْمِنِينَ وَالْمُؤْمِنَاتِ وَالْقَانِتِينَ وَالْقَانِتَاتِ وَالصَّادِقِينَ وَالصَّادِقَاتِ وَالصَّابِرِينَ وَالصَّابِرَاتِ وَالْخَاشِعِينَ وَالْخَاشِعَاتِ وَالْمُتَصَدِّقِينَ وَالْمُتَصَدِّقَاتِ وَالصَّائِمِينَ وَالصَّائِمَاتِ وَالْحَافِظِينَ فُرُوجَهُمْ وَالْحَافِظَاتِ وَالذَّاكِرِينَ اللَّهَ كَثِيرًا وَالذَّاكِرَاتِ أَعَدَّ اللَّهُ لَهُم مَّغْفِرَةً وَأَجْرًا عَظِيمًا",
      "translation": {
        "ur":
            "بیشک مسلمان مرد اور مسلمان عورتیں، مومن مرد اور مومن عورتیں، اطاعت گزار مرد اور اطاعت گزار عورتیں، راست گو مرد اور راست گو عورتیں، صبر کرنے والے مرد اور صبر کرنے والی عورتیں، خشوع کرنے والے مرد اور خشوع کرنے والی عورتیں، صدقہ دینے والے مرد اور صدقہ دینے والی عورتیں، روزہ رکھنے والے مرد اور روزہ رکھنے والی عورتیں، اپنی شرمگاہوں کی حفاظت کرنے والے مرد اور عورتیں، اور اللہ کا کثرت سے ذکر کرنے والے مرد اور عورتیں، اللہ نے ان کے لیے مغفرت اور بڑا اجر تیار کر رکھا ہے۔",
        "hi":
            "निश्‍चित रूप से मुसलमान पुरुष और मुसलमान महिलाएँ, ईमान वाले पुरुष और ईमान वाली महिलाएँ, आज्ञापालक पुरुष और आज्ञापालक महिलाएँ, सच्चे पुरुष और सच्ची महिलाएँ, धैर्य रखने वाले पुरुष और महिलाएँ, विनम्र पुरुष और विनम्र महिलाएँ, दान देने वाले पुरुष और महिलाएँ, रोज़ा रखने वाले पुरुष और महिलाएँ, अपनी लज्जा की रक्षा करने वाले पुरुष और महिलाएँ, और अल्लाह को कसरत से याद करने वाले पुरुष और महिलाएँ, अल्लाह ने उनके लिए क्षमा और बड़ा प्रतिफल तैयार कर रखा है।",
        "en":
            "Indeed, the Muslim men and Muslim women, the believing men and believing women, the obedient men and obedient women, the truthful men and truthful women, the patient men and patient women, the humble men and humble women, the charitable men and charitable women, the fasting men and fasting women, the men who guard their private parts and the women who do so, and the men who remember Allah often and the women who do so—for them Allah has prepared forgiveness and a great reward."
      }
    },
    {
      "reference": "سورۃ الأعراف (7:205)",
      "arabic":
          "وَاذْكُرْ رَبَّكَ فِي نَفْسِكَ تَضَرُّعًا وَخِيفَةً وَدُونَ الْجَهْرِ مِنَ الْقَوْلِ بِالْغُدُوِّ وَالْآصَالِ وَلَا تَكُن مِّنَ الْغَافِلِينَ",
      "translation": {
        "ur":
            "اور اپنے رب کو اپنے دل میں عاجزی اور خوف کے ساتھ اور پست آواز میں صبح و شام یاد کرو اور غافلوں میں سے نہ بنو۔",
        "hi":
            "और अपने रब को अपने दिल में विनम्रता और भय के साथ और धीमे स्वर में सुबह और शाम याद करो और गाफ़िलों में से मत बनो।",
        "en":
            "And remember your Lord within yourself in humility and fear without being apparent in speech— in the mornings and the evenings. And do not be among the heedless."
      }
    },
    {
      "reference": "سورۃ الأنفال (8:45)",
      "arabic":
          "يَا أَيُّهَا الَّذِينَ آمَنُوا إِذَا لَقِيتُمْ فِئَةً فَاثْبُتُوا وَاذْكُرُوا اللَّهَ كَثِيرًا لَعَلَّكُمْ تُفْلِحُونَ",
      "translation": {
        "ur":
            "اے ایمان والو! جب تم کسی گروہ سے مڈبھیڑ کرو تو ثابت قدم رہو اور اللہ کو کثرت سے یاد کرو تاکہ تم کامیاب ہو جاؤ۔",
        "hi":
            "हे ईमान वालों! जब तुम किसी गिरोह से आमने-सामने हो तो दृढ़ रहो और अल्लाह को कसरत से याद करो ताकि तुम सफल हो सको।",
        "en":
            "O you who have believed, when you encounter a company [from the enemy forces], stand firm and remember Allah often that you may succeed."
      }
    },
    {
      "reference": "سورۃ طه (20:14)",
      "arabic":
          "إِنَّنِي أَنَا اللَّهُ لَا إِلَٰهَ إِلَّا أَنَا فَاعْبُدْنِي وَأَقِمِ الصَّلَاةَ لِذِكْرِي",
      "translation": {
        "ur":
            "بے شک، میں ہی اللہ ہوں، میرے سوا کوئی معبود نہیں۔ پس میری عبادت کرو اور میری یاد کے لیے نماز قائم کرو۔",
        "hi":
            "निश्‍चित रूप से मैं ही अल्लाह हूँ, मेरे सिवा कोई पूज्य नहीं। इसलिए मेरी इबादत करो और मेरी याद के लिए नमाज़ क़ायम करो।",
        "en":
            "Indeed, I am Allah. There is no deity except Me, so worship Me and establish prayer for My remembrance."
      }
    },
    {
      "reference": "سورۃ الحشر (59:19)",
      "arabic":
          "وَلَا تَكُونُوا كَالَّذِينَ نَسُوا اللَّهَ فَأَنسَاهُمْ أَنفُسَهُمْ أُو۟لَٰٓئِكَ هُمُ ٱلْفَٰسِقُونَ",
      "translation": {
        "ur":
            "اور ان لوگوں کی طرح نہ ہو جاؤ جنہوں نے اللہ کو بھلا دیا تو اللہ نے انہیں اپنے آپ سے غافل کر دیا، یہی لوگ فاسق ہیں۔",
        "hi":
            "और उन लोगों की तरह मत बनो जिन्होंने अल्लाह को भुला दिया, तो अल्लाह ने उन्हें अपने आप से गाफ़िल कर दिया। यही लोग अवज्ञाकारी हैं।",
        "en":
            "And do not be like those who forgot Allah, so He made them forget themselves. Those are the defiantly disobedient."
      }
    },
    {
      "reference": "سورۃ الجمعہ (62:10)",
      "arabic":
          "فَإِذَا قُضِيَتِ ٱلصَّلَوٰةُ فَٱنتَشِرُوا فِى ٱلْأَرْضِ وَٱبْتَغُوا۟ مِن فَضْلِ ٱللَّهِ وَٱذْكُرُوا۟ ٱللَّهَ كَثِيرًۭا لَّعَلَّكُمْ تُفْلِحُونَ",
      "translation": {
        "ur":
            "پھر جب نماز پوری ہو جائے تو زمین میں پھیل جاؤ اور اللہ کے فضل کی تلاش کرو اور اللہ کو کثرت سے یاد کرو تاکہ تم کامیاب ہو جاؤ۔",
        "hi":
            "फिर जब नमाज़ पूरी हो जाए तो ज़मीन में फैल जाओ और अल्लाह के फज़ल को तलाश करो और अल्लाह को कसरत से याद करो ताकि तुम सफल हो जाओ।",
        "en":
            "And when the prayer has been concluded, disperse within the land and seek from the bounty of Allah, and remember Allah often that you may succeed."
      }
    },
    {
      "reference": "سورۃ الرعد (13:28)",
      "arabic":
          "ٱلَّذِينَ ءَامَنُوا۟ وَتَطْمَئِنُّ قُلُوبُهُم بِذِكْرِ ٱللَّهِ ۗ أَلَا بِذِكْرِ ٱللَّهِ تَطْمَئِنُّ ٱلْقُلُوبُ",
      "translation": {
        "ur":
            "وہ لوگ جو ایمان لائے اور ان کے دل اللہ کے ذکر سے سکون پاتے ہیں، جان لو کہ اللہ کے ذکر سے ہی دل سکون پاتے ہیں۔",
        "hi":
            "वे लोग जो ईमान लाए और उनके दिल अल्लाह के ज़िक्र से सुकून पाते हैं, जान लो कि अल्लाह के ज़िक्र से ही दिल सुकून पाते हैं।",
        "en":
            "Those who have believed and whose hearts are assured by the remembrance of Allah. Unquestionably, by the remembrance of Allah hearts are assured."
      }
    },
    {
      "reference": "سورۃ الأنفال (8:2)",
      "arabic":
          "إِنَّمَا ٱلْمُؤْمِنُونَ ٱلَّذِينَ إِذَا ذُكِرَ ٱللَّهُ وَجِلَتْ قُلُوبُهُمْ وَإِذَا تُلِيَتْ عَلَيْهِمْ ءَايَٰتُهُۥ زَادَتْهُمْ إِيمَٰنًۭا وَعَلَىٰ رَبِّهِمْ يَتَوَكَّلُونَ",
      "translation": {
        "ur":
            "ایمان والے تو وہی ہیں جن کے دل اللہ کے ذکر سے لرز جاتے ہیں اور جب ان پر اس کی آیات پڑھی جاتی ہیں تو ان کا ایمان بڑھ جاتا ہے اور وہ اپنے رب پر بھروسہ کرتے ہیں۔",
        "hi":
            "ईमान वाले तो वही हैं जिनके दिल अल्लाह के ज़िक्र से कांप उठते हैं और जब उन पर उसकी आयतें पढ़ी जाती हैं तो उनका ईमान बढ़ जाता है और वे अपने रब पर भरोसा करते हैं।",
        "en":
            "The believers are only those who, when Allah is mentioned, their hearts become fearful, and when His verses are recited to them, it increases them in faith; and upon their Lord they rely."
      }
    },
    {
      "reference": "سورۃ البقرہ (2:200)",
      "arabic":
          "فَإِذَا قَضَيْتُم مَّنَٰسِكَكُمْ فَٱذْكُرُوا۟ ٱللَّهَ كَذِكْرِكُمْ ءَابَآءَكُمْ أَوْ أَشَدَّ ذِكْرًۭا ۗ فَمِنَ ٱلنَّاسِ مَن يَقُولُ رَبَّنَآ ءَاتِنَا فِى ٱلدُّنْيَا وَمَا لَهُۥ فِى ٱلْءَاخِرَةِ مِنْ خَلَٰقٍۢ",
      "translation": {
        "ur":
            "پھر جب تم اپنے مناسک ادا کر چکو تو اللہ کو یاد کرو جیسے تم اپنے باپ دادا کو یاد کرتے تھے بلکہ اس سے زیادہ۔ اور لوگوں میں سے کچھ ایسے ہیں جو کہتے ہیں: اے ہمارے رب، ہمیں دنیا میں عطا کر اور ان کے لیے آخرت میں کوئی حصہ نہیں۔",
        "hi":
            "फिर जब तुम अपने धार्मिक अनुष्ठानों को पूरा कर लो तो अल्लाह को याद करो जैसे तुम अपने पिता-पितामह को याद करते हो या उससे भी अधिक। और लोगों में से कुछ ऐसे हैं जो कहते हैं: हे हमारे रब, हमें दुनिया में दे और उनके लिए आख़िरत में कोई हिस्सा नहीं।",
        "en":
            "And when you have completed your rites, remember Allah like your [previous] remembrance of your fathers or with [much] greater remembrance. And among the people is he who says, 'Our Lord, give us in this world,' and he will have no share in the Hereafter."
      }
    }
  ],
  "Hadees": [
    {
      "reference": "Sahih al-Bukhari (52)",
      "arabic":
          "إِنَّ فِي الْجَسَدِ مُضْغَةً إِذَا صَلَحَتْ صَلَحَ الْجَسَدُ كُلُّهُ وَإِذَا فَسَدَتْ فَسَدَ الْجَسَدُ كُلُّهُ ۚ أَلَا وَهِيَ الْقَلْبُ",
      "translation": {
        "ur":
            "جسم میں ایک ٹکڑا گوشت کا ہے، اگر وہ درست ہو جائے تو پورا جسم درست ہو جاتا ہے، اور اگر وہ بگڑ جائے تو پورا جسم بگڑ جاتا ہے۔ وہ ٹکڑا دل ہے۔",
        "hi":
            "शरीर में एक टुकड़ा मांस का है, यदि वह सही हो जाए तो सारा शरीर सही हो जाता है, और यदि वह भ्रष्ट हो जाए तो सारा शरीर भ्रष्ट हो जाता है। वही टुकड़ा दिल है।",
        "en":
            "There is a piece of flesh in the body, if it becomes sound, the whole body becomes sound, and if it becomes corrupt, the whole body becomes corrupt. That piece is the heart."
      }
    },
    {
      "reference": "Sahih Muslim (738)",
      "arabic":
          "أَيَ عَائِشَةُ! مَائِيَ عَيْنَايَ تَنَامَانِ وَقَلْبِي لَا يَنَامُ.",
      "translation": {
        "ur": "اے عائشہ! میری آنکھیں سوتی ہیں اور میرا دل نہیں سوتا۔",
        "hi": "ऐ आयशा! मेरी आँखें सोती हैं और दिल नहीं सोता।",
        "en": "O Aisha! My eyes sleep, but my heart does not sleep."
      }
    },
    {
      "reference": "Sahih Muslim (2564)",
      "arabic":
          "إِنَّ اللَّهَ لَا يَنظُرُ إِلَىٰ صُورِكُمْ وَأَمْوَالِكُمْ وَلَٰكِن يَنظُرُ إِلَىٰ قُلُوبِكُمْ وَأَعْمَالِكُمْ",
      "translation": {
        "ur":
            "اللہ تمہاری شکلوں اور اموال کو نہیں دیکھتا، بلکہ وہ تمہارے دلوں اور اعمال کو دیکھتا ہے۔",
        "hi":
            "निस्संदेह, अल्लाह तुम्हारे रूप और संपत्ति को नहीं देखता, बल्कि वह तुम्हारे दिलों और कार्यों को देखता है।",
        "en":
            "Indeed, Allah does not look at your appearances or your wealth, but He looks at your hearts and your deeds."
      }
    },
    {
      "reference": "Sahih Muslim (2654)",
      "arabic":
          "إِنَّ الْقُلُوبَ بَيْنَ إِصْبَعَيْنِ مِنْ أَصَابِعِ اللَّهِ يَصْرِفُهَا كَيْفَ يَشَاءُ",
      "translation": {
        "ur":
            "دل اللہ کی دو انگلیوں کے درمیان ہیں؛ وہ جیسے چاہے انہیں پھیرتا ہے۔",
        "hi":
            "दिल अल्लाह की दो अंगुलियों के बीच होते हैं; वह जैसे चाहें उन्हें घुमा सकते हैं।",
        "en":
            "The hearts are between two fingers of Allah; He turns them as He wills."
      }
    },
    {
      "reference": "Sahih Bukhari (6405)",
      "arabic":
          "حَدَّثَنَا عَبْدُ اللَّهِ بْنُ مَسْلَمَةَ ، عَنْ مَالِكٍ ، عَنْ سُمَيٍّ ، عَنْ أَبِي صَالِحٍ ، عَنْ أَبِي هُرَيْرَةَ رَضِيَ اللَّهُ عَنْهُ ، أَنَّ رَسُولَ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ ، قَالَ : مَنْ قَالَ : سُبْحَانَ اللَّهِ وَبِحَمْدِهِ فِي يَوْمٍ مِائَةَ مَرَّةٍ ، حُطَّتْ خَطَايَاهُ ، وَإِنْ كَانَتْ مِثْلَ زَبَدِ الْبَحْرِ ",
      "translation": {
        "ur":
            " رسول اللہ صلی اللہ علیہ وسلم نے فرمایا ”جس نے «سبحان الله وبحمده‏.‏» دن میں سو مرتبہ کہا، اس کے گناہ معاف کر دئیے جاتے ہیں، خواہ سمندر کی جھاگ کے برابر ہی کیوں نہ ہوں۔",
        "hi":
            "हज़रत अबू हुरैरा (रज़ि.) से रिवायत है कि रसूल अल्लाह ﷺ ने फरमाया: जो शख्स सुभान अल्लाह व बिहम्दिही कहे, उसके गुनाह माफ़ कर दिए जाते हैं, चाहे वो समंदर के झाग के बराबर हों।",
        "en":
            " Narrated Abu Huraira: Allah's Apostle said, Whoever says, 'Subhan Allah wa bihamdihi,' one hundred times a day, will be forgiven all his sins even if they were as much as the foam of the sea."
      }
    },
    {
      "reference": "Sahih al-Bukhari (6407)",
      "arabic":
          "مَثَلُ الَّذِي يَذْكُرُ رَبَّهُ وَالَّذِي لَا يَذْكُرُ رَبَّهُ ، مَثَلُ الْحَيِّ وَالْمَيِّتِ",
      "translation": {
        "ur":
            "نبی کریم صلی اللہ علیہ وسلم نے فرمایا: 'اس شخص کی مثال جو اپنے رب کو یاد کرتا ہے اور اس کی مثال جو اپنے رب کو یاد نہیں کرتا زندہ اور مردہ جیسی ہے۔'",
        "hi":
            "नबी करीम (सल्लल्लाहु अलैहि वसल्लम) ने फरमाया: 'उस व्यक्ति की मिसाल जो अपने रब को याद करता है और उस व्यक्ति की जो अपने रब को याद नहीं करता, जीवित और मृत जैसी है।'",
        "en":
            "Narrated Abu Musa: The Prophet said, 'The example of the one who celebrates the Praises of his Lord (Allah) in comparison to the one who does not celebrate the Praises of his Lord, is that of a living creature compared to a dead one.'"
      }
    },
    {
      "reference": "Sahih Muslim (6832, Hadith 2675)",
      "arabic":
          "يَقُولُ اللَّهُ عَزَّ وَجَلَّ: أَنَا عِنْدَ ظَنِّ عَبْدِي، وَأَنَا مَعَهُ حِينَ يَذْكُرُنِي، فَإِنْ ذَكَرَنِي فِي نَفْسِهِ ذَكَرْتُهُ فِي نَفْسِي، وَإِنْ ذَكَرَنِي فِي مَلَإٍ ذَكَرْتُهُ فِي مَلَإٍ خَيْرٍ مِنْهُ، وَإِنِ اقْتَرَبَ إِلَيَّ شِبْرًا تَقَرَّبْتُ إِلَيْهِ ذِرَاعًا، وَإِنِ اقْتَرَبَ إِلَيَّْ ذِرَاعًا اقْتَرَبْتُ إِلَيْهِ بَاعًا، وَإِنْ أَتَانِي يَمْشِي أَتَيْتُهُ هَرْوَلَةً",
      "translation": {
        "ur":
            "رسول اللہ صلی اللہ علیہ وسلم نے فرمایا: اللہ عزوجل فرماتا ہے: 'میرا بندہ میرے بارے میں جو گمان کرتا ہے، تو میں (اس کو پورا کرنے کے لیے) اس کے پاس ہوتا ہوں اور جب وہ مجھے یاد کرتا ہے تو میں اس کے ساتھ ہوتا ہوں۔ اگر وہ مجھے اپنے دل میں یاد کرتا ہے تو میں اسے اپنے دل میں یاد کرتا ہوں، اگر وہ مجھے کسی مجلس میں یاد کرتا ہے تو میں اس کو ان لوگوں کی مجلس سے بہتر مجلس میں یاد کرتا ہوں، اگر وہ ایک بالشت میرے قریب ہوتا ہے تو میں ایک ہاتھ اس کے قریب ہو جاتا ہوں، اگر وہ ایک ہاتھ میرے قریب ہوتا ہے تو میں پھیلے ہوئے دونوں ہاتھوں کی لمبائی جتنا اس کے قریب ہو جاتا ہوں، اور اگر وہ چل کر میری طرف آتا ہے تو میں دوڑ کر اس کے پاس آتا ہوں۔'",
        "hi":
            "रसूल अल्लाह (सल्लल्लाहु अलैहि वसल्लम) ने फरमाया: अल्लाह फ़रमाता है: 'मेरा बंदा मेरे बारे में जैसा गुमान करता है, मैं उसके पास वैसा ही होता हूं। जब वह मुझे याद करता है, तो मैं उसके साथ होता हूं। अगर वह मुझे अपने दिल में याद करता है, तो मैं उसे अपने दिल में याद करता हूं। अगर वह मुझे किसी सभा में याद करता है, तो मैं उसे उससे बेहतर सभा में याद करता हूं। अगर वह मुझसे एक बालिश्त करीब होता है, तो मैं उससे एक हाथ करीब हो जाता हूं। अगर वह मुझसे एक हाथ करीब होता है, तो मैं उससे दोनों हाथों की लंबाई जितना करीब हो जाता हूं। अगर वह मेरी तरफ चलकर आता है, तो मैं उसकी तरफ दौड़कर आता हूं।'",
        "en":
            "Abu Huraira reported Allah's Messenger (peace be upon him) as saying that Allah, the Exalted and Glorious, stated: 'I live in the thought of My servant as he thinks about Me, and I am with him as he remembers Me. If he remembers Me in his heart, I also remember him in My Heart, and if he remembers Me in an assembly, I remember him in an assembly better than his. If he draws near Me by the span of a palm, I draw near him by the cubit. If he draws near Me by the cubit, I draw near him by the space of two hands. And if he walks towards Me, I rush towards him.'"
      }
    },
    {
      "reference": "Jam-e-Tirmazi (3375)",
      "arabic": "لَا يَزَالُ لِسَانُكَ رَطْبًا مِنْ ذِكْرِ اللَّهِ",
      "translation": {
        "ur":
            "ایک آدمی نے کہا: اللہ کے رسول! اسلام کے احکام و قوانین تو میرے لیے بہت ہیں، کچھ تھوڑی سی چیزیں مجھے بتا دیجئیے جن پر میں (مضبوطی) سے جما رہوں، آپ نے فرمایا: ”تمہاری زبان ہر وقت اللہ کی یاد اور ذکر سے تر رہے“۔",
        "hi":
            "एक व्यक्ति ने कहा: ऐ अल्लाह के रसूल! इस्लाम के नियम मेरे लिए बहुत ज़्यादा हो गए हैं, कृपया मुझे ऐसी कोई बात बताएं जिसे मैं मज़बूती से पकड़े रहूँ। आपने फरमाया: 'तुम्हारी ज़ुबान हमेशा अल्लाह की याद और ज़िक्र से तर रहनी चाहिए।'",
        "en":
            "`Abdullah bin Busr (ra) narrated that: A man said, 'O Messenger of Allah (ﷺ), indeed, the legislated acts of Islam have become too much for me, so inform me of a thing that I should stick to.' He (ﷺ) said, 'Let not your tongue cease to be moist with the remembrance of Allah.'"
      }
    },
    {
      "reference": "سنن الترمذی (حدیث 3384)",
      "arabic":
          "عَنْ أَنَسِ بْنِ مَالِكٍ قَالَ: قَالَ رَسُولُ اللَّهِ ﷺ: مَنْ أَحَبَّ فِي اللَّهِ فَلْيُذْكُرْهُ فِي قَلْبِهِ.",
      "translation": {
        "ur":
            "حضرت انس بن مالکؓ سے روایت ہے کہ رسول اللہ ﷺ نے فرمایا: جو شخص اللہ کے لیے محبت کرتا ہے، وہ اللہ کا ذکر اپنے دل میں کرے۔",
        "hi":
            "हज़रत अनस बिन मालिक (रज़ि.) से रिवायत है कि रसूल अल्लाह ﷺ ने फरमाया: जो शख्स अल्लाह के लिए मुहब्बत करता है, वह अल्लाह का ज़िक्र अपने दिल में करे।",
        "en":
            "Anas ibn Malik reported: The Messenger of Allah ﷺ said: Whoever loves for the sake of Allah, let him remember Him in his heart."
      }
    }
  ],
  "Aulia": [
    {
      "reference": "Nahj al-Balagha, Sermon 103 (Imam Ali)",
      "arabic": "إِنَّ قَلْبَ الْمُؤْمِنِ هُوَ مَلِكٌ",
      "translation": {
        "ur": "ایمان والے کا دل ایک بادشاہ ہے۔",
        "hi": "विश्वासी का दिल एक राजा है।",
        "en": "The heart of the believer is a king."
      }
    },
    {
      "reference": "Al-Hikam al-‘Ata’iyya by Ibn Ata Allah",
      "arabic":
          "قَلْبُكَ مَوْطِنُ الإِيمَانِ فَلاَ تُدَنِّسْهُ بِغَيْرِ ذِكْرِ الرَّحْمَنِ",
      "translation": {
        "ur":
            "تمہارا دل ایمان کا مقام ہے، اسے رحمان کے ذکر کے علاوہ کسی چیز سے آلودہ نہ کرو۔",
        "hi":
            "तुम्हारा दिल ईमान का स्थान है, इसे रहमान के ज़िक्र के अलावा किसी और चीज़ से गंदा मत करो।",
        "en":
            "Your heart is the abode of faith; do not stain it with anything other than the remembrance of the Most Merciful."
      }
    },
    {
      "reference": "Sufi Saint Jalaluddin Rumi",
      "arabic":
          "فَإِنَّ الْقَلْبَ مَثْلُ الْمِرْآةِ، يُصْقَلُ بِالذِّكْرِ وَيَتَغَيَّرُ بِالْغَفْلَةِ",
      "translation": {
        "ur":
            "بے شک دل آئینے کی مانند ہے، ذکر سے صاف ہوتا ہے اور غفلت سے دھندلا جاتا ہے۔",
        "hi":
            "निःसंदेह दिल एक दर्पण के समान है, जो ज़िक्र से साफ़ होता है और ग़फ़लत से धुंधला हो जाता है।",
        "en":
            "Indeed, the heart is like a mirror; it is polished by remembrance and tarnished by heedlessness."
      }
    },
    {
      "reference": "Imam al-Ghazali, Ihya Ulum al-Din",
      "arabic":
          "القَلْبُ مَلِكُ الجَسَدِ، إِذَا أَطَاعَ رَبَّهُ أَطَاعَتْ الجَوَارِحُ",
      "translation": {
        "ur":
            "دل جسم کا بادشاہ ہے، جب یہ اپنے رب کی اطاعت کرے تو اعضاء بھی اطاعت کرتے ہیں۔",
        "hi":
            "दिल शरीर का राजा है, जब यह अपने रब की आज्ञा का पालन करता है, तो अंग भी पालन करते हैं।",
        "en":
            "The heart is the king of the body; when it obeys its Lord, the limbs also obey."
      }
    },
    {
      "reference": "Hazrat Sultan Bahu (Kashf-ul-Asrar)",
      "arabic":
          "إِنَّ الْقَلْبَ هُوَ سِرُّ اللَّهِ فِي الإِنسَانِ، وَمَنْ عَرَفَ قَلْبَهُ عَرَفَ رَبَّهُ",
      "translation": {
        "ur":
            "دل انسان میں اللہ کا راز ہے، جو اپنے دل کو پہچان لے، وہ اپنے رب کو پہچان لیتا ہے۔",
        "hi":
            "दिल इंसान में अल्लाह का रहस्य है, जो अपने दिल को जान लेता है, वह अपने रब को जान लेता है।",
        "en":
            "The heart is Allah's secret within man; whoever knows his heart knows his Lord."
      }
    },
    {
      "reference": "Hazrat Abdul Qadir Jilani (Futuh al-Ghaib)",
      "arabic":
          "الْقَلْبُ بَابُ الْجَنَّةِ، وَمَنْ طَهَّرَ قَلْبَهُ دَخَلَ الْجَنَّةَ",
      "translation": {
        "ur":
            "دل جنت کا دروازہ ہے، جو اپنے دل کو پاک کرے گا وہ جنت میں داخل ہوگا۔",
        "hi":
            "दिल जन्नत का दरवाज़ा है, जो अपने दिल को पवित्र करता है वह जन्नत में दाखिल होगा।",
        "en":
            "The heart is the gateway to Paradise; whoever purifies his heart will enter Paradise."
      }
    },
    {
      "reference": "Hazrat Rabia Basri",
      "arabic":
          "مَنْ أَحَبَّ اللَّهَ بِقَلْبِهِ لَمْ يَبْقَ فِي قَلْبِهِ مَكَانٌ لِغَيْرِهِ",
      "translation": {
        "ur":
            "جو اپنے دل سے اللہ سے محبت کرتا ہے، اس کے دل میں کسی اور کے لیے جگہ باقی نہیں رہتی۔",
        "hi":
            "जो अपने दिल से अल्लाह से मोहब्बत करता है, उसके दिल में किसी और के लिए जगह नहीं रहती।",
        "en":
            "Whoever loves Allah with their heart, there remains no space in their heart for anyone else."
      }
    },
    {
      "reference": "Hazrat Shams Tabrizi",
      "arabic":
          "تَذْكُرُ اللَّهَ فِي قَلْبِكَ، فَتُصْبِحُ كُلُّ ذَرَّةٍ فِيكَ ذَاكِرَةً لِلَّهِ",
      "translation": {
        "ur":
            "جب تم اپنے دل میں اللہ کو یاد کرتے ہو، تو تمہاری ہر ذرے میں اللہ کا ذکر ہو جاتا ہے۔",
        "hi":
            "जब तुम अपने दिल में अल्लाह को याद करते हो, तो तुम्हारे हर कण में अल्लाह का ज़िक्र हो जाता है।",
        "en":
            "When you remember Allah in your heart, every atom within you becomes a remembrance of Allah."
      }
    },
    {
      "reference": "Jalaluddin Rumi (Masnavi-e-Ma'navi)",
      "arabic":
          "مَحَبَّةُ الْقَلْبِ لِلَّهِ نُورٌ يُطْفِئُ ظُلُمَاتِ الْأَنْفُسِ",
      "translation": {
        "ur":
            "اللہ کے لیے دل کی محبت ایک روشنی ہے جو نفس کی تاریکیوں کو مٹا دیتی ہے۔",
        "hi":
            "अल्लाह के लिए दिल का प्यार एक रोशनी है जो नफ़्स के अंधेरों को मिटा देता है।",
        "en":
            "The love of the heart for Allah is a light that extinguishes the darkness of the self."
      }
    },
    {
      "reference": "Hazrat Khwaja Moinuddin Chishti",
      "arabic":
          "لَا يَصْفُو الْقَلْبُ إِلَّا بِذِكْرِ اللَّهِ وَحُبِّ خَلْقِهِ",
      "translation": {
        "ur": "دل اللہ کے ذکر اور اس کی مخلوق سے محبت کے بغیر صاف نہیں ہوتا۔",
        "hi":
            "दिल अल्लाह के ज़िक्र और उसकी मख़लूक़ से मोहब्बत के बिना साफ नहीं होता।",
        "en":
            "The heart does not become pure except through the remembrance of Allah and love for His creation."
      }
    }
  ]
});

Referr ImamMehdi = Referr.fromJson({
  "Quran": [
    {
      "reference": "Surah Yaseen, Ayah 12 (Quran)",
      "arabic":
          "إِنَّا نَحۡنُ نُحۡيِ ٱلۡمَوۡتَىٰ وَنَكۡتُبُ مَا قَدَّمُواْ وَءَاثَٰرَهُمۡۚ وَكُلَّ شَيۡءٍ أَحۡصَيۡنَٰهُ فِيٓ إِمَامٖ مُّبِينٖ",
      "translation": {
        "ur":
            "یقیناً ہم ہی مردوں کو زندہ کریں گے، اور جو کچھ وہ آگے بھیج چکے ہیں اور ان کے نشان، ہم لکھتے ہیں، اور ہر چیز کو ہم نے امام مبین (امام مہدی) میں محفوظ کر دیا ہے۔",
        "hi":
            "निश्चित ही, हम ही मृतकों को जीवित करेंगे और जो कुछ वे आगे भेज चुके हैं और उनके निशान, हम लिखते हैं। और हर चीज़ को हमने इमाम मुबीन (इमाम मेहदी) में संचित कर दिया है।",
        "en":
            "Indeed, it is We who will bring the dead to life and record what they have sent ahead and their traces, and all things We have enumerated in Imam Mubin (Imam Mehdi)."
      }
    },
    {
      "reference": "Surah Hud, Ayah 93 (Quran)",
      "arabic":
          "وَيَٰقَوۡمِ ٱعۡمَلُواْ عَلَىٰ مَكَانَتِكُمۡ إِنِّي عَٰمِلٞۖ سَوۡفَ تَعۡلَمُونَ مَن يَأۡتِيهِ عَذَابٞ يُخۡزِيهِ وَمَنۡ هُوَ كَٰذِبٞۖ وَٱرۡتَقِبُوٓاْ إِنِّي مَعَكُمۡ رَقِيبٞ",
      "translation": {
        "ur":
            "اور اے میری قوم! اپنی جگہ عمل کرتے رہو، میں بھی عمل کر رہا ہوں، عنقریب تم جان لو گے کہ کس پر رسوا کرنے والا عذاب آتا ہے اور کون جھوٹا ہے، اور انتظار کرو (امام مہدی کا)، یقیناً میں بھی تمہارے ساتھ انتظار کرنے والوں میں ہوں۔",
        "hi":
            "और हे मेरी क़ौम! अपनी स्थिति पर कर्म करो, मैं भी कर्म कर रहा हूँ। शीघ्र ही तुम जान जाओगे कि किस पर अपमानजनक यातना आती है और कौन झूठा है। और प्रतीक्षा करो (इमाम महदी का), निस्संदेह मैं भी तुम्हारे साथ प्रतीक्षा करने वालों में हूँ।",
        "en":
            "And O my people, work according to your position; indeed, I am working. You will soon know to whom will come a punishment that will disgrace him and who is a liar. And wait (for Imam Mahdi), indeed, I am with you among those who wait."
      }
    },
    {
      "reference": "Surah Fussilat (41:53)",
      "arabic":
          "سَنُرِيهِمْ آيَاتِنَا فِي الْآفَاقِ وَفِي أَنْفُسِهِمْ حَتَّىٰ يَتَبَيَّنَ لَهُمْ أَنَّهُ الْحَقُّ ۗ أَوَلَمْ يَكْفِ بِرَبِّكَ أَنَّهُ عَلَىٰ كُلِّ شَيْءٍ شَهِيدٌ",
      "translation": {
        "ur":
            "ہم عنقریب اپنی نشانیاں آفاق میں اور ان کے اندر خود ان کے نفسوں میں دکھائیں گے یہاں تک کہ ان پر ظاہر ہوجائے گا کہ یہ حق ہے۔ کیا آپ کے رب کے لیے یہ کافی نہیں کہ وہ ہر چیز پر گواہ ہے؟",
        "hi":
            "हम उन्हें जल्द ही अपनी निशानियाँ क्षितिज में और उनके अपने भीतर दिखाएँगे, यहाँ तक कि यह उनके लिए स्पष्ट हो जाएगा कि यह सत्य है। क्या यह तुम्हारे रब के लिए पर्याप्त नहीं कि वह हर चीज़ पर गवाह है?",
        "en":
            "We will show them Our signs in the horizons and within themselves until it becomes clear to them that it is the truth. Is it not sufficient concerning your Lord that He is, over all things, a Witness?"
      }
    },
    {
      "reference": "Surah Al-Ma'idah, Ayat 54",
      "arabic":
          "يَا أَيُّهَا الَّذِينَ آمَنُوا۟ مَن يَرْتَدَّ مِنْكُمْ عَنْ دِينِهِۦ فَسَوْفَ يَأْتِى اللَّـهُ بِقَوْمٍ يُحِبُّونَهُۥ وَيُحِبُّونَهُۥ أَذِلَّةٍ عَلَى ٱلْمُؤْمِنِينَ أَعِزَّةٍ عَلَى ٱلْكَٰفِرِينَ يُجَٰهِدُونَ فِى سَبِيلِ اللَّـهِ وَلَا يَخَافُونَ لَوْمَتَ لَائِمٍ ۚ ذَٰلِكَ فَضْلُ اللَّـهِ يُؤْتِيهِ مَن يَشَاءُ ۚ وَٱللَّـهُ وَٰسِعٌ عَلِيمٌ",
      "translation": {
        "ur":
            "اے ایمان لانے والو! تم میں سے جو شخص اپنے دین سے پھر جائے گا، اللہ ایسا قوم لے آئے گا جو اللہ سے محبت رکھے گی اور اللہ بھی ان سے محبت کرے گا۔ وہ مسلمانوں کے ساتھ نرم ہوں گے اور کافروں کے ساتھ سخت۔ وہ اللہ کی راہ میں جہاد کریں گے اور کسی کی زبانی سرزنش سے نہیں ڈریں گے۔ یہ اللہ کا فضل ہے جسے چاہے عطا کرے۔ اور اللہ بڑا وسیع علم رکھنے والا ہے۔",
        "hi":
            "हे विश्वासियों! तुम में से जो कोई अपने धर्म से फिर जाएगा, तो अल्लाह एक ऐसी कौम ले आएगा, जो अल्लाह से प्रेम करेगी और अल्लाह भी उनसे प्रेम करेगा। वे मुसलमानों के साथ नर्म होंगे और काफ़िरों के साथ कठोर। वे अल्लाह की राह में जिहाद करेंगे और किसी की आलोचना से नहीं डरेंगे। यह अल्लाह का फ़ज़ल है, जिसे वह चाहता है देता है। और अल्लाह बड़ा व्‍यापक और जानकार है।",
        "en":
            "O you who have believed, whoever of you reverts from his religion – Allah will bring forth [in place of them] a people He will love and who will love Him, humble toward the believers, powerful against the disbelievers, they will strive in the cause of Allah and will not fear the blame of a critic. This is the favor of Allah; He gives it to whom He wills. And Allah is Munificent, All-Knowing."
      }
    },
    {
      "reference": "Quran (68:42)",
      "arabic":
          "يَوْمَ يُكْشَفُ عَن سَاقٍۢ وَيُدْعَوْنَ إِلَى ٱلسُّجُودِ فَلَا يَسْتَطِيعُونَ",
      "translation": {
        "ur":
            "جس دن پنڈلی کھول دی جائے گی اور انہیں سجدے کے لیے بلایا جائے گا، مگر وہ سجدہ نہیں کر سکیں گے۔",
        "hi":
            "जिस दिन पिंडली खोली जाएगी और उन्हें सजदे के लिए बुलाया जाएगा, लेकिन वे सजदा नहीं कर सकेंगे।",
        "en":
            "On the Day the Shin will be uncovered, and they will be called to prostrate, but they will not be able to."
      }
    }
  ],
  "Hadees": [
    {
      "reference": "Sunan Abu Dawood, Hadees 4285",
      "arabic":
          "حَدَّثَنَا سَهْلُ بْنُ تَمَّامِ بْنِ بَزِيعٍ، ‏‏‏‏‏‏حَدَّثَنَا عِمْرَانُ الْقَطَّانُ، ‏‏‏‏‏‏عَنْ قَتَادَةَ، ‏‏‏‏‏‏عَنْ أَبِي نَضْرَةَ، ‏‏‏‏‏‏عَنْ أَبِي سَعِيدٍ الْخُدْرِيِّ، ‏‏‏‏‏‏قَالَ:‏‏‏‏ قَالَ رَسُولُ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ:‏‏‏‏   الْمَهْدِيُّ مِنِّي أَجْلَى الْجَبْهَةِ أَقْنَى الْأَنْفِ يَمْلَأُ الْأَرْضَ قِسْطًا وَعَدْلًا كَمَا مُلِئَتْ جَوْرًا وَظُلْمًا يَمْلِكُ سَبْعَ سِنِينَ",
      "translation": {
        "ur":
            "رسول اللہ صلی اللہ علیہ وسلم نے فرمایا: میری اولاد میں سے کشادہ پیشانی، اونچی ناک والے ہوں گے، وہ روئے زمین کو عدل و انصاف سے بھر دیں گے، جیسے کہ وہ ظلم و جور سے بھر دی گئی ہے، ان کی حکومت سات سال تک رہے گی۔",
        "hi":
            "हज़रत अबू सईद अल-खुदरी ने बयान किया: नबी صلی ‌اللہ ‌علیہ ‌وسلم ने फ़रमाया: महदी मेरी नस्ल से होगा, उसका माथा चौड़ा होगा, नाक ऊँची होगी। वह धरती को न्याय और इंसाफ से भर देगा, जैसे कि वह अत्याचार और अन्याय से भर दी गई थी, और वह सात साल तक शासन करेगा।",
        "en":
            "Narrated Abu Saeed al-Khudri: The Prophet (ﷺ) said: The Mahdi will be of my stock, and will have a broad forehead and a prominent nose. He will fill the earth with equity and justice as it was filled with oppression and tyranny, and he will rule for seven years."
      }
    },
    {
      "reference": "Sunan Abu Dawood, Book 36, Hadith 4284",
      "arabic":
          "عَنْ أُمِّ سَلَمَةَ، قَالَتْ سَمِعْتُ رَسُولَ اللَّهِ صلى الله عليه وسلم يَقُولُ ‏ \"‏ الْمَهْدِيُّ مِنْ عِتْرَتِي مِنْ وَلَدِ فَاطِمَةَ ‏\"‏ ‏.‏",
      "translation": {
        "ur":
            "ام المؤمنین ام سلمہ رضی اللہ عنہا فرماتی ہیں کہ میں نے رسول اللہ ﷺ کو فرماتے ہوئے سنا: 'مہدی میری نسل سے اور فاطمہ کی اولاد سے ہوں گے۔'",
        "hi":
            "उम्मुल मोमिनीन उम्मे सलमा (र.अ) कहती हैं कि मैंने अल्लाह के रसूल ﷺ को फरमाते हुए सुना: 'मेहदी मेरी नस्ल से और फातिमा की औलाद से होंगे।'",
        "en":
            "Umm Salama (RA) narrated: I heard the Messenger of Allah ﷺ say, 'The Mahdi is of my lineage and of the descendants of Fatimah.'"
      },
    },
    {
      "reference": "Mishkat al-Masabih (Hadith 5453)",
      "arabic":
          "وَعَنْ أُمِّ سَلَمَةَ قَالَتْ: سَمِعْتُ رَسُولَ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ يَقُولُ: «عِتْرَتِي أَوْلَادِ فَاطِمَةَ» . رَوَاهُ أَبُو دَاوُد",
      "translation": {
        "ur":
            "ام سلمہ ؓ بیان کرتی ہیں ، میں نے رسول اللہ ﷺ کو فرماتے ہوئے سنا :’’ مہدی میری عترت ، فاطمہ ؓ کی اولاد سے ہو گا ۔‘‘ اسنادہ حسن ، رواہ ابوداؤد ۔",
        "hi":
            "उम्मे सलमा (रज़ियल्लाहु अन्हा) ने बयान किया, मैंने रसूलुल्लाह ﷺ को यह कहते हुए सुना: 'महदी मेरी इत्रत, फातिमा (रज़ियल्लाहु अन्हा) की औलाद से होंगे।' सन्नादा हसन, रवा-हु अबू दाऊद।",
        "en":
            "Umm Salama (RA) narrated: I heard the Messenger of Allah (ﷺ) saying: 'The Mahdi will be from my family, from the descendants of Fatimah (RA).' (Isnad: Hasan, narrated by Abu Dawood)."
      }
    },
    {
      "reference": "Sunan Abu Dawood, Hadees 4282",
      "arabic":
          "حَدَّثَنَا مُسَدَّدٌ، ‏‏‏‏‏‏أَنَّ عُمَرَ بْنَ عُبَيْدٍ حَدَّثَهُمْ. ح وَحَدَّثَنَا مُحَمَّدُ بْنُ الْعَءِ، ‏‏‏‏‏‏حَدَّثَنَا أَبُو بَكْرٍ يَعْنِي ابْنَ عَيَّاشٍ. ح وَحَدَّثَنَا مُسَدَّدٌ، ‏‏‏‏‏‏حَدَّثَنَا يَحْيَى، ‏‏‏‏‏‏عَنْ سُفْيَانَ. ح وَحَدَّثَنَا أَحْمَدُ بْنُ إِبْرَاهِيمَ، ‏‏‏‏‏‏حَدَّثَنَا عُبَيْدُ اللَّهِ بْنُ مُوسَى، ‏‏‏‏‏‏أَخْبَرَنَا زَائِدَةُ. ح وَحَدَّثَنَا أَحْمَدُ بْنُ إِبْرَاهِيمَ، ‏‏‏‏‏‏حَدَّثَنِي عُبَيْدُ اللَّهِ بْنُ مُوسَى، ‏‏‏‏‏‏عَنْ فِطْرٍ، ‏‏‏‏‏‏الْمَعْنَى وَاحِدٌ كُلُّهُمْ، ‏‏‏‏‏‏عَنْ عَاصِمٍ، ‏‏‏‏‏‏عَنْ زِرٍّ، ‏‏‏‏‏‏عَنْعَبْدِ اللَّهِ، ‏‏‏‏‏‏عَنِ النَّبِيِّ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ، ‏‏‏‏‏‏قَالَ:‏‏‏‏   لَوْ لَمْ يَبْقَ مِنَ  إِلَّا يَوْمٌ، ‏‏‏‏‏‏قَالَ:‏‏‏‏ زَائِدَةُ فِي حَدِيثِهِ لَطَوَّلَ اللَّهُ ذَلِكَ الْيَوْمَ، ‏‏‏‏‏‏ثُمَّ اتَّفَقُوا:‏‏‏‏  يَبْعَثَ فِيهِ رَجُلًا مِنِّي أَوْ      اسْمِي وَاسْمُ أَبِيهِ اسْمَ أَبِي زَادَ فِي حَدِيثِ فِطْرٍ يَمْلَأُ الْأَرْضَ قِسْطًا وَعَدْلًا كَمَا مُلِئَتْ ظُلْمًا وَجَوْرًا، ‏‏‏‏‏‏وَقَالَ فِي حَدِيثِ سُفْيَانَ:‏‏‏‏   أَوْ  تَنْقَضِي           اسْمِي  ",
      "translation": {
        "ur":
            "نبی اکرم صلی اللہ علیہ وسلم نے فرمایا: اگر دنیا کا ایک دن بھی رہ جائے گا تو اللہ تعالیٰ اس دن کو لمبا کر دے گا، یہاں تک کہ اس میں ایک شخص کو مجھ سے یا میرے اہل بیت میں سے اس طرح کا برپا کرے گا کہ اس کا نام میرے نام پر، اور اس کے والد کا نام میرے والد کے نام پر ہو گا، وہ عدل و انصاف سے زمین کو بھر دے گا، جیسا کہ وہ ظلم و جور سے بھر دی گئی ہے ۔ سفیان کی روایت میں ہے: دنیا نہیں جائے گی یا ختم نہیں ہو گی تاآنکہ عربوں کا مالک ایک ایسا شخص ہو جائے گا جو میرے اہل بیت میں سے ہو گا اس کا نام میرے نام کے موافق ہو گا ۔",
        "hi":
            "रसूलुल्लाह صلی ‌اللہ ‌علیہ ‌وسلم ने फरमाया: अगर दुनिया का एक दिन भी रह जाए तो अल्लाह उस दिन को लंबा कर देगा, यहाँ तक कि उस दिन में मेरे या मेरे अहल-ए-बैत में से एक शख्स को ऐसा भेजेगा कि उसका नाम मेरे नाम के जैसा होगा और उसके पिता का नाम मेरे पिता के नाम के जैसा होगा, वह धरती को न्याय और इंसाफ से भर देगा, जैसे कि वह ظلم और अत्याचार से भर दी गई थी। सुफ़यान की रिवायत में है: दुनिया खत्म नहीं होगी या खत्म नहीं होगी जब तक कि अरबों के पास एक ऐसा शख्स न हो, जो मेरे अहल-ए-बैत में से हो और उसका नाम मेरे नाम के अनुसार हो।",
        "en":
            "Narrated Abdullah ibn Masud: The Prophet (ﷺ) said: If only one day of this world remained. Allah would lengthen that day (according to the version of Zaidah), till He raised up in it a man who belongs to me or to my family whose father's name is the same as my father's, who will fill the earth with equity and justice as it has been filled with oppression and tyranny (according to the version of Fitr). Sufyan's version says: The world will not pass away before the Arabs are ruled by a man of my family whose name will be the same as mine."
      }
    },
    {
      "reference": "Jami' at-Tirmidhi, Vol. 4, Book 7, Hadith 2230",
      "arabic":
          "عَنْ عَبْدِ اللَّهِ، قَالَ رَسُولُ اللَّهِ ﷺ ‏: \"‏ لَا تَذْهَبُ الدُّنْيَا حَتَّى يَمْلِكَ الْعَرَبَ رَجُلٌ مِنْ أَهْلِ بَيْتِي يُوَاطِئُ اسْمُهُ اسْمِي وَاسْمُ أَبِيهِ اسْمُ أَبِي",
      "translation": {
        "ur":
            "حضرت عبد اللہ رضی اللہ عنہ سے روایت ہے کہ رسول اللہ ﷺ نے فرمایا: دنیا ختم نہیں ہوگی یہاں تک کہ میرے اہل بیت میں سے ایک شخص حکمرانی کرے جن کا نام میرے نام جیسا ہوگا اور ان کے والد کا نام میرے والد کے نام جیسا ہوگا۔",
        "hi":
            "हज़रत अब्दुल्लाह (र.अ) से रिवायत है कि रसूल अल्लाह ﷺ ने फरमाया: दुनिया खत्म नहीं होगी जब तक मेरे अहल-ए-बैत में से एक व्यक्ति हुकूमत न करे, जिसका नाम मेरे नाम जैसा और उसके पिता का नाम मेरे पिता के नाम जैसा होगा।",
        "en":
            "Abdullah (RA) narrated that the Messenger of Allah ﷺ said: The world will not pass away until a man from my family rules over the Arabs. His name will be like my name, and his father's name will be like my father's name."
      }
    },
    {
      "reference": "Musnad Ahmad, Hadees: 11212",
      "arabic":
          "حَدَّثَنَا  ابْنُ نُمَيْرٍ ، حَدَّثَنَا  مُوسَى يَعْنِي الْجُهَنِيَّ ، قَالَ: سَمِعْتُ  زَيْدًا الْعَمِّيَّ ، قَالَ: حَدَّثَنَا  أَبُو الصِّدِّيقِ النَّاجِيُّ ، قَالَ: سَمِعْتُ  أَبَا سَعِيدٍ الْخُدْرِيَّ ، قَالَ: قَالَ النَّبِيُّ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ:\" يَكُونُ مِنْ   فَإِنْ طَالَ عُمْرُهُ أَوْ قَصُرَ عُمْرُهُ عَاشَ سَبْعَ سِنِينَ، أَوْ ثَمَانِ سِنِينَ، أَوْ تِسْعَ سِنِينَ، يَمْلَأُ الْأَرْضَ قِسْطًا وَعَدْلًا، وَتُخْرِجُ الْأَرْضُ نَبَاتَهَا، وَتُمْطِرُ السَّمَاءُ قَطْرَهَا\".",
      "translation": {
        "ur":
            "حضرت ابوسعید خدری رضی اللہ عنہ سے مروی ہے کہ ایک مرتبہ آپ صلی اللہ علیہ وسلم نے فرمایا میری امت میں مہدی آئے گا جو سات، آٹھ یا نوسال رہے گا، زمین کو عدل و انصاف سے بھر دے گا، اس زمانے میں اللہ تعالیٰ آسمان سے خوب بارش برسائے گا اور زمین اپنی تمام پیداوار اگائے گی",
        "hi":
            "हज़रत अबू सईद ख़ुदरी رضي الله عنهم से रिवायत है कि एक बार आप صلی اللہ علیہ وسلم ने फरमाया कि मेरी उम्मत में महदी आएगा जो सात, आठ या नौ साल रहेगा, ज़मीन को इंसाफ और न्याय से भर देगा, उस समय अल्लाह तआला आसमान से खूब बारिश भेजेगा और ज़मीन अपनी सारी पैदावार उगाएगी।",
        "en":
            "It is narrated from Abu Sa'id al-Khudri that the Prophet (ﷺ) said: A Mahdi will come in my Ummah who will live for seven, eight, or nine years. He will fill the earth with justice and fairness, and in his time, Allah will send abundant rain from the sky, and the earth will yield all its crops."
      }
    },
    {
      "reference": "Sunan Abi Dawood (Hadith 4284)",
      "arabic": "الْمَهْدِيُّ مِنْ عِتْرَتِي، مِنْ وَلَدِ فَاطِمَةَ",
      "translation": {
        "ur": "مہدی میری عترت میں سے ہیں، فاطمہ کے بیٹوں میں سے۔",
        "hi": "महदी मेरी इत्रत में से हैं, फातिमा के वंशजों में से।",
        "en":
            "The Mahdi will be from my family, from the descendants of Fatimah."
      }
    },
    {
      "reference": "Sahih Bukhari (7436)",
      "arabic":
          "حَدَّثَنَا مُسَدَّدٌ ، قَالَ : حَدَّثَنَا يَحْيَى ، عَنْ إِسْمَاعِيلَ ، حَدَّثَنَا قَيْسٌ ، قَالَ لِي جَرِيرُ بْنُ عَبْدِ اللَّهِ : كُنَّا عِنْدَ النَّبِيِّ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ إِذْ نَظَرَ إِلَى الْقَمَرِ لَيْلَةَ الْبَدْرِ ، فَقَالَ : أَمَا إِنَّكُمْ سَتَرَوْنَ رَبَّكُمْ كَمَا تَرَوْنَ هَذَا ، لَا تُضَامُّونَ أَوْ لَا تُضَاهُونَ فِي رُؤْيَتِهِ ، فَإِنِ اسْتَطَعْتُمْ أَنْ لَا تُغْلَبُوا عَلَى صَلَاةٍ قَبْلَ طُلُوعِ الشَّمْسِ وَقَبْلَ غُرُوبِهَا فَافْعَلُوا ، ثُمَّ قَالَ : وَسَبِّحْ بِحَمْدِ رَبِّكَ قَبْلَ طُلُوعِ الشَّمْسِ وَقَبْلَ غُرُوبِهَا سورة طه آية 130",
      "translation": {
        "ur":
            "ہم نبی کریم صلی اللہ علیہ وسلم کی خدمت میں حاضر تھے آپ صلی اللہ علیہ وسلم نے چاند کی طرف نظر اٹھائی جو چودھویں رات کا تھا۔ پھر فرمایا کہ تم لوگ بے ٹوک اپنے رب کو اسی طرح دیکھو گے جیسے اس چاند کو دیکھ رہے ہو ( اسے دیکھنے میں تم کو کسی قسم کی بھی مزاحمت نہ ہو گی ) یا یہ فرمایا کہ تمہیں اس کے دیدار میں مطلق شبہ نہ ہو گا اس لیے اگر تم سے سورج کے طلوع اور غروب سے پہلے کی نمازوں کے پڑھنے میں کوتاہی نہ ہو سکے تو ایسا ضرور کرو۔ پھر آپ صلی اللہ علیہ وسلم نے یہ آیت تلاوت فرمائی «فسبح بحمد ربك قبل طلوع الشمس وقبل غروبها» ”پس اپنے رب کے حمد کی تسبیح پڑھ سورج کے نکلنے اور اس کے غروب ہونے سے پہلے۔“ امام ابوعبداللہ بخاری رحمہ اللہ نے کہا کہ ابن شہاب نے اسماعیل کے واسطہ سے جو قیس سے بواسطہ جریر ( راوی ہیں ) یہ زیادتی نقل کی کہ نبی کریم صلی اللہ علیہ وسلم نے فرمایا ”تم اپنے رب کو صاف دیکھو گے“۔",
        "hi":
            "हम नबी करीम ﷺ की सेवा में उपस्थित थे, आपने चाँद की ओर नज़र उठाई जो चौदहवीं रात का था। फिर कहा कि तुम लोग बिना किसी परेशानी के अपने रब को इस चाँद की तरह देखोगे (इसको देखने में कोई समस्या नहीं होगी)। या यह कहा कि तुम्हें इस के देखने में कोई संदेह नहीं होगा। इसलिए अगर तुम सूरज के उगने और अस्त होने से पहले (फ़जर और असर) की नमाज़ में कोई कोताही न कर सको तो ऐसा जरूर करो। फिर आपने यह आयत पढ़ी: «फसबِّح बहमदी रबिक क़बल तूलूअि शम्सि वक़बल गु़रूबि हा» (फिर सूरज के उगने और अस्त होने से पहले अपने रब की तस्बीह पढ़ो)। इमाम अबू अब्दुल्लाह बुखारी ने कहा कि इब्नु शहाब ने इस्माईल के द्वारा जो क़ैस से बाएस जरीर (रावी हैं) यह अतिरिक्त बात सुनाई कि नबी करीम ﷺ ने कहा, 'तुम अपने रब को स्पष्ट रूप से देखोगे'।",
        "en":
            "We were with the Prophet on a full moon night. He looked at the moon and said, 'You will certainly see your Lord as you see this moon, and there will be no trouble in seeing Him. So if you can avoid missing (through sleep, business, etc.) a prayer before the rising of the sun (Fajr) and before its setting (Asr), you must do so.' He (the Prophet) then recited the following verse: 'And celebrate the praises of Your Lord before the rising of the sun and before its setting.' Imam Abu Abdullah Bukhari said that Ibn Shihab reported through Ismail, from Qais, through Jarir that the Prophet ﷺ said: 'You will see your Lord clearly.'"
      }
    },
    {
      "reference": "Sahih Bukhari (573)",
      "arabic":
          "حَدَّثَنَا مُسَدَّدٌ ، قَالَ : حَدَّثَنَا يَحْيَى ، عَنْ إِسْمَاعِيلَ ، حَدَّثَنَا قَيْسٌ ، قَالَ لِي جَرِيرُ بْنُ عَبْدِ اللَّهِ : كُنَّا عِنْدَ النَّبِيِّ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ إِذْ نَظَرَ إِلَى الْقَمَرِ لَيْلَةَ الْبَدْرِ ، فَقَالَ : أَمَا إِنَّكُمْ سَتَرَوْنَ رَبَّكُمْ كَمَا تَرَوْنَ هَذَا ، لَا تُضَامُّونَ أَوْ لَا تُضَاهُونَ فِي رُؤْيَتِهِ ، فَإِنِ اسْتَطَعْتُمْ أَنْ لَا تُغْلَبُوا عَلَى صَلَاةٍ قَبْلَ طُلُوعِ الشَّمْسِ وَقَبْلَ غُرُوبِهَا فَافْعَلُوا ، ثُمَّ قَالَ : وَسَبِّحْ بِحَمْدِ رَبِّكَ قَبْلَ طُلُوعِ الشَّمْسِ وَقَبْلَ غُرُوبِهَا سورة طه آية 130",
      "translation": {
        "ur":
            "ہم نبی کریم صلی اللہ علیہ وسلم کی خدمت میں حاضر تھے آپ صلی اللہ علیہ وسلم نے چاند کی طرف نظر اٹھائی جو چودھویں رات کا تھا۔ پھر فرمایا کہ تم لوگ بے ٹوک اپنے رب کو اسی طرح دیکھو گے جیسے اس چاند کو دیکھ رہے ہو ( اسے دیکھنے میں تم کو کسی قسم کی بھی مزاحمت نہ ہو گی ) یا یہ فرمایا کہ تمہیں اس کے دیدار میں مطلق شبہ نہ ہو گا اس لیے اگر تم سے سورج کے طلوع اور غروب سے پہلے ( فجر اور عصر ) کی نمازوں کے پڑھنے میں کوتاہی نہ ہو سکے تو ایسا ضرور کرو۔ ( کیونکہ ان ہی کے طفیل دیدار الٰہی نصیب ہو گا یا ان ہی وقتوں میں یہ رویت ملے گی ) پھر آپ صلی اللہ علیہ وسلم نے یہ آیت تلاوت فرمائی «فسبح بحمد ربك قبل طلوع الشمس وقبل غروبها» ”پس اپنے رب کے حمد کی تسبیح پڑھ سورج کے نکلنے اور اس کے غروب ہونے سے پہلے۔“ امام ابوعبداللہ بخاری رحمہ اللہ نے کہا کہ ابن شہاب نے اسماعیل کے واسطہ سے جو قیس سے بواسطہ جریر ( راوی ہیں ) یہ زیادتی نقل کی کہ نبی کریم صلی اللہ علیہ وسلم نے فرمایا ”تم اپنے رب کو صاف دیکھو گے“۔",
        "hi":
            "हम नबी करीम ﷺ की सेवा में उपस्थित थे, आपने चाँद की ओर नज़र उठाई जो चौदहवीं रात का था। फिर कहा कि तुम लोग बिना किसी परेशानी के अपने रब को इस चाँद की तरह देखोगे (इसको देखने में कोई समस्या नहीं होगी)। या यह कहा कि तुम्हें इस के देखने में कोई संदेह नहीं होगा। इसलिए अगर तुम सूरज के उगने और अस्त होने से पहले (फ़जर और असर) की नमाज़ में कोई कोताही न कर सको तो ऐसा जरूर करो। फिर आपने यह आयत पढ़ी: «फसबِّح बहमदी रबिक क़बल तूलूअि शम्सि वक़बल गु़रूबि हा» (फिर सूरज के उगने और अस्त होने से पहले अपने रब की तस्बीह पढ़ो)। इमाम अबू अब्दुल्लाह बुखारी ने कहा कि इब्नु शहाब ने इस्माईल के द्वारा जो क़ैस से बाएस जरीर (रावी हैं) यह अतिरिक्त बात सुनाई कि नबी करीम ﷺ ने कहा, 'तुम अपने रब को स्पष्ट रूप से देखोगे'।",
        "en":
            "We were with the Prophet on a full moon night. He looked at the moon and said, 'You will certainly see your Lord as you see this moon, and there will be no trouble in seeing Him. So if you can avoid missing (through sleep, business, etc.) a prayer before the rising of the sun (Fajr) and before its setting (Asr), you must do so.' He (the Prophet) then recited the following verse: 'And celebrate the praises of Your Lord before the rising of the sun and before its setting.' Imam Abu Abdullah Bukhari said that Ibn Shihab reported through Ismail, from Qais, through Jarir that the Prophet ﷺ said: 'You will see your Lord clearly.'"
      }
    },
    // {
    //   "reference": "Al-Kafi, Hadith 1/358",
    //   "arabic":
    //       "يُرَى وَجْهُ قَائِمِ آلِ مُحَمَّدٍ فِي الْقَمَرِ وَيَظْهَرُ يَدٌ تَكُونُ مَعَهُ",
    //   "translation": {
    //     "ur":
    //         "آل محمد کے قائم کا چہرہ چاند پر دکھائی دے گا اور ایک ہاتھ ظاہر ہوگا جو ان کے ساتھ ہوگا۔",
    //     "hi":
    //         "आल मुहम्मद के क़ाइंम का चेहरा चाँद पर दिखाई देगा और एक हाथ प्रकट होगा जो उनके साथ होगा।",
    //     "en":
    //         "The face of the Qaim of the family of Muhammad will appear on the moon, and a hand will appear with him."
    //   }
    // },
    {
      "reference": "Sunan Ibn Majah (Hadith 4085)",
      "arabic":
          "يَخْرُجُ الْمَهْدِيُّ فِي آخِرِ الزَّمَانِ، يَمْلَأُ الأَرْضَ قِسْطًا وَعَدْلًا، كَمَا مُلِئَتْ ظُلْمًا وَجَوْرًا",
      "translation": {
        "ur":
            "مہدی آخری زمانے میں ظاہر ہوں گے، زمین کو عدل و انصاف سے بھر دیں گے جیسے یہ ظلم و جور سے بھر چکی ہوگی۔",
        "hi":
            "महदी आखिरी समय में प्रकट होंगे, और पृथ्वी को न्याय और इंसाफ से भर देंगे जैसे यह अन्याय और अत्याचार से भरी हुई थी।",
        "en":
            "The Mahdi will emerge in the last days, filling the Earth with justice and fairness as it was filled with injustice and tyranny."
      }
    },
    {
      "reference": "Sahih Muslim (Hadith 2339)",
      "arabic":
          "وَحَدَّثَنَا قُتَيْبَةُ بْنُ سَعِيدٍ ، حَدَّثَنَا يَعْقُوبُ وَهُوَ ابْنُ عَبْدِ الرَّحْمَنِ الْقَارِيُّ ، عَنْ سُهَيْلٍ ، عَنْ أَبِيهِ ، عَنْ أَبِي هُرَيْرَةَ ، أَنّ رَسُولَ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ، قَالَ: لَا تَقُومُ السَّاعَةُ حَتَّى يَكْثُرَ الْمَالُ وَيَفِيضَ، حَتَّى يَخْرُجَ الرَّجُلُ بِزَكَاةِ مَالِهِ، فَلَا يَجِدُ أَحَدًا يَقْبَلُهَا مِنْهُ، وَحَتَّى تَعُودَ أَرْضُ الْعَرَبِ مُرُوجًا وَأَنْهَارًا.",
      "translation": {
        "ur":
            "سہیل کے والد ( ابو صالح ) نے حضرت ابو ہریرہ رضی اللہ تعالیٰ عنہ سے روایت کی کہ رسول اللہ صلی اللہ علیہ وسلم نے فرمایا 'قیامت قائم نہیں ہو گی یہاں تک کہ مال بڑھ جائے گا اور (پانی کی طرح) بہنے لگے گا اور آدمی اپنے مال کی زکاۃ لے کر نکلے گا تو اسے ایک شخص بھی نہیں ملے گا جو اسے اس کی طرف سے قبول کر لے اور یہاں تک کہ عرب کی سرزمین دوبارہ چراگاہوں اور نہروں میں بدل جائے گی۔'",
        "hi":
            "सूहैल के पिता (अबू सालेह) ने हज़रत अबू हुरैरा (رضی اللہ عنہ) से रिवायत की कि रसूलुल्लाह ﷺ ने फरमाया 'क़ियामत क़ायम नहीं होगी जब तक माल बहुत बढ़ न जाए और वह बहने न लगे, और एक आदमी अपना माल की ज़कात लेकर निकलेगा तो उसे कोई ऐसा नहीं मिलेगा जो उसे स्वीकार करे, और यहाँ तक कि अरब की ज़मीन फिर से चरागाहों और नहरों में बदल जाएगी।'",
        "en":
            "Abu Huraira reported Allah's Messenger (peace be upon him) as saying: The Last Hour will not come before wealth becomes abundant and overflowing, so much so that a man takes Zakat out of his property and cannot find anyone to accept it from him, and till the land of Arabia becomes meadows and rivers."
      }
    },
    {
      "reference": "Kitab al-Ghaiba ",
      "arabic": "وجه الإمام المهدي عليه السلام سيتألق على القمر.",
      "translation": {
        "ur": "امام مہدی کا چہرہ چاند پر چمکے گا۔",
        "hi": "इमाम महदी का चेहरा चाँद पर चमकेगा।",
        "en": "Imam Mahdi's face will shine on the moon."
      }
    },

    // {
    //   "reference": "Al-Balad Al-amin, Hadith 8",
    //   "arabic": "يُرَى وَجْهُ قَائِمِ آلِ مُحَمَّدٍ فِي الْقَمَرِ",
    //   "translation": {
    //     "ur": "قائم آل محمد کا چہرہ چاند پر دکھائی دے گا۔",
    //     "hi": "आल मुहम्मद के क़ाइंम का चेहरा चाँद पर दिखाई देगा।",
    //     "en":
    //         "The face of the Qaim of the family of Muhammad will appear on the moon."
    //   }
    // }
  ],
  "Aulia": [
    {
      "reference": "Imam Hasan al-Askari (AS)",
      "arabic":
          "الإمام المهدي من ذريتي، يملأ الأرض قسطًا وعدلًا كما ملئت ظلمًا وجورًا.",
      "translation": {
        "ur":
            "امام مہدی میری نسل سے ہیں، وہ زمین کو انصاف اور عدل سے بھر دیں گے جیسے وہ ظلم اور جور سے بھری ہوئی تھی۔",
        "hi":
            "इमाम महदी मेरी नस्ल से हैं, वह पृथ्वी को न्याय और सत्य से भर देंगे जैसे वह अत्याचार और अन्याय से भरी हुई थी।",
        "en":
            "The Mahdi is from our family, and he will be the savior of humanity. The earth will be filled with peace and justice when he emerges."
      }
    },
    {
      "reference": "Ibn Arabi",
      "arabic":
          "الإمام المهدي ليس غريبًا، لكنه مخفي. عندما يظهر، سيجلب العدالة الإلهية ويعيد العالم إلى ما كان عليه.",
      "translation": {
        "ur":
            "امام مہدی اجنبی نہیں ہیں، بلکہ وہ مخفی ہیں۔ جب وہ ظاہر ہوں گے، تو وہ الہی انصاف لائیں گے اور دنیا کو وہیں واپس لے آئیں گے جہاں یہ پہلے تھا۔",
        "hi":
            "इमाम महदी अजनबी नहीं हैं, बल्कि वह छिपे हुए हैं। जब वह प्रकट होंगे, तो वह दिव्य न्याय लाएंगे और दुनिया को पहले जैसा वापस ले आएंगे।",
        "en":
            "The Mahdi is not a stranger, but he is hidden. His appearance will bring forth divine justice, bringing the world back to the way it was meant to be."
      }
    },
    {
      "reference": "Shaykh Abdul Qadir Jilani",
      "arabic":
          "سيظهر الإمام المهدي عندما يفقد الناس الأمل. سوف يظهر كنور ساطع ويقود الناس إلى العدالة. ستجلب قيادته السلام والنظام على الأرض.",
      "translation": {
        "ur":
            "امام مہدی اس وقت ظاہر ہوں گے جب لوگ امید کھو چکے ہوں گے۔ وہ ایک چمکتا ہوا نور بن کر ظاہر ہوں گے اور لوگوں کو انصاف کی طرف رہنمائی کریں گے۔ ان کی قیادت سے زمین پر امن اور نظام قائم ہوگا۔",
        "hi":
            "इमाम महदी तब प्रकट होंगे जब लोग आशा खो चुके होंगे। वह एक चमकते हुए प्रकाश के रूप में प्रकट होंगे और लोगों को न्याय की ओर मार्गदर्शन करेंगे। उनकी नेतृत्व से पृथ्वी पर शांति और व्यवस्था आएगी।",
        "en":
            "The Mahdi will rise when the people have lost hope. He will appear as a shining light and will guide the people to justice. His leadership will bring peace and order to the earth."
      }
    },
    {
      "reference": "Mawlana Rumi",
      "arabic":
          "الإمام المهدي هو الذي سيملأ الأرض بالسلام والمحبة. في عهد حكمه، سيختفي جميع أشكال الظلم والاضطهاد.",
      "translation": {
        "ur":
            "امام مہدی وہ ہیں جو زمین کو امن اور محبت سے بھر دیں گے۔ ان کے عہد میں تمام ظلم اور جبر کی شکلیں ختم ہو جائیں گی۔",
        "hi":
            "इमाम महदी वह हैं जो पृथ्वी को शांति और प्रेम से भर देंगे। उनके शासनकाल में सभी प्रकार के अन्याय और उत्पीड़न समाप्त हो जाएंगे।",
        "en":
            "The Mahdi is the one who will bring harmony to the earth and the hearts of men. In his presence, all forms of oppression and injustice will cease, and a new era of peace will begin."
      }
    },
    {
      "reference": "Imam al-Sadiq (AS)",
      "arabic":
          "الإمام المهدي هو الذي سيقود الناس إلى الطريق الصحيح عندما تكون الأرض مليئة بالظلم والطغيان. سيخلصهم من جميع أعدائهم ويسيطر على الأرض.",
      "translation": {
        "ur":
            "امام مہدی وہ ہیں جو لوگوں کو صحیح راستے پر لے جائیں گے جب زمین ظلم اور جبر سے بھری ہوئی ہوگی۔ وہ ان کے تمام دشمنوں سے انہیں نجات دیں گے اور زمین پر حکمرانی کریں گے۔",
        "hi":
            "इमाम महदी वह हैं जो लोगों को सही रास्ते पर ले जाएंगे जब पृथ्वी अत्याचार और अन्याय से भरी होगी। वह उनके सभी दुश्मनों से उन्हें मुक्ति देंगे और पृथ्वी पर शासन करेंगे।",
        "en":
            "The Mahdi will emerge when the earth is filled with corruption and tyranny. He will rid the world of all evildoers and establish justice and fairness, where no one will be oppressed."
      }
    },
    {
      "reference": "Imam Ali Zayn al-Abidin (AS)",
      "arabic":
          "الإمام المهدي هو الذي سيقود العالم بعد الظلم والطغيان ويحقق العدل والسلام في الأرض.",
      "translation": {
        "ur":
            "امام مہدی وہ ہیں جو ظلم اور جبر کے بعد دنیا کی قیادت کریں گے اور زمین پر عدل اور امن قائم کریں گے۔",
        "hi":
            "इमाम महदी वह हैं जो अत्याचार और अन्याय के बाद पृथ्वी पर न्याय और शांति स्थापित करेंगे।",
        "en":
            "The Mahdi will be a man who is divinely chosen to lead the world in an era where tyranny, oppression, and injustice are widespread. His reign will be characterized by justice, peace, and guidance."
      }
    }
  ]
});


Referr ocultation = Referr.fromJson({
  "Quran": [
 {
      "reference": "Surah Hud, Ayah 93 (Quran)",
      "arabic":
          "وَيَٰقَوۡمِ ٱعۡمَلُواْ عَلَىٰ مَكَانَتِكُمۡ إِنِّي عَٰمِلٞۖ سَوۡفَ تَعۡلَمُونَ مَن يَأۡتِيهِ عَذَابٞ يُخۡزِيهِ وَمَنۡ هُوَ كَٰذِبٞۖ وَٱرۡتَقِبُوٓاْ إِنِّي مَعَكُمۡ رَقِيبٞ",
      "translation": {
        "ur":
            "اور اے میری قوم! اپنی جگہ عمل کرتے رہو، میں بھی عمل کر رہا ہوں، عنقریب تم جان لو گے کہ کس پر رسوا کرنے والا عذاب آتا ہے اور کون جھوٹا ہے، اور انتظار کرو (امام مہدی کا)، یقیناً میں بھی تمہارے ساتھ انتظار کرنے والوں میں ہوں۔",
        "hi":
            "और हे मेरी क़ौम! अपनी स्थिति पर कर्म करो, मैं भी कर्म कर रहा हूँ। शीघ्र ही तुम जान जाओगे कि किस पर अपमानजनक यातना आती है और कौन झूठा है। और प्रतीक्षा करो (इमाम महदी का), निस्संदेह मैं भी तुम्हारे साथ प्रतीक्षा करने वालों में हूँ।",
        "en":
            "And O my people, work according to your position; indeed, I am working. You will soon know to whom will come a punishment that will disgrace him and who is a liar. And wait (for Imam Mahdi), indeed, I am with you among those who wait."
      }
    },

  ],
  "Hadees": [
    {
  "reference": "Kitab al-Ghayba, Chapter 10, Hadith 1",
  "arabic": "زاد الفراتُ على عهد أمير المؤمنين فركب هو وابناه الحسن والحسين فمرّ بثقيف، فقالوا قد جاء عليٌّ يرد الماء. فقال عليّ: أما والله لأقتَلنَّ أنا وابناي هذان وليبعثُنّ الله رجلاً من ولدي في آخر الزمان يطالب بدمائنا، وليغيّبنّ عنهم، تمييزاً لأهل الضلالة حتىّ يقول الجاهل: ما للهِ في آل محمد من حاجة.",
  "translation": {
    "ur": "فرات کے پانی میں امیرالمومنین علی (علیہ السلام) کے زمانے میں طغیانی آئی۔ وہ اپنے بیٹوں حسن اور حسین کے ساتھ سفر پر روانہ ہوئے۔ راستے میں جب وہ ثقیف قبیلے کے قریب پہنچے تو کچھ لوگوں نے کہا: ’علی پانی روکنے آیا ہے۔‘ تو علی (علیہ السلام) نے فرمایا: ’اللہ کی قسم! میں اور میرے یہ دونوں بیٹے قتل کیے جائیں گے، لیکن اللہ آخر الزمان میں میری نسل سے ایک مرد کو بھیجے گا جو ہمارے خون کا انتقام لے گا۔ وہ غائب ہوگا تاکہ اہل ضلال کی آزمائش ہو، یہاں تک کہ جاہل کہے گا: اللہ کو آلِ محمد سے کوئی غرض نہیں۔‘",
    "hi": "अमीरुल मोमिनीन अली (अ.स.) के ज़माने में फ़ुरात का पानी उफान पर आ गया। वह अपने बेटों हसन और हुसैन के साथ सफ़र पर निकले। जब वह कबीला सकीफ के पास से गुजरे तो कुछ लोगों ने कहा: ‘अली पानी रोकने आया है।’ इस पर अली (अ.स.) ने फ़रमाया: ‘अल्लाह की क़सम! मैं और मेरे ये दोनों बेटे क़त्ल कर दिए जाएंगे, लेकिन अल्लाह आख़िरी ज़माने में मेरी नस्ल से एक मर्द को भेजेगा जो हमारे खून का इंतक़ाम लेगा। वह ग़ायब होगा ताकि गुमराह लोगों की आज़माइश हो, यहाँ तक कि जाहिल कहेगा: अल्लाह को आल-ए-मुहम्मद से कोई मतलब नहीं।’",
    "en": "During the time of Amir al-Mu’minin Ali (peace be upon him), the Euphrates overflowed. He, along with his sons Hasan and Husayn, set out on a journey. When they passed by the tribe of Thaqeef, some people said: 'Ali has come to drive back the water.' Imam Ali (peace be upon him) said: 'By Allah, I and my two sons will be killed, but Allah will send a man from among my descendants at the end of time to avenge our blood. He will disappear (for a long time) as a test for the misguided ones, until the ignorant say: Allah has no concern for Muhammad’s progeny.'"
  }
},
{
  "reference": "Kitab al-Ghayba, Chapter 10",
  "arabic": "عن أبي بصير عن أبي عبد الله (ع) قال: إن لصاحب هذا الأمر غيبة لا بد منها يرتاب فيها كل مبطل. فقلت: ولم جعلت فداك؟ قال: لأمر لم يؤذن لنا في كشفه لكم. قلت: فما وجه الحكمة في غيبته؟ قال: وجه الحكمة في غيبته كوجه الحكمة في غيبات من تقدم من حجج الله تعالى ذكره.",
  "translation": {
    "ur": "ابو بصیر نے امام جعفر صادق (ع) سے روایت کی کہ آپ نے فرمایا: ’اس امر کے صاحب (امام مہدی) کے لیے ایک غیبت ہے جو ضروری ہے، جس میں ہر باطل پرست شک میں پڑ جائے گا۔‘ میں نے پوچھا: ’کیوں، مولا؟‘ فرمایا: ’یہ ایک ایسا معاملہ ہے جسے ظاہر کرنے کی ہمیں اجازت نہیں دی گئی۔‘ میں نے کہا: ’تو پھر اس غیبت میں حکمت کیا ہے؟‘ فرمایا: ’جیسے پچھلے انبیاء اور اللہ کے حجتوں کی غیبت میں حکمت تھی، ویسے ہی اس میں بھی حکمت ہے۔‘",
    "hi": "अबू बसीर ने इमाम जाफर सादिक (अ.स.) से रिवायत की कि आपने फ़रमाया: 'इस मामले के मालिक (इमाम महदी) के लिए एक ग़ैबत होगी, जो ज़रूरी है, जिसमें हर ग़लत इंसान शक में पड़ जाएगा।' मैंने पूछा: 'क्यों, मौला?' फ़रमाया: 'यह एक ऐसा मामला है जिसे ज़ाहिर करने की हमें इजाज़त नहीं दी गई।' मैंने कहा: 'तो फिर इस ग़ैबत में हिकमत क्या है?' फ़रमाया: 'जिस तरह पिछले अंबिया और अल्लाह के हुज्जतों की ग़ैबत में हिकमत थी, उसी तरह इसमें भी हिकमत है।'",
    "en": "Abu Basir narrated that Imam Ja'far al-Sadiq (as) said: 'The master of this affair (Imam Mahdi) will have an occultation that is necessary, in which every wrongdoer will doubt.' I asked: 'Why, my master?' He replied: 'It is a matter that we are not permitted to reveal to you.' I then asked: 'What is the wisdom behind his occultation?' He said: 'The wisdom behind his occultation is like the wisdom behind the occultation of the previous divine proofs.'"
  }
}
,
{
  "reference": "Kitab al-Ghayba, Chapter 10",
  "arabic": "قال أمير المؤمنين (ع): لصاحب هذا الأمر غيبة لا بدّ منها، يرتاب فيها كلّ مبطل.",
  "translation": {
    "ur": "امیر المومنین (ع) نے فرمایا: ’اس امر کے صاحب (امام مہدی) کے لیے ایک غیبت ضروری ہے، جس میں ہر باطل پرست شک میں پڑ جائے گا۔‘",
    "hi": "अमीरुल मोमिनीन (अ.स.) ने फ़रमाया: 'इस मामले के मालिक (इमाम महदी) के लिए एक ग़ैबत ज़रूरी है, जिसमें हर ग़लत इंसान शक में पड़ जाएगा।'",
    "en": "Amir al-Mu’minin (as) said: 'The master of this affair (Imam Mahdi) will have an occultation that is necessary, in which every wrongdoer will doubt.'"
  }
}
,
{
  "reference": "Kitab al-Ghayba, Chapter 10",
  "arabic": "قال رسول الله (ص): المهدي من ولدي، تكون له غيبة إذا ظهر ملأ الأرض قسطا وعدلا كما ملئت ظلما وجورا.",
  "translation": {
    "ur": "رسول اللہ (ص) نے فرمایا: ’مہدی میری اولاد میں سے ہیں۔ ان کے لیے ایک غیبت ہوگی، اور جب وہ ظاہر ہوں گے، تو زمین کو عدل و انصاف سے بھر دیں گے جیسے وہ ظلم و جور سے بھری ہوگی۔‘",
    "hi": "रसूलुल्लाह (स.अ.) ने फ़रमाया: 'मेहदी मेरी औलाद में से हैं। उनके लिए एक ग़ैबत होगी, और जब वह ज़ाहिर होंगे, तो ज़मीन को इंसाफ़ और अदल से भर देंगे जैसे वह ज़ुल्म से भरी होगी।'",
    "en": "The Messenger of Allah (pbuh) said: 'The Mahdi is from my progeny. He will have an occultation, and when he appears, he will fill the earth with justice and fairness just as it was filled with oppression and injustice.'"
  }
}
,
 {
    "reference": "Kitab al-Ghayba, Chapter 10",
    "arabic": "حدثنا محمد بن الحسين قال: حدثنا عبد الله بن سنان، عن يحيى بن المثنى، عن أبي بصير، قال: سمعت أبا عبد الله يقول: إذا غاب قائمنا، تفرّق شيعتنا في الأمصار، وأصبحوا بلا إمام يهتدون به، حتى يبعث الله لهم من يجمع شملهم.",
    "translation": {
      "ur": "محمد بن الحسین نے روایت کی کہ عبد اللہ بن سنان، یحییٰ بن المثنی کے واسطے سے، ابو بصیر سے روایت کرتے ہیں کہ انہوں نے امام جعفر صادق (ع) کو فرماتے سنا: ’جب ہمارا قائم غائب ہوگا تو ہمارے شیعہ مختلف شہروں میں بکھر جائیں گے اور بغیر امام کے ہوں گے جو انہیں ہدایت دے، یہاں تک کہ اللہ ان کے لیے کسی کو بھیجے جو انہیں دوبارہ متحد کرے۔‘",
      "hi": "मुहम्मद बिन अल-हुसैन ने अब्दुल्लाह बिन सिनान से, याह्या बिन अल-मुथन्ना के जरिए, अबू बसीर से रिवायत की कि उन्होंने इमाम जाफर सादिक़ (अ.) को फरमाते हुए सुना: 'जब हमारा क़ायम ग़ायब होगा तो हमारे शिया अलग-अलग शहरों में बिखर जाएंगे और बिना इमाम के रहेंगे जो उन्हें राह दिखाए, यहाँ तक कि अल्लाह उनके लिए किसी को भेजे जो उन्हें फिर से एक करे।'",
      "en": "Muhammad bin al-Husayn narrated from Abdullah bin Sinan from Yahya bin al-Muthanna from Abu Basir, who said: I heard Abu Abdullah (as) saying: 'When our Qa'im disappears, our Shia will scatter across lands and wake up without an Imam to guide them until Allah sends someone to reunite them.'"
    }
  },
  {
    "reference": "Kitab al-Ghayba, Chapter 10",
    "arabic": "وأخبرنا جعفر بن محمد، قال: حدثنا أحمد بن عبد الله، عن أبي الجارود، عن أبي جعفر الباقر، قال: كأني بالشيعة يومئذٍ بلا راع، كالغنم قد افترقوا في الأرض، يتساءلون عن إمامهم فلا يجدونه.",
    "translation": {
      "ur": "جعفر بن محمد نے احمد بن عبد اللہ کے واسطے سے، ابو الجارود سے روایت کی، جنہوں نے امام محمد باقر (ع) کو فرماتے سنا: ’مجھے ایسا لگتا ہے جیسے اُس دن شیعہ بغیر چرواہے کے ہوں گے، زمین میں بکھری ہوئی بھیڑوں کی مانند، وہ اپنے امام کے بارے میں پوچھیں گے مگر انہیں نہیں پائیں گے۔‘",
      "hi": "जाफ़र बिन मुहम्मद ने अहमद बिन अब्दुल्लाह से, अबू जारूद से रिवायत की, जिन्होंने इमाम मुहम्मद बाक़िर (अ.) को फरमाते हुए सुना: 'मुझे ऐसा लगता है जैसे उस दिन शिया बिना चरवाहे के होंगे, ज़मीन में बिखरी हुई भेड़ों की तरह, वे अपने इमाम के बारे में पूछेंगे लेकिन उन्हें नहीं पाएंगे।'",
      "en": "Ja'far bin Muhammad narrated from Ahmad bin Abdullah from Abul Jarood from Abu Ja'far al-Baqir (as), who said: 'I can almost see the Shia on that day without a shepherd, scattered like sheep across the land, asking about their Imam but not finding him.'"
    }
  },
   {
    "reference": "Kitab al-Ghayba, Chapter 10",
    "arabic": "عن جابر بن يزيد الجعفي، قال: سمعت أبا جعفر محمد بن علي (ع) يقول: إن لصاحب هذا الأمر غيبتين، إحداهما تطول حتى يقول بعضهم: مات، وبعضهم: قُتل، وبعضهم: ذهب، فلا يبقى على أمره إلا قليل من أصحابه.",
    "translation": {
      "ur": "جابر بن یزید جعفی سے روایت ہے کہ انہوں نے امام محمد باقر (ع) کو فرماتے سنا: 'اس امر کے صاحب (امام مہدی) کے لیے دو غیبتیں ہوں گی، ان میں سے ایک اتنی طویل ہوگی کہ بعض لوگ کہیں گے: وہ وفات پا گئے، بعض کہیں گے: انہیں قتل کر دیا گیا، اور بعض کہیں گے: وہ کہیں چلے گئے۔ اس وقت ان کے امر پر باقی رہنے والے صرف تھوڑے سے اصحاب ہوں گے۔'",
      "hi": "जाबिर बिन यज़ीद जू'फी से रिवायत है कि उन्होंने इमाम मुहम्मद बाक़िर (अ.) को फरमाते हुए सुना: 'इस मामले के साहिब (इमाम मेहदी) के लिए दो ग़ैबतें होंगी, उनमें से एक इतनी लंबी होगी कि कुछ लोग कहेंगे: वे मर गए, कुछ कहेंगे: उन्हें क़त्ल कर दिया गया, और कुछ कहेंगे: वे चले गए। उस समय उनके मामले पर क़ायम रहने वाले सिर्फ़ थोड़े से साथी होंगे।'",
      "en": "Jabir bin Yazid al-Ju'fi narrated that he heard Abu Ja'far Muhammad bin Ali (as) saying: 'The master of this affair (Imam Mahdi) will have two occultations, one of which will be so long that some will say: He has died; others will say: He was killed; and others will say: He has gone away. Only a few of his companions will remain steadfast in his cause.'"
    }
  },
  {
  "reference": "Kitab al-Ghayba, Chapter 10",
  "arabic": "أخبرنا أحمد بن محمد بن سعيد قال: حدثنا القاسم بن محمد بن الحسن بن حازم، قال: حدثنا عبيس بن هشام الناشري، عن عبد الله بن جبلة، عن فضيل الصائغ، عن محمد بن مسلم الثقفي، عن أبي عبد الله أنه قال: إذا فقد الناس الإمامَ مكثوا سنينَ لا يدرون أيّا من أيّ، ثم يُظهر الله لهم صاحبهم.",
  "translation": {
    "ur": "احمد بن محمد بن سعید نے قاسم بن محمد بن حسن بن حازم سے روایت کی، انہوں نے عبیس بن ہشام الناشری سے، انہوں نے عبداللہ بن جبلہ سے، انہوں نے فضیل الصائغ سے، انہوں نے محمد بن مسلم ثقفی سے، اور انہوں نے امام جعفر صادق (ع) سے روایت کی کہ امام (ع) نے فرمایا: 'جب لوگ امام کو کھو دیں گے، تو وہ کئی سال اس کشمکش میں رہیں گے کہ وہ کون ہیں۔ پھر اللہ انہیں ان کے صاحب کو ظاہر کر دے گا۔'",
    "hi": "अहमद बिन मुहम्मद बिन सईद ने क़ासिम बिन मुहम्मद बिन हसन बिन हाज़िम से रिवायत की, उन्होंने उबैस बिन हिशाम अन्नाशिरी से, उन्होंने अब्दुल्लाह बिन जिबला से, उन्होंने फ़ुज़ैल अस-साइग़ से, उन्होंने मुहम्मद बिन मुस्लिम अत्तहक़फ़ी से और उन्होंने इमाम जाफर सादिक़ (अ.) से रिवायत की कि इमाम (अ.) ने फरमाया: 'जब लोग इमाम को खो देंगे, तो वे कई साल इस उहापोह में रहेंगे कि वह कौन हैं। फिर अल्लाह उन्हें उनके साहिब को ज़ाहिर कर देगा।'",
    "en": "Ahmad bin Muhammad bin Sa’eed narrated from al-Qassim bin Muhammad bin al-Hasan bin Hazim from Obayss bin Hisham an-Nashiri from Abdullah bin Jibilla from Fudhayl as-Sa’igh from Muhammad bin Muslim ath-Thaqafi that Abu Abdullah as-Sadiq (as) said: 'If people miss the Imam, they will stay many years unknowing which one he is, and then Allah will make him appear to them.'"
  }
}



  ],
  "Aulia": [

  ]
});

//  data type exclusive for Kalki
class Kalkidataitem {
  String reference;
  String sanskrit;
  Translation translation;

  Kalkidataitem({
    required this.reference,
    required this.sanskrit,
    required this.translation,
  });


  factory Kalkidataitem.fromJson(Map<String, dynamic> json) {
    return Kalkidataitem(
      reference: json['reference'] ?? '',
      sanskrit: json['sanskrit'] ?? '',
      translation: Translation.fromJson(json['translation']),
    );
  }

}

class ReferrKalki {
  List<Kalkidataitem> data;
  

  ReferrKalki({
    required this.data,
  });

  factory ReferrKalki.fromJson(Map<String, dynamic> json) {
    // Use .map to convert the list of maps into List<ZikrData> objects
    List<Kalkidataitem> jj = (json["data"] as List)
        .map((value) => Kalkidataitem.fromJson(value as Map<String, dynamic>))
        .toList();
  
    return ReferrKalki(
      data: jj,
    );
  }
}


ReferrKalki Kalki = ReferrKalki.fromJson(
  {


"data":[

{
  "reference": "Kalki Purana, Chapter 2, Verses 4-7",
  "sanskrit": "कल्किः विष्णुयशसः पुत्रो भविष्यति। स धर्मसंस्थापनार्थं म्लेच्छानां नाशं करिष्यति। स अश्वमेधयज्ञं च करिष्यति। स सर्वलोकप्राणिनां मोक्षदायकः भविष्यति।",
  "translation": {
    "ur": "کلکی وشنویشس کا بیٹا ہوگا۔ وہ دھرم کو قائم کرنے کے لیے آئے گا اور ملچھوں (بدکرداروں) کو ختم کرے گا۔ وہ اشو میدھ یگیا (ایک خاص ہندو قربانی) بھی کرے گا۔ وہ تمام جانداروں کو مکتی (نجات) دینے والا ہوگا۔",
    "hi": "कल्कि विष्णुयश का पुत्र होगा। वह धर्म की स्थापना के लिए आएगा और म्लेच्छों का नाश करेगा। वह अश्वमेध यज्ञ भी करेगा। वह सभी प्राणियों को मोक्ष प्रदान करने वाला होगा।",
    "en": "Kalki will be the son of Vishnuyasha. He will come to re-establish Dharma and destroy the Mlecchas (impure beings). He will also perform the Ashwamedha Yajna (a grand sacrificial ritual). He will be the giver of liberation to all living beings."
  }
}
,
{
  "reference": "Bhagavata Purana, Canto 12, Chapter 2, Verses 19-20",
  "sanskrit": "अथासौ युगसंध्यायां दस्युप्रायेषु राजसु। जनिता विष्णुयशसो नाम्ना कल्किर्जगत्पति:॥",
  "translation": {
    "ur": "جب کالی یگ (اندھیرا دور) کا اختتام ہوگا اور حکمران لٹیروں جیسے ہوں گے، تب وشنویشس کے بیٹے کے طور پر کلکی اوتار ظاہر ہوں گے اور دنیا کے مالک ہوں گے۔",
    "hi": "जब कलियुग का अंत निकट होगा और राजा दस्यु (लुटेरे) के समान होंगे, तब विष्णुयश के पुत्र के रूप में कल्कि अवतार प्रकट होंगे और जगतपति होंगे।",
    "en": "At the end of Kali Yuga, when rulers will behave like thieves, Kalki Avatar will appear as the son of Vishnuyasha and will be the Lord of the world."
  }
}
,
{
  "reference": "Vishnu Purana, Book 4, Chapter 24",
  "sanskrit": "कलौ समाप्ते कल्किः अवतीर्य पृथिवीं पुनः धर्मेण योजयिष्यति। स सर्वपापहरः भविष्यति।",
  "translation": {
    "ur": "جب کالی یگ ختم ہوگا، کلکی اوتار زمین پر آ کر دھرم کو دوبارہ قائم کریں گے۔ وہ تمام گناہوں کو مٹانے والے ہوں گے۔",
    "hi": "जब कलियुग समाप्त होगा, कल्कि अवतार पृथ्वी पर अवतरित होंगे और धर्म की पुनः स्थापना करेंगे। वे समस्त पापों का नाश करने वाले होंगे।",
    "en": "When Kali Yuga ends, Kalki Avatar will descend to Earth and re-establish Dharma. He will be the destroyer of all sins."
  }
},
{
  "reference": "Padma Purana, Uttarakhanda, Chapter 72, Verses 218-220",
  "sanskrit": "कल्किः देवो भविष्यति धर्मसंस्थापनाय च।",
  "translation": {
    "ur": "کلکی دیو آئیں گے تاکہ دھرم کو قائم کریں۔",
    "hi": "कल्कि देव आएंगे ताकि धर्म की स्थापना हो सके।",
    "en": "Kalki Deva will come to establish righteousness."
  }
}
,
{
  "reference": "Agni Purana, Chapter 16, Verses 7-9",
  "sanskrit": "कल्किः देवो जगत्प्राणो धर्मसंस्थापनात्मकः।",
  "translation": {
    "ur": "کلکی دیو، دنیا کی روح، دھرم کی بحالی کے لیے آئیں گے۔",
    "hi": "कल्कि देव, जगत की प्राण, धर्म की स्थापना के लिए आएंगे।",
    "en": "Kalki Deva, the life force of the world, will come to re-establish righteousness."
  }
}
,
{
  "reference": "Mahabharata, Vana Parva, Section 190, Verses 93-97",
  "sanskrit": "कल्किः प्रादुर्भविष्यति विष्णुयशसः सुतः।",
  "translation": {
    "ur": "کلکی، وشنویشس کے بیٹے کے طور پر ظاہر ہوں گے۔",
    "hi": "कल्कि, विष्णुयश के पुत्र के रूप में प्रकट होंगे।",
    "en": "Kalki will manifest as the son of Vishnuyasha."
  }
}
,
{
  "reference": "Bhagavata Purana, Book 12, Chapter 2, Verses 18-20",
  "sanskrit": "कल्किः खड्गपतिः काले कृतवाञ्छत्रुनाशनम्।",
  "translation": {
    "ur": "کلکی، تلوار کے مالک، وقت پر دشمنوں کا خاتمہ کریں گے۔",
    "hi": "कल्कि, खड्गपति, समय पर शत्रुओं का नाश करेंगे।",
    "en": "Kalki, the wielder of the sword, will annihilate the enemies in due time."
  }
}
,
{
  "reference": "Vishnu Purana, Book 4, Chapter 24",
  "sanskrit": "कल्किः खड्गधरो देवो ह्यनुपूर्व्येण युगेष्वहम्।",
  "translation": {
    "ur": "کلکی، تلوار اٹھانے والے دیوتا، یگوں کے سلسلے میں ظاہر ہوں گے۔",
    "hi": "कल्कि, तलवार धारण करने वाले देवता, युगों के क्रम में प्रकट होंगे।",
    "en": "Kalki, the deity bearing a sword, will appear sequentially in the ages."
  }
}



]

  }
);