class urlDataItemType {
  final String url;
  final String name;
  urlDataItemType({required this.name, required this.url});
  factory urlDataItemType.fromJson(Map<String, String> item) {
    return urlDataItemType(name: item["name"]!, url: item["url"]!);
  }
}

class urlDatatype {
  final List<urlDataItemType> data;
  urlDatatype({required this.data});
  factory urlDatatype.fromJson(List<Map<String, String>> data) {
    List<urlDataItemType> dat =
        data.map((item) => urlDataItemType.fromJson(item)).toList();
    return urlDatatype(data: dat);
  }
}

urlDatatype urlData = urlDatatype.fromJson(
  [
  {
    "name": "surrounded by idiots",
    "url":
        "https://drive.google.com/uc?export=download&id=1w1sGEhqD0V_yNyreuasyK-g07AgyRGXL",
  },
  {
    "name": "aaj k fitna parast molvi",
    "url":
        "https://drive.google.com/uc?export=download&id=1-Wlht6hZ_poFyS8yPMX2IHDzfFJ9UajT",
  },
  {
    "name": "amir khan 233",
    "url":
        "https://drive.google.com/uc?export=download&id=1mIwfzl5cJKkRv4g39rNu_zqKOV-z0fGG",
  },
  {
    "name": "Ain ul Faqr Urdu",
    "url":
        "https://drive.google.com/uc?export=download&id=1lg8EXNwx6i8dh43w4Iq-6C7ElAVh6UbK",
  },
  {
    "name": "al Minhaaj sawi",
    "url":
        "https://drive.google.com/uc?export=download&id=1lgK7r9TK8TEzojBDIJmMI2QPKT5hBfkm",
  },
  {
    "name": "Arabic Entymological Dictionary",
    "url":
        "https://drive.google.com/uc?export=download&id=1m5a6DbUFZbzG1Dl3WCexutN_UuiaViQk",
  },
  {
    "name": "Deevan e Shahi Hindi",
    "url":
        "https://drive.google.com/uc?export=download&id=1kiIP6nKmaeF5QjGoHwcELbj1ugp-i7zv",
  },
  {
    "name": "Deenan Shahi with fb cover",
    "url":
        "https://drive.google.com/uc?export=download&id=1mjwN7F8_ztwACLjjHvn4nzFAz6CKdpiq",
  },
  {
    "name": "Docs 2024",
    "url":
        "https://drive.google.com/uc?export=download&id=1mIL_zQ-MFgtYyvzut6FS_DP4OuFCQA_M",
  },
  {
    "name": "Dua Saifi Hindi Arabi",
    "url":
        "https://drive.google.com/uc?export=download&id=1kj5Vtn0P1SL22_zpB2uiQLW_9TUS_2XD",
  },
  {
    "name": "Dua Saifi",
    "url":
        "https://drive.google.com/uc?export=download&id=1kD2tSUjYqvwdkKtuSYy6GRRQ0mS1EK9n",
  },
  {
    "name": "Elementryy Sufi course By His Hollines Younus AlGohar",
    "url":
        "https://drive.google.com/uc?export=download&id=1mPAt62jKbANKoim1V4Oy_9kayKT-nA0m",
  },
  {
    "name": "Fb img 1588",
    "url":
        "https://drive.google.com/uc?export=download&id=1n8Za43N0MIWsnOrthFHF5CpD6D3F1f0K",
  },
  {
    "name": "Final .pdf",
    "url":
        "https://drive.google.com/uc?export=download&id=1mjcx4NRnJgq8-yo3q0wrVRRCkzM3bk4V",
  },
  {
    "name": "Gaibat Sugra, kubra hindi urdu",
    "url":
        "https://drive.google.com/uc?export=download&id=1nNrUu7UNZI-AYZYDgV9wYwPKGIdbcn8f",
  },
  {
    "name": "GoharShahi",
    "url":
        "https://drive.google.com/uc?export=download&id=1kNpUGaFRv6UX6NMqTpl9oPiIkmckvM9b",
  },
  {
    "name": "Haqeeqat Mehdi V3",
    "url":
        "https://drive.google.com/uc?export=download&id=1lljtJ68r0iiqvTtl4xXs0kJUxzi_dN-0",
  },
  {
    "name": "Hindi Elementryy Sufi course By His Hollines Younus AlGohar",
    "url":
        "https://drive.google.com/uc?export=download&id=1mMFg8jOV5lQg8fWQDE3XT3XuDJ04Gkax",
  },
  {
    "name": "History of Islam",
    "url":
        "https://drive.google.com/uc?export=download&id=1m2WfhdPVw1ZW4C90lSaDAeJlmUNRx958",
  },
  {
    "name": "Imam Mehdi",
    "url":
        "https://drive.google.com/uc?export=download&id=1ljpux5pBiacV3e4ClGrgSkajmbeRM-mG",
  },
  {
    "name": "Imam Mehdi Face on Moon",
    "url":
        "https://drive.google.com/uc?export=download&id=1lf2lzr_HSNtUnLMtf5kOsQDbrmpRHlyY",
  },
  {
    "name": "Imam al Mubeen",
    "url":
        "https://drive.google.com/uc?export=download&id=1vpUU0fFVBYdocCM3nPUqw531PAYs8brc",
  },
  {
    "name": "Wafa e Gohar",
    "url":
        "https://drive.google.com/uc?export=download&id=1nHJHgqCUBabtgFrUvj1uysJHt-VS6x1s",
  },
  {
    "name": "Kitab al Gaiba",
    "url":
        "https://drive.google.com/uc?export=download&id=1lYhs8Tgay0pNbfnJYZXQVYLQt2P5LA5K",
  },
  {
    "name": "Kitab al Gaiba (another)",
    "url":
        "https://drive.google.com/uc?export=download&id=1mBvmzRrljUehuVFowLXGR5Xh6LO7TmXl",
  },
  {
    "name": "Kitab al Gaiba (Nomani)",
    "url":
        "https://drive.google.com/uc?export=download&id=1m9o04bujyJZDmgpcDmJu9LAPpp4gX2Xv",
  },
  {
    "name": "Rohani safar",
    "url":
        "https://drive.google.com/uc?export=download&id=1m0UBpa6qzgFdITutcA5PsDsIWfykMgGO",
  },
  {
    "name": "Malfuzat Mehdi Hindi",
    "url":
        "https://drive.google.com/uc?export=download&id=1l-lUs2J-x_DlHrYf6qWZjOZbz894CJMc",
  },
  {
    "name": "Menar Noor by Syedna Gohar Shahi (english)",
    "url":
        "https://drive.google.com/uc?export=download&id=1kWDmcRpATbuiDdlyjpU929UJWUsWyX3j",
  },
  {
    "name": "Minar e Noor (urdu)",
    "url":
        "https://drive.google.com/uc?export=download&id=1kOvKmIMNIdgyN9skFC0tALe9h5Ib95wl",
  },
  {
    "name": "Nahjul Balagah - I",
    "url":
        "https://drive.google.com/uc?export=download&id=1mDK_mMqyreHs6vP_wKOvzQ2vyR-DVSb2",
  },
  {
    "name": "Nahjul Balagah - II",
    "url":
        "https://drive.google.com/uc?export=download&id=1m4GvfWoQEy6EtRa7HPpaB6jl--IpY_Y_",
  },
  {
    "name": "Nahjul Balagah - III",
    "url":
        "https://drive.google.com/uc?export=download&id=1m3epSanVXz7HzgdQr4kX50qKj5207dn-",
  },
  {
    "name": "Nahjul Balagah English",
    "url":
        "https://drive.google.com/uc?export=download&id=1kZNIPKEyqcJ-7zx4PePYZ7kdKGNzBMT5",
  },
  {
    "name": "Nisab e Mehdi",
    "url":
        "https://drive.google.com/uc?export=download&id=1lBABnJ9Jduo4m7rds6kPYNpv2q71oJoZ",
  },
  {
    "name": "Nizam e Tuheed",
    "url":
        "https://drive.google.com/uc?export=download&id=1nQizNnCvLy1hY0tZtJof7HIcqpyQmDNO",
  },
  {
    "name": "References of Quran Hadees",
    "url":
        "https://drive.google.com/uc?export=download&id=1Elgqrpf-pTuxHVEjAGcuCztmDznv451W",
  },
  {
    "name": "Rukhsar e Riaz",
    "url":
        "https://drive.google.com/uc?export=download&id=1lYHuw2trcpyo2m99z1IqGRCAfHjFpkA_",
  },
  {
    "name": "Roshnaas",
    "url":
        "https://drive.google.com/uc?export=download&id=13AmVzBJbe6bbQBI4o25Ue4DHxJGZmvWO",
  },
  {
    "name": "Spritual detox- By Syedi Younus AlGohar",
    "url":
        "https://drive.google.com/uc?export=download&id=1mPjvlo58vlR32eYhzDEPoUksiLci9iNM",
  },
  {
    "name": "Taryaaq e Qalb",
    "url":
        "https://drive.google.com/uc?export=download&id=13C5jShoGkRtPpdMaoLPtdOd1tiI04ld-",
  },
  {
    "name": "The Art of Living",
    "url":
        "https://drive.google.com/uc?export=download&id=1maJU4LPJxyz4HUDbOZU_F2AyZH8F2RGt",
  },
  {
    "name": "The Women Sufi Course",
    "url":
        "https://drive.google.com/uc?export=download&id=1mamolGgWIWpkhu1J4BzLNu9u6mNGGI3Q",
  },
  {
    "name": "Taufat ul Majalis",
    "url":
        "https://drive.google.com/uc?export=download&id=1kFMYAlpKnh_QxcrSL9uMBTAbeU9gjD-O",
  },
  {
    "name": "Hindu bhai Kon hain",
    "url":
        "https://drive.google.com/uc?export=download&id=1kvpiGIZsPeYt79UPq3ckFZ0j5eGPEgu4",
  },
  {
    "name": "Western Sufi course",
    "url":
        "https://drive.google.com/uc?export=download&id=1mRHumzfjwqEM3hj4PT9mbHVGdi7jF01s",
  },
]);
