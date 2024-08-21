import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter_template/enums/widget_configurations/app_input_variant.dart';
import 'package:flutter_starter_template/theme/theme_constants.dart';
import 'package:flutter_starter_template/values/dimens.dart';
import 'package:flutter_starter_template/theme/styles.dart';
import 'package:flutter_starter_template/values/durations.dart';
import 'package:flutter_starter_template/widgets/common/input/overridable_form_input.dart';
import 'package:flutter_starter_template/widgets/common/visual/animated_switcher.dart';

enum AppInputLabelVariant { label, hint }

class AppTextInput extends StatefulWidget {
  final String label;
  final String? initialValue;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autocorrect;
  final bool obscureText;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final Color? labelColor;
  final AppInputVariant variant;
  final AppInputLabelVariant labelVariant;
  final String? prefixText;
  final TextStyle typingStyle;
  final bool isDismissable;
  final Function(String?)? onChanged;
  final Widget? trailingWidgetOverride;
  final Color? borderColorOverride;
  final bool isEnabled;
  final Widget? leadingWidget;
  final TextStyle? errorTextStyle;
  final bool isRequired;
  final bool shouldDisplaySuccess;
  final Key? formKey;
  final FormFieldValidator<String>? validator;
  final bool validateOnInput;

  const AppTextInput({
    super.key,
    this.label = '',
    this.initialValue,
    this.controller,
    this.focusNode,
    this.autocorrect = true,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters = const [],
    this.labelColor,
    this.variant = AppInputVariant.light,
    this.labelVariant = AppInputLabelVariant.hint,
    this.prefixText,
    this.isDismissable = false,
    this.onChanged,
    this.trailingWidgetOverride,
    this.borderColorOverride,
    this.isEnabled = true,
    this.leadingWidget,
    this.typingStyle = Styles.h6HeadingWhite,
    this.errorTextStyle,
    this.isRequired = false,
    this.shouldDisplaySuccess = false,
    this.formKey,
    this.validator,
    this.validateOnInput = false,
  });

  @override
  State<AppTextInput> createState() => _AppTextInputState();
}

class _AppTextInputState extends State<AppTextInput> {
  final GlobalKey<FormFieldState> _formKey = GlobalKey<FormFieldState>();
  late bool _hasHadInput = true;

  late final FocusNode _focus;
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();

    _focus = widget.focusNode ?? FocusNode();
    _focus.addListener(() {
      if (mounted) setState(() => _isSelected = _focus.hasFocus);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Allows for manual modification of the form state
      widget.controller?.addListener(() {
        String? value = widget.controller!.text;
        _formKey.currentState?.didChange(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Color textColour = widget.isEnabled
        ? widget.variant.textColor
        : widget.variant.disabledTextColor;
    Color backgroundColour = widget.isEnabled
        ? widget.variant.backgroundColor
        : widget.variant.disabledBackgroundColor;
    Color borderColour = _isSelected
        ? widget.variant.selectedBorderColor
        : widget.variant.borderColor;

    Color? defaultBorderColor;
    Widget? trailingWidget;

    return OverridableErrorFormField<String>(
      key: widget.formKey ?? _formKey,
      initialValue: widget.initialValue ?? widget.controller?.text,
      validator: widget.validator,
      builder: (formstate) {
        if (!_hasHadInput &&
            !formstate.hasError &&
            widget.shouldDisplaySuccess) {
          defaultBorderColor = colors(context).successColor;
          trailingWidget = Icon(
            Icons.check,
            color: colors(context).successColor,
            size: Dimens.marginSmall,
          );
        }

        return Column(
          children: [
            AnimatedContainer(
              duration: DurationValues.normal,
              constraints: const BoxConstraints(
                minHeight: Dimens.inputHeight,
                maxHeight: Dimens.inputHeight,
              ),
              decoration: BoxDecoration(
                color: backgroundColour,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    Dimens.radiusDefault,
                  ),
                ),
                border: Border.all(
                  color: formstate.errorText != null
                      ? colors(context).errorColor ?? borderColour
                      : defaultBorderColor ?? borderColour,
                  width: 0.7,
                  style: BorderStyle.solid,
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: Dimens.marginSmall,
                  ),
                  AppAnimatedSwitcher(
                    child: widget.leadingWidget ??
                        widget.variant.leadingWidget ??
                        const SizedBox.shrink(),
                  ),
                  Expanded(
                    child: TextField(
                      autocorrect: widget.autocorrect,
                      focusNode: _focus,
                      controller: widget.controller,
                      obscureText: widget.obscureText,
                      enabled: widget.isEnabled,
                      style: widget.typingStyle.copyWith(color: textColour),
                      decoration: InputDecoration(
                        prefixText: widget.prefixText,
                        prefixStyle: widget.typingStyle
                            .copyWith(color: widget.labelColor ?? textColour),
                        labelStyle: widget.typingStyle
                            .copyWith(color: widget.labelColor ?? textColour),
                        hintText:
                            widget.labelVariant == AppInputLabelVariant.hint
                                ? widget.label
                                : null,
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        formstate.didChange(value);
                        widget.onChanged?.call(value);

                        if (widget.validateOnInput) formstate.validate();

                        setState(() => _hasHadInput = false);
                      },
                    ),
                  ),
                  AppAnimatedSwitcher(
                    child: widget.trailingWidgetOverride != null ||
                            trailingWidget != null
                        ? widget.trailingWidgetOverride ?? trailingWidget!
                        : const SizedBox.shrink(),
                  ),
                  const SizedBox(
                    width: Dimens.marginSmall,
                  ),
                ],
              ),
            ),
            AnimatedSize(
              duration: DurationValues.quick,
              child: AnimatedSwitcher(
                duration: DurationValues.quick,
                child: formstate.errorText != null
                    ? Padding(
                        key: ValueKey(formstate.errorText),
                        padding: const EdgeInsets.only(
                          top: Dimens.marginVerySmall,
                          left: Dimens.marginDefault,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            formstate.errorText!,
                            textAlign: TextAlign.start,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: colors(context).errorColor,
                                    ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            )
          ],
        );
      },
    );
  }
}
