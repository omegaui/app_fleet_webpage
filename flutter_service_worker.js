'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-512.png": "788711ef2f76c752ef3dcea68da17b51",
"icons/Icon-192.png": "788711ef2f76c752ef3dcea68da17b51",
"icons/Icon-maskable-192.png": "788711ef2f76c752ef3dcea68da17b51",
"icons/Icon-maskable-512.png": "788711ef2f76c752ef3dcea68da17b51",
"manifest.json": "091cbe50526bcedb493b927562d73ec3",
"version.json": "d9d78db1c1619348f710ec0a00f0adac",
"main.dart.js": "fc0f9ad1df7228ee7db5a158f3832f9f",
"index.html": "4c694c0a441e357b65251ce67c6bf14f",
"/": "4c694c0a441e357b65251ce67c6bf14f",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/fonts/Sen/Sen-Regular.ttf": "32c160ed42f66e2434bba3af9c5fb375",
"assets/fonts/Sen/Sen-Medium.ttf": "8c227ae66e6d169c59b97ccf451dbdaf",
"assets/fonts/Sen/Sen-Bold.ttf": "66f22ad6aacdc3564847bf2e1f5bcd3d",
"assets/fonts/Sen/Sen-ExtraBold.ttf": "50d24d85c1b99a227b30373dd3b9c0e3",
"assets/fonts/MaterialIcons-Regular.otf": "3100ed632b58356a7df52cb0a97a78bf",
"assets/NOTICES": "c37f8f937b322f6d235ddeec050d9394",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/AssetManifest.bin": "df4ce9e9aeafe02d7e17ae0389553a05",
"assets/assets/animations/desktop-animation.json": "6999811c8dd41c0e6cd4ee1eaad68ccc",
"assets/assets/icons/kde.png": "f9cb0ae993aaa562e9575124aa7b7f1d",
"assets/assets/icons/flutter.png": "0595f35f0e7f69451220d89fa2b3a243",
"assets/assets/icons/ubuntu.svg": "86b20761d27c9c3a537d032304f6e8f1",
"assets/assets/icons/terminal.svg": "ad7d572bd44b232ed4495a94eb0ec4ba",
"assets/assets/icons/github.svg": "f57e7559a3d6365bfb9607c96a313181",
"assets/assets/icons/cinnamon.png": "3b036c7ca6ee321470d65aa6df8014d6",
"assets/assets/icons/gnome.png": "09535fceb08794556f3292beaa8b7b8b",
"assets/assets/icons/app-icon-64.png": "788711ef2f76c752ef3dcea68da17b51",
"assets/assets/icons/budgie.png": "c2147a625a1b5a84972f8b72e34ffa95",
"assets/assets/backgrounds/compatibility.svg": "33f11999519bd93d329a6ed550354272",
"assets/assets/backgrounds/advanced.svg": "f09fca8ce57022ddd1e9831f40b07151",
"assets/assets/backgrounds/more.svg": "66ac2bfac1b30bf6747871661fb3e0c8",
"assets/assets/backgrounds/features.svg": "ec450a26f41d4a9032e1b6a39dbb2e7f",
"assets/assets/backgrounds/overview.svg": "527934f14c2521792c75305fc1ca2550",
"assets/assets/images/storage-structure.png": "8af0802030be0c4f8fee13c83b88b500",
"assets/assets/images/bug-report.png": "b1a4700499aabc904b686d8c3a6109ae",
"assets/assets/images/gaming-example.png": "449009a0f32d11afa3d183d9de2115c6",
"assets/assets/images/create-config.png": "b707f6b318f4c4f5295f8935a952c2ed",
"assets/assets/images/workspace-paths.png": "802816f8642658b9b1e052006dd35ef5",
"assets/assets/images/picker.png": "8c49a9a9ef597ef3cf537492013649e0",
"assets/assets/images/discard.png": "81052b9fb060236a8308fee28948ba55",
"assets/assets/images/updater.png": "e8b893bb14c63a071df42bcfccad8abf",
"assets/assets/images/mapper.png": "7106075c8e75c6bef0387f41e99065ba",
"assets/assets/images/launcher.png": "731a64b49da6f6a6ea73a9dc6401acee",
"assets/assets/images/info.png": "e84ac45d690fa0f38d4b8392302bebf1",
"assets/assets/images/home-view.png": "eba02da6c41f182be475466085fb533e",
"assets/AssetManifest.json": "a5a6870d62549d7ee66fa2173feb01ad",
"assets/FontManifest.json": "d7137062adb9b654b5aa2f3698df061b",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "788711ef2f76c752ef3dcea68da17b51"};
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