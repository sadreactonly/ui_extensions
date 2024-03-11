import 'package:flutter/material.dart';

/// .'UiExtensionOnContextExtension' is 'BuildContext' extension
///  Usage: ' context.dc.. '
extension UiExtensionOnContextExtension on BuildContext {
  ///
  UiExtension get dc => UiExtension(this);
}

///
class UiExtension {
  ///
  final BuildContext context;

  ///
  const UiExtension(this.context);
}
