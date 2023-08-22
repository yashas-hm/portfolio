'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "009c9e65172e010890f7f65fde438006",
"favicon.ico": "cf67d049a06d088a8e5fc2216ae1d7e2",
"index.html": "e39b6f3a5e6d5b512a485612d701e33b",
"/": "e39b6f3a5e6d5b512a485612d701e33b",
"main.dart.js": "bc3a02f46e52c772005c767880bd84bc",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"photo.png": "0bfc75c639481fabcd06098a95ba996f",
"manifest.json": "9952cdad8eb1db1c0fa7fea96cec4fa0",
"assets/AssetManifest.json": "8555c6c8d7a19633a67467dabfd2b240",
"assets/NOTICES": "4723e72b1d1f3949815d606bbbeb6ddf",
"assets/FontManifest.json": "9b2d07d5fa15c5c183a6ef3035b95e34",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "5dc24f6b8171223c98cb5d62eedaa0da",
"assets/fonts/MaterialIcons-Regular.otf": "e123ef4ec55b36b6abd24fc783638694",
"assets/assets/anim/down.json": "aed022b6b6ad2e0372396de6560847c8",
"assets/assets/anim/bg.json": "1d699f21c6e9eeeeeddd2bc604cd9363",
"assets/assets/anim/insta.json": "0f0f51965141fae27f7fb11143bba898",
"assets/assets/anim/github.json": "6672508feb21dac73f00ca9c5de1dd81",
"assets/assets/anim/linkedin.json": "e0ab69182296f63d4460a8741be7aba1",
"assets/assets/images/photo.png": "0bfc75c639481fabcd06098a95ba996f",
"assets/assets/images/avatar.png": "14478fdaf8fbaa3dfce723e7a5bda54c",
"assets/assets/logo/spring.svg": "66a8a2b55ca8f99af651e3c1fdbe7e5e",
"assets/assets/logo/psql.svg": "e48f7a312772d3cfe2d787a2f018707c",
"assets/assets/logo/android.svg": "cba7205d80ef4306d4cc8bc0856a307d",
"assets/assets/logo/js.svg": "63f114e48bb1dcc492b10226d00e922b",
"assets/assets/logo/aws.svg": "6bf197dcb60596e696d0fca26f0d82c2",
"assets/assets/logo/firebase.svg": "2e454c9e47028a84fa7088a59be42244",
"assets/assets/logo/java.svg": "506a6370bbb46bb9bc6704985a50c5ab",
"assets/assets/logo/gcp.svg": "e3701a9bc8da0e4020f0b6abd6b64a0b",
"assets/assets/logo/bash.svg": "869c61ee850b4874a0f6b244f1b38872",
"assets/assets/logo/agile.png": "83bf6255664709618759c17cbd6353e9",
"assets/assets/logo/link.png": "d7dc495d1c6920e7e5c05c3e5f33df49",
"assets/assets/logo/leader.png": "9c7b4692f06dc9371d041f7bd65a1361",
"assets/assets/logo/cul.png": "a4f4c71169789d41ab6b12901f897466",
"assets/assets/logo/flutter.svg": "2985d7b9f25064926f468e826c352600",
"assets/assets/logo/opencv.svg": "edb14ef06acbf91fdafebb4dd1ee3736",
"assets/assets/logo/python.svg": "1b73d86b9332d05471f0a00e45203c34",
"assets/assets/logo/heroku.svg": "ac7fc520dba9697b884545b0dff04f27",
"assets/assets/logo/docker.svg": "d7f56d8e57d04ffd9880e5fc2f4bd740",
"assets/assets/logo/git.svg": "528e618106729f7dac43821c0d56e425",
"assets/assets/logo/coord.png": "86d67111482767d4ab8120f48eefc93e",
"assets/assets/logo/as.svg": "458860a5dde8755fe7cb972b64fe06cd",
"assets/assets/logo/tf.svg": "a5fef83c01fe35af815769a31a41aecd",
"assets/assets/logo/jira.svg": "ce0d5d0e3af87df3c97c0f4808496d95",
"assets/assets/logo/management.png": "129fc664ea65491f9507671d3db14c56",
"assets/assets/logo/kotlin.svg": "8104a59ba77c34977e8f3502a8bfcaf7",
"assets/assets/logo/np.svg": "bff0a2e78916a09e0ade701cb07acf0f",
"assets/assets/logo/thinking.png": "d71ea1fb30b845572f9d5dfbf7138189",
"assets/assets/logo/dart.svg": "74b5a20e303e4bcd30d2f4e850659d6e",
"assets/assets/logo/bloc.png": "39ead341ba08f3289a1be8c39d872ed0",
"assets/assets/logo/dsa.png": "d0d04c6edec340e9db703702237d51f9",
"assets/assets/logo/css.svg": "f417c2d5c0138e052bbe2225ec602705",
"assets/assets/logo/communication.png": "727ce2033d4564cacf279bb1e088aa97",
"assets/assets/logo/c.svg": "9f820c0c994c41fd146dcefa9e5f447d",
"assets/assets/logo/mvc.png": "a4551da02128cd439f42fd772fe666ba",
"assets/assets/logo/ml.png": "d6972eac2c0ef18ce327325067f9d28a",
"assets/assets/logo/react.svg": "8d2dcd5b33ba3978ee63297a3aaa4a98",
"assets/assets/logo/html.svg": "33eb850f7292a31025b9b7e0eadb9475",
"assets/assets/logo/intellij.svg": "701f67dc57313c24a9763b9229c471cc",
"assets/assets/logo/iot.svg": "97338025fde85af8ae07a8b6385c01ed",
"assets/assets/logo/mdp.png": "0b44ece491c0674e906dde6d1bfde4ac",
"assets/assets/logo/pd.svg": "cdb7fde7149825cf43e88eff46a4bae1",
"assets/assets/logo/node.svg": "66450a7dc677d7bbbd8369e25c6a824a",
"assets/assets/logo/tech.png": "3f1f2dba85c4a165db37181c17cdbcba",
"assets/assets/fonts/roboto.ttf": "8a36205bd9b83e03af0591a004bc97f4",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
