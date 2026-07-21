import "package:flutter/foundation.dart";
import "package:flutter/widgets.dart";
import "package:forui/forui.dart";
import "package:get/get_utils/src/extensions/dynamic_extensions.dart";

class AsyncButton extends StatefulWidget {
  const AsyncButton({
    required this.onPress,
    required this.child,
    this.prefix,
    this.suffix,
    this.variant = .primary,
    this.size = .md,
    super.key,
  });

  final AsyncCallback? onPress;
  final Widget? prefix;
  final Widget? suffix;
  final FButtonVariant variant;
  final FButtonSizeVariant size;
  final Widget? child;

  @override
  State<AsyncButton> createState() => _AsyncButtonState();
}

class _AsyncButtonState extends State<AsyncButton> {
  bool loading = false;
  bool errored = false;

  @override
  Widget build(BuildContext context) {
    return FButton(
      onPress: loading || widget.onPress == null
          ? null
          : () async {
              setState(() {
                errored = false;
                loading = true;
              });
              try {
                await widget.onPress?.call();
              } on Exception catch (e) {
                e.printError();
                setState(() => errored = true);
              } finally {
                setState(() => loading = false);
              }
            },
      size: widget.size,
      variant: widget.variant,
      prefix: loading || errored
          ? Builder(
              builder: (ctx) {
                if (loading) return const FCircularProgress();
                if (errored) return const Icon(FIcons.circleX);
                return const Placeholder();
              },
            )
          : widget.prefix,
      suffix: widget.suffix,
      child: widget.child,
    );
  }
}
