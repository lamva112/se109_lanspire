import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DynamicLinkHelper {
  void initDynamicLinks({required Function(Uri link) onLink}) async {
    FirebaseDynamicLinks.instance.onLink.listen(
      (PendingDynamicLinkData? dynamicLink) async {
        final deepLink = dynamicLink?.link;

        if (deepLink != null) {
          onLink(deepLink);
        }
      },
      onError: (e) async {
        print("onLinkError -- ${e.message}");
      },
    );

    final data = await FirebaseDynamicLinks.instance.getInitialLink();
    final deepLink = data?.link;

    if (deepLink != null) {
      onLink(deepLink);
    }
  }

  static DynamicLinkHelper? _instance;

  factory DynamicLinkHelper() {
    _instance ??= DynamicLinkHelper._internal();
    return _instance!;
  }

  DynamicLinkHelper._internal();
}
