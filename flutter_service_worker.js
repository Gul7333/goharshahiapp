'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.json": "319c756cac955a964bc4e8ac59d3352a",
"assets/AssetManifest.bin": "fa12c1d8f419093aa1ac2951f2b20ce1",
"assets/assets/proofs/moon_5.jpg": "af636e1593563af880d32ae08b8fc3ef",
"assets/assets/proofs/moon_3.jpg": "ba6a7c0b3a9a20368e06e389b0bae5a0",
"assets/assets/proofs/moon_8.jpg": "28a671732a6a4fdb23eda4b99daaf2a0",
"assets/assets/proofs/2.mp4": "74a56557193dbf0f4d1ca96b80694643",
"assets/assets/proofs/moon_4.jpg": "c38ccedb696f606bba7c622a1d70edaa",
"assets/assets/proofs/4.mp4": "e39df359e683696ab3b2aa37b95d2d8f",
"assets/assets/proofs/1.mp4": "f2c8a90801405c72928c8c3361582650",
"assets/assets/proofs/3.mp4": "c4638211136f02fe757f52b0849f30a7",
"assets/assets/proofs/moon_2.jpg": "5d0133cb116db554e946163c256cd219",
"assets/assets/proofs/moon_6.jpg": "301c81eedb5ddb42cb3fda630b540860",
"assets/assets/proofs/moon_7.jpg": "a9e22d4d826984e8a1aab89547a1740f",
"assets/assets/proofs/moon_1.jpg": "7cf204eb50e8735c34b48a0b79c33db8",
"assets/assets/thumbnails/deen-e-ilaahi-malayalam.png": "e71911b796675fd3c0d856e47915ae9c",
"assets/assets/thumbnails/deen-e-ilaahi-shudh-hindi.png": "8cb586f59b40ec402f0edd71a7de9d05",
"assets/assets/thumbnails/deen-ilahi-kashmiri-min.png": "068bcb1aa93e0ff3a6f221b98b8df0b6",
"assets/assets/thumbnails/deen-e-ilaahi-farsi.png": "531d53f136f55db1f40102004c62cded",
"assets/assets/thumbnails/deen-e-ilaahi-marathi.png": "561e27cf84903191a33813f196500bb8",
"assets/assets/thumbnails/deen-e-ilaahi-assamese.png": "721eaa962f702bfbfdf422fe046dd283",
"assets/assets/thumbnails/Religion-of-God.png": "b2258755ae7c9917eace3d2432431789",
"assets/assets/thumbnails/deen-ilaahi-bangla.png": "6d038e217b68ef692f8986208e76219b",
"assets/assets/thumbnails/deen-e-ilaahi-punjabi.png": "b2e600a02b4a9801068b6cd9c19c35ca",
"assets/assets/thumbnails/deen-e-ilaahi-pashtu.png": "ea31386aeeab52312bf349f0c4139b99",
"assets/assets/thumbnails/deen-e-ilaahi-tamil.png": "81037e99c9df769bad7d7b99256a74e4",
"assets/assets/thumbnails/deen-e-ilaahi-urdu.png": "9c4837fc9a0bed7aaf79eb37f51497e6",
"assets/assets/GOHARSHAHISPLASH.png": "1c19d5065372744e4ea4eead27f907a1",
"assets/assets/Fonts/Alvi%2520Nastaleeq%2520Regular.ttf": "e8cfe56ccaa6ebf71d57fd3173ee4183",
"assets/assets/Qasida/Wird%2520e%2520Lab%2520Raat%2520Dinn%2520_%2520Sufi%2520Nadeem%2520ft.%2520Rizwan%2520Gohar.m4a": "cfbef7eb79fe589a3bafe499ecb33cda",
"assets/assets/Qasida/Qasida_%2520Justuju%2520e%2520Yaar%2520Mein%2520Hasti%2520Ko%2520Khona%2520Chahiye.opus": "f866c7241bf0dc7799b01ed79a161a8c",
"assets/assets/Qasida/Mast%2520Aankhon%2520Ki%2520Qassam%2520Khanay%2520Ka%2520Mausam%2520Aa%2520Gaya%2520_%2520Qawwali%2520_%2520ALRA%2520TV.opus": "7a617e66dad2c1f5e64fa2244cb58bd4",
"assets/assets/Qasida/Qasida_%2520Na%2520Ho%2520Mayoos%2520Pur%2520Umeed%2520Reh%2520Gohar%2520Ko%2520Aana%2520Hai%2520_%2520Sayyidi%2520Younus%2520AlGohar.m4a": "91615f9e2ebf4fb5237b21318bdb0b4d",
"assets/assets/Qasida/Manam%2520adna%2520gulam%2520e%2520Riaz%2520Shah%2520e%2520Ishq%2520Riazum%2520Ra%2520_%2520Qaseeda%2520e%2520Gohar%2520Shahi%2520_%2520hafiz%2520Nadeem.opus": "86fc1393c222b45f6991ce49432e9b5a",
"assets/assets/SarkarPicture/26.jpg": "694440f223978ecbf9fae0247db928b4",
"assets/assets/SarkarPicture/74.jpg": "b615004a696daefeb72c67efd086d9f8",
"assets/assets/SarkarPicture/119.jpg": "10a2f45b2a038660d30e57cc74f6cc22",
"assets/assets/SarkarPicture/82.jpg": "486422157260d9f054b2db14bf9a8659",
"assets/assets/SarkarPicture/10.jpg": "bba58904fa76644ba1ce905270b622c2",
"assets/assets/SarkarPicture/93.jpg": "a7aa1e1706d3f38599d5bdcec86a0bfe",
"assets/assets/SarkarPicture/104.jpg": "6de4df4b406db630438852d81b3e696e",
"assets/assets/SarkarPicture/46.jpg": "cc92ea35341fcf28f6cdd2b2205c93c4",
"assets/assets/SarkarPicture/115.jpg": "5ab6e9bd4b0c1f473e9bebdbb32b0405",
"assets/assets/SarkarPicture/86.jpg": "dc40dd520e3be0067394acb2a6c667fd",
"assets/assets/SarkarPicture/36.jpg": "72e6eb56c17327fbc7232820c84a8f2a",
"assets/assets/SarkarPicture/40.jpg": "b6d3b92f44336bbbd41bc6ed8b339467",
"assets/assets/SarkarPicture/90.jpg": "389d4d007fdf963898bc3d1edf0a8706",
"assets/assets/SarkarPicture/85.jpg": "0cd0f4d6d622323f73478367d8163f5e",
"assets/assets/SarkarPicture/52.jpg": "35582b4e4ad571bad379b16691a627b9",
"assets/assets/SarkarPicture/39.jpg": "d27a173d8b7e26a76a56c76a304d8313",
"assets/assets/SarkarPicture/62.jpg": "675198be49e45a162077973b9e95636b",
"assets/assets/SarkarPicture/11.jpeg": "8560bebfd7a500c55573192d6be4a70f",
"assets/assets/SarkarPicture/32.jpg": "6469e9547ba9e3c5869525b860d3abb3",
"assets/assets/SarkarPicture/50.jpg": "3d830ad596660050a38efeb89b75b023",
"assets/assets/SarkarPicture/33.jpg": "11e2ae25779faac4496f968352d98c45",
"assets/assets/SarkarPicture/91.jpg": "dc649e2078b55e5807d64860e8b9fe03",
"assets/assets/SarkarPicture/92.jpg": "7b44a7edbbbb2f3c400970621d7a91e8",
"assets/assets/SarkarPicture/108.jpg": "4559f3b24fa2f5d6c7dbe1c0d971fa5a",
"assets/assets/SarkarPicture/77.jpg": "87544b298a32befd12f7b8c2bc666190",
"assets/assets/SarkarPicture/14.jpg": "4fd3f2d9a76dd6a1cd644a4b0292b666",
"assets/assets/SarkarPicture/79.jpg": "d074b8078142d9469c102eb955cb4e42",
"assets/assets/SarkarPicture/54.jpg": "e5407df0f2b8d9c563f4db7d9a81600e",
"assets/assets/SarkarPicture/9.jpg": "d2d6fbb8d496bc40c97bb959c796cfd2",
"assets/assets/SarkarPicture/63.jpg": "8bcf69d7f93fac1b2dc0dad0186b2b89",
"assets/assets/SarkarPicture/78.jpg": "c8fc998e9fde39aa0a6ccf2363dae34a",
"assets/assets/SarkarPicture/30.jpg": "b623a12d3a42f20cd13d83c67a3940c1",
"assets/assets/SarkarPicture/66.jpg": "ebb1f6da136027bf65833a2c78e8e7dd",
"assets/assets/SarkarPicture/20.jpg": "534b003ebf410b47fd4889a0131ebfe0",
"assets/assets/SarkarPicture/116.jpg": "7e5f6261160b1abfc24001771065ba3c",
"assets/assets/SarkarPicture/49.jpg": "343af457ee0fc2b4a360d998e5e68424",
"assets/assets/SarkarPicture/17.jpg": "7e02c77dc2b213a4f33c25c7c6ff0c33",
"assets/assets/SarkarPicture/48.jpg": "46e322bc5973a26170c3fa3f9acc0a5b",
"assets/assets/SarkarPicture/71.jpg": "ff756f2fc8ca3cf3af24852f359c7d34",
"assets/assets/SarkarPicture/47.jpg": "f9813cc74ab9efa45842cef0df377576",
"assets/assets/SarkarPicture/16.jpeg": "466866286ba62cff084444f354b895d7",
"assets/assets/SarkarPicture/43.jpg": "63a4b453381ac62443dd6fb5ef3d6492",
"assets/assets/SarkarPicture/8.jpg": "dbcbe27bc778435db82163e4cc4e7d73",
"assets/assets/SarkarPicture/57.jpg": "9816429584e0aa9fefde36180b5c8e6d",
"assets/assets/SarkarPicture/60.jpg": "43c1000e667175683c5f709d91f4c574",
"assets/assets/SarkarPicture/69.jpg": "ef20e019c30befb5ae8577016583c437",
"assets/assets/SarkarPicture/41.jpg": "ada9cd0cae26e254949ba4ca716cdf4f",
"assets/assets/SarkarPicture/29.jpg": "25ddb1801bb9c38f779a25a45485f30b",
"assets/assets/SarkarPicture/55.jpg": "4626f5062368b3f225ae07b6d8b41611",
"assets/assets/SarkarPicture/18.jpg": "ea5a67603c83ac6fd0cc402589f31abc",
"assets/assets/SarkarPicture/1.jpg": "20d23f1f6d6648250092186c26fa18e1",
"assets/assets/SarkarPicture/38.jpg": "61cdd859234731943ca248923baad0ce",
"assets/assets/SarkarPicture/89.jpg": "2eaa2e92974c76856b7fece6bfb21ed9",
"assets/assets/SarkarPicture/51.jpg": "383e17bb1c158e373ada3708e15eaa8c",
"assets/assets/SarkarPicture/88.jpg": "05882533b96b61ac1c190c02e4739a4b",
"assets/assets/SarkarPicture/15.jpg": "095f417beda51e0dde72e35b5615508b",
"assets/assets/SarkarPicture/31.jpg": "eb14c4e0dbcdbaa4446b2028dd16f23e",
"assets/assets/SarkarPicture/102.jpg": "62fe0d286ba1f632ec4c86f5cbf6c47b",
"assets/assets/SarkarPicture/110.jpg": "89817cb612d9fd6d5e9361fd8cfde7bb",
"assets/assets/SarkarPicture/12.jpeg": "80223579d89b770eb5729043adcc3198",
"assets/assets/SarkarPicture/4.jpeg": "a0952565448dedb8a9b4d56737b4b7dd",
"assets/assets/SarkarPicture/118.jpg": "22572a2b48736533fbffb74f9da0dc90",
"assets/assets/SarkarPicture/61.jpg": "7d8398d2aefd8acd169dadf13ff40f2c",
"assets/assets/SarkarPicture/34.jpg": "42cd39bfabaeedf27d336a6858b50e05",
"assets/assets/SarkarPicture/23.jpg": "eada0c0f67901967cee6b0199ba6388a",
"assets/assets/SarkarPicture/28.jpg": "c54773e930b266b16895a8a67b094da0",
"assets/assets/SarkarPicture/72.jpg": "e32a677531511e495395b4fb7068763f",
"assets/assets/SarkarPicture/2.jpeg": "794854e6c253498dfdf48ff2ee37e749",
"assets/assets/SarkarPicture/95.jpg": "048bf06dd6a2fceb637e4b1ea240aec1",
"assets/assets/SarkarPicture/44.jpg": "6d8695e6f0ab71f85be4a38348408492",
"assets/assets/SarkarPicture/21.jpg": "7ee436c641bbc3c5d75f9124ebb79724",
"assets/assets/SarkarPicture/13.jpg": "be2241abc7e5af5edb0bf635aee728ca",
"assets/assets/SarkarPicture/84.jpg": "483da816a75b7279d97e3f0b4ecbf495",
"assets/assets/SarkarPicture/56.jpg": "1e1c8b6b41577d71a63a3ffa3f5f204e",
"assets/assets/SarkarPicture/67.jpg": "7e479b2bdbe54cb1a0637c6a3b8122a8",
"assets/assets/SarkarPicture/81.jpg": "1e7c4c19cde5191294b29517f7af9a4b",
"assets/assets/SarkarPicture/112.jpg": "9c23b7eb707a1c22869a0c79e85a3b1c",
"assets/assets/SarkarPicture/64.jpg": "315e480d8082c79ac3a3d494a8862d1d",
"assets/assets/SarkarPicture/7.jpg": "bb4a807a0e9b62df8653fff3a5e03a17",
"assets/assets/SarkarPicture/105.jpg": "6b5be638c5d12c5ae004c877cec10670",
"assets/assets/SarkarPicture/80.jpg": "63bad540ae7d6d82272efe1bea60075b",
"assets/assets/SarkarPicture/83.jpg": "2eace04a71ccedfe2e97ff7a7036aba4",
"assets/assets/SarkarPicture/35.jpg": "281ea8ab3a50950ef4646d5d69ed0287",
"assets/assets/SarkarPicture/45.jpg": "0149ea79de48a3cf03ccda9f636c43f6",
"assets/assets/SarkarPicture/76.jpg": "7007f8a9e05a18b46e4c058c87494e89",
"assets/assets/SarkarPicture/117.jpg": "16b143011e9f8f6ab1f8af5b8cc7fcd8",
"assets/assets/SarkarPicture/109.jpg": "25a9ef9a08de8b67510357c46925b742",
"assets/assets/SarkarPicture/27.jpg": "99c3672792f57d8fdc7927c0686307a3",
"assets/assets/SarkarPicture/111.jpg": "b77d112b56efec3f93d1a7ae1664255d",
"assets/assets/SarkarPicture/58.jpg": "6c27e592d84a6c0948a46249fa523330",
"assets/assets/SarkarPicture/114.jpg": "71d954febe769f98173996541fa5a1d7",
"assets/assets/SarkarPicture/68.jpg": "5806f82fc902704db5d20e2071c8a7fe",
"assets/assets/SarkarPicture/101.jpg": "925980855906ef8cfc3401d24da15b9c",
"assets/assets/SarkarPicture/113.png": "1fb2cc699f15d5226fdfb459b08f9c75",
"assets/assets/SarkarPicture/100.jpg": "36e8c88b41404651ba0f2c19da9535cb",
"assets/assets/SarkarPicture/65.jpg": "a0513e1f280e3e021d7525a0c7111d6b",
"assets/assets/SarkarPicture/94.jpg": "ae8c4ce4507d807144224bf2e2a644d6",
"assets/assets/SarkarPicture/87.jpg": "c5393ede6ccd7dc80b473ac7a23e06b7",
"assets/assets/SarkarPicture/42.jpg": "95884aafe83d61bf299eb878aee647b2",
"assets/assets/SarkarPicture/97.jpg": "c69f4bfb1c51cd60335afdd13b738632",
"assets/assets/SarkarPicture/120.jpg": "ac61ccaaacd27350fc76a67bd37b5135",
"assets/assets/SarkarPicture/19.jpg": "871d374c9af8ac1ea785eb1e54f3ef61",
"assets/assets/SarkarPicture/6.jpg": "fb8458ed929932efef75f110482f5415",
"assets/assets/SarkarPicture/73.jpg": "5b15b169ef13847d46d00973367d7a98",
"assets/assets/SarkarPicture/106.jpg": "6df7fd65c8df5f436fea895bde91bb9e",
"assets/assets/SarkarPicture/107.jpg": "9e6675fd5d5f69b146e2f1e2f6619ab7",
"assets/assets/SarkarPicture/25.jpg": "dda43c50f96069b60cf427c27e8723d8",
"assets/assets/SarkarPicture/37.jpg": "58d517872cdfd9af90d8c5f2ba455563",
"assets/assets/SarkarPicture/103.jpg": "3b6dc4a3c71e0cf0b97b4fee4180a406",
"assets/assets/SarkarPicture/75.jpg": "0b4005b62d88b67e792e565eae6550ed",
"assets/assets/SarkarPicture/24.jpg": "2d9c29d4fbd36179acf97db7638ccb9d",
"assets/assets/SarkarPicture/121.jpg": "b95e000994e5b28f6c6ba6276496ef0b",
"assets/assets/SarkarPicture/70.jpg": "e37be207df74ed39d881dad8633d67be",
"assets/assets/SarkarPicture/59.jpg": "5f5a152dfced1dc6220d9186c4865a91",
"assets/assets/SarkarPicture/96.jpg": "2278450e52b91d400a2ef0f215da2947",
"assets/assets/SarkarPicture/22.jpg": "c5fa1472b29ea08c10b174c0eee7f4e8",
"assets/assets/SarkarPicture/3.jpg": "c5fa1472b29ea08c10b174c0eee7f4e8",
"assets/assets/SarkarPicture/53.jpg": "bc01618eaa414d322df9ff7a7a2ccfa1",
"assets/assets/SarkarPicture/5.jpeg": "cbf87999c97c31b8333cee88a6081b79",
"assets/assets/SarkarPicture/98.jpg": "36c8481f062eb00f5583f2f285f37892",
"assets/assets/SarkarPicture/99.jpg": "4567df86cda520a1a44c758880189ca3",
"assets/assets/zikree.aac": "5dba1bd6a77d42265d3f0f8406ad09a4",
"assets/assets/worldcities.json": "67c50b4eabe8bd020703aecedc3f01f0",
"assets/assets/deenilahicompressed/Deen%2520e%2520Ilahi%2520Bangla.pdf": "48e625a39c41355dd6ac73bf6482cde9",
"assets/assets/deenilahicompressed/Deen%2520e%2520Ilahi%2520Malayalam-compressed.pdf": "7cfd85f3f506639893bbb925af02141d",
"assets/assets/deenilahicompressed/Deen%2520e%2520Ilahi%2520Marathi_compressed.pdf": "c6d72ba0592e471a0be255276bb67a16",
"assets/assets/deenilahicompressed/Deen%2520e%2520Ilahi%2520Punjabi.pdf": "eca9b845fcb8aabd9ab490a742005afa",
"assets/assets/deenilahicompressed/Deen-e-Ilahi-URDu-compressed.pdf": "47e8104b9f49512b24255934ea2850a2",
"assets/assets/deenilahicompressed/Deen-e-Ilahi_Farsi-compressed.pdf": "f482689378f9bc6da6429f51fd6d922c",
"assets/assets/deenilahicompressed/deen-e-ilahi-tamil.pdf": "8c18fbef454102cf217f49ca7deb8901",
"assets/assets/deenilahicompressed/Deen-e-Ilahi%2520Assamese.pdf": "228d15719c2999d040f34dea4a9ad1e3",
"assets/assets/deenilahicompressed/Deen%2520e%2520ilahi%2520Pashto%2520(Internet%2520Version)_compressed.pdf": "b6249ac570f4cc9ac57518a2c12944b0",
"assets/assets/deenilahicompressed/Deen%2520e%2520Ilahi%2520(Ishwar%2520Dharma)%2520Shuddh%2520Hindi%2520Book.pdf": "ee424d1157be77fde8ce263498331803",
"assets/assets/deenilahicompressed/The-Religion-of-God-compressed.pdf": "86e585aeb190a41bfa84d48073993fd1",
"assets/FontManifest.json": "8cfbf754beff7b392f855c126951bce0",
"assets/fonts/MaterialIcons-Regular.otf": "f4b7d12f4a1b593285cba224cfe9cf94",
"assets/AssetManifest.bin.json": "977e8284f0bc60400907af50b98c7e67",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/NOTICES": "f03e218af3d3169867e74b79f5c2f8ac",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "07c7d62f22820e2729889f13689d6a84",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "54ae9bbe19fec0a33b90f73d2fdbe02b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "4219e996b19219597380b8e7f369ce93",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"manifest.json": "f001a8b62aa313d463bdc18d9d8f7aa0",
"splash/img/dark-4x.png": "d4847ba981efe98516ed5ab03b11c6d2",
"splash/img/dark-1x.png": "be645a40abddaaa6602cc371dba2dd4f",
"splash/img/light-2x.png": "dcc11834797ceea0df75800cc5a1004c",
"splash/img/light-4x.png": "d4847ba981efe98516ed5ab03b11c6d2",
"splash/img/light-1x.png": "be645a40abddaaa6602cc371dba2dd4f",
"splash/img/dark-2x.png": "dcc11834797ceea0df75800cc5a1004c",
"splash/img/light-3x.png": "98618f2bdc713aeed2b81c6fc40705b7",
"splash/img/dark-3x.png": "98618f2bdc713aeed2b81c6fc40705b7",
"version.json": "5ad5e86f6b09b188333b2b2e672926a1",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"index.html": "1731630f02db5d87aa7fe33abd872c38",
"/": "1731630f02db5d87aa7fe33abd872c38",
"flutter_bootstrap.js": "bc31ab7354ff87b792921575392922fb",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js": "9b2d39ae2f0c970bac4b427054aaad0d"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
