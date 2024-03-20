'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "009c9e65172e010890f7f65fde438006",
"favicon.ico": "d41d8cd98f00b204e9800998ecf8427e",
"index.html": "016cfbc7e88c1dcf6f526af684a75572",
"/": "016cfbc7e88c1dcf6f526af684a75572",
"main.dart.js": "08feee6aee5abacb0993749e81dc19d7",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"avatar.png": "d41d8cd98f00b204e9800998ecf8427e",
"manifest.json": "9952cdad8eb1db1c0fa7fea96cec4fa0",
"assets/AssetManifest.json": "56501fedaa00d636ae6bfa9833e7e8bb",
"assets/NOTICES": "62ac8761d7ab4388dee9c04cc7f93572",
"assets/FontManifest.json": "494ab6a0e6ec24007e1ea8741bb3de0f",
"assets/AssetManifest.bin.json": "919aa985cfdcbd39807b146e2a3e8ebb",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "e8094fc191f957c3c3f595de61764e47",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/assets/images/coding.gif": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/images/photo.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/images/avatar.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/images/default.jpg": "685e636ad5f077958c6235d73b55d3ae",
"assets/assets/logo/psql.svg": "e48f7a312772d3cfe2d787a2f018707c",
"assets/assets/logo/js.svg": "63f114e48bb1dcc492b10226d00e922b",
"assets/assets/logo/express.svg": "4e154d0d3fa12f987d475d6749a5898f",
"assets/assets/logo/aws.svg": "a888833034bfc58756b23aba044fa35a",
"assets/assets/logo/rust.svg": "bfa4ac9aca95dc0cef001d7d3fd8d4ba",
"assets/assets/logo/supabase.svg": "357c209cd8c6fa1c20761fe5486aac22",
"assets/assets/logo/firebase.svg": "2e454c9e47028a84fa7088a59be42244",
"assets/assets/logo/java.svg": "506a6370bbb46bb9bc6704985a50c5ab",
"assets/assets/logo/gcp.svg": "e3701a9bc8da0e4020f0b6abd6b64a0b",
"assets/assets/logo/github.svg": "eb87a7e3a684bd5ab56883c0b31cdad6",
"assets/assets/logo/bash.svg": "869c61ee850b4874a0f6b244f1b38872",
"assets/assets/logo/agile.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/logo/link.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/logo/leader.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/logo/cul.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/logo/github_actions.svg": "1ce870187708364cb092515c170e4e39",
"assets/assets/logo/flutter.svg": "2985d7b9f25064926f468e826c352600",
"assets/assets/logo/instagram.svg": "e939eb55baa29d408fbc1d06a90b1544",
"assets/assets/logo/opencv.svg": "edb14ef06acbf91fdafebb4dd1ee3736",
"assets/assets/logo/python.svg": "1b73d86b9332d05471f0a00e45203c34",
"assets/assets/logo/mail.svg": "3a0234f85f23b56f516819ef55226fe6",
"assets/assets/logo/docker.svg": "d7f56d8e57d04ffd9880e5fc2f4bd740",
"assets/assets/logo/git.svg": "528e618106729f7dac43821c0d56e425",
"assets/assets/logo/prometheus.svg": "7ff87471b3f3f14e3ad3c286803abb67",
"assets/assets/logo/kubernetes.svg": "34dbc50a388d81965cd58d91a64148ed",
"assets/assets/logo/coord.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/logo/raspberry.svg": "64008677fcd67e82a0897c4a8c9638e6",
"assets/assets/logo/tf.svg": "a5fef83c01fe35af815769a31a41aecd",
"assets/assets/logo/jira.svg": "ce0d5d0e3af87df3c97c0f4808496d95",
"assets/assets/logo/management.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/logo/kotlin.svg": "8104a59ba77c34977e8f3502a8bfcaf7",
"assets/assets/logo/np.svg": "bff0a2e78916a09e0ade701cb07acf0f",
"assets/assets/logo/thinking.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/logo/mongodb.svg": "2fc1f5d54e4d60236f7c2c3330769df7",
"assets/assets/logo/dart.svg": "74b5a20e303e4bcd30d2f4e850659d6e",
"assets/assets/logo/bloc.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/logo/dsa.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/logo/cv.svg": "fb3073dbc5d41c6055293945b3df1a23",
"assets/assets/logo/css.svg": "f417c2d5c0138e052bbe2225ec602705",
"assets/assets/logo/communication.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/logo/typescript.svg": "0a07a11aed16af5c5844fde5198ff6f9",
"assets/assets/logo/jenkins.svg": "d7a1d484603240b2d1442624634e9912",
"assets/assets/logo/c.svg": "9f820c0c994c41fd146dcefa9e5f447d",
"assets/assets/logo/mvc.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/logo/ml.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/logo/arduino.svg": "97338025fde85af8ae07a8b6385c01ed",
"assets/assets/logo/location.svg": "6302812fb4189cac401dfa4f2213adf0",
"assets/assets/logo/linkedin.svg": "7a49ae0c310ac16b6bd402c99dd9e4d0",
"assets/assets/logo/react.svg": "93d1e209d12d41b447700656dc74709a",
"assets/assets/logo/ansible.svg": "a6ae669b54bf5bde0e902cec61f85877",
"assets/assets/logo/html.svg": "33eb850f7292a31025b9b7e0eadb9475",
"assets/assets/logo/slack.svg": "80ac2aad2a9be1dfab8914f8e68babf5",
"assets/assets/logo/mysql.svg": "02dc97e94526e2ebaf40f2a920987367",
"assets/assets/logo/graphql.svg": "b3f915f993c303bb9dd69052078fe9d1",
"assets/assets/logo/nginx.svg": "79558fd13147137e9ef7582faa9093dc",
"assets/assets/logo/mdp.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/logo/pd.svg": "cdb7fde7149825cf43e88eff46a4bae1",
"assets/assets/logo/node.svg": "66450a7dc677d7bbbd8369e25c6a824a",
"assets/assets/logo/tech.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/logo/github_avatar.svg": "f0055b1ac77c2083fd1a22105a24145c",
"assets/assets/fonts/sg600.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/fonts/sg400.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/fonts/sg500.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/fonts/sg700.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/fonts/sg300.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
