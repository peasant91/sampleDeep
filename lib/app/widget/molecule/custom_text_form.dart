import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_text_themes.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm(
      {Key? key,
      required this.controller,
      required this.hint,
      required this.title,
      required this.validator,
      this.defaultValue,
      this.isMandatory = false,
      this.obscureText = false,
      this.enableInteractiveSelection = true,
      this.keyboardType = TextInputType.text,
      this.decoration,
      this.onTap,
      this.readOnly,
      this.errorMsg,
      this.node,
      this.minLines,
      this.maxLines,
      this.maxLength})
      : super(key: key);

  final TextEditingController controller;
  final String hint;
  final bool? readOnly;
  final String title;
  final String? defaultValue;
  final bool isMandatory;
  final bool obscureText;
  final bool enableInteractiveSelection;
  final FormFieldValidator validator;
  final TextInputType keyboardType;
  final InputDecoration? decoration;
  final String? errorMsg;
  final FocusNode? node;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final Function()? onTap;

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  final bool _isValid = true;
  InputDecoration decorator = const InputDecoration();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Text(
              widget.title,
              style: labelLG,
            ),
            const SizedBox(
              width: 4,
            ),
            (widget.isMandatory)
                ? const Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                : const Text("")
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          minLines: widget.minLines,
          maxLines: widget.maxLines ?? 1,
          focusNode: widget.node,
          readOnly: widget.readOnly ?? false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: PrimaryColor.main,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          onTap: widget.onTap != null ? widget.onTap! : null,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textInputAction: TextInputAction.done,
          obscureText: widget.obscureText,
          style: bodyMD,
          maxLength: widget.maxLength,
          validator: widget.validator,
          decoration: ((widget.decoration == null)
                  ? decorator
                  : widget.decoration!)
              .copyWith(
                  labelStyle: bodyMD.copyWith(color: NeutralColor.n70),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding: const EdgeInsets.all(10),
                  errorText: ((widget.errorMsg ?? "").isEmpty)
                      ? null
                      : widget.errorMsg,
                  labelText: widget.hint,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: _isValid ? Colors.grey : Colors.red),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: _isValid ? NeutralColor.n40 : Colors.red),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: _isValid ? PrimaryColor.main : Colors.red),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  errorStyle:
                      labelLG.copyWith(fontSize: 12, color: Colors.red)),
          // The validator receives the text that the user has entered.
        ),
      ],
    );
  }
}

class MultilineTextForm extends StatefulWidget {
  const MultilineTextForm(
      {Key? key,
      required this.controller,
      required this.hint,
      required this.title,
      required this.validator,
      this.defaultValue,
      this.isMandatory = false,
      this.obscureText = false,
      this.enableInteractiveSelection = true,
      this.keyboardType = TextInputType.multiline,
      this.decoration,
      this.onTap,
      this.readOnly,
      this.errorMsg,
      this.node,
      this.maxLength,
      this.height})
      : super(key: key);

  final TextEditingController controller;
  final String hint;
  final bool? readOnly;
  final String title;
  final String? defaultValue;
  final bool isMandatory;
  final bool obscureText;
  final bool enableInteractiveSelection;
  final FormFieldValidator validator;
  final TextInputType keyboardType;
  final InputDecoration? decoration;
  final String? errorMsg;
  final FocusNode? node;
  final int? maxLength;
  final double? height;
  final Function()? onTap;

  @override
  State<MultilineTextForm> createState() => _MultilineTextFormState();
}

class _MultilineTextFormState extends State<MultilineTextForm> {
  final bool _isValid = true;
  InputDecoration decorator = const InputDecoration();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Text(
              widget.title,
              style: labelLG,
            ),
            const SizedBox(
              width: 4,
            ),
            (widget.isMandatory)
                ? const Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                : const Text("")
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: widget.height ?? 200,
          child: TextFormField(
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.top,
            expands: true,
            minLines: null,
            maxLines: null,
            focusNode: widget.node,
            readOnly: widget.readOnly ?? false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: PrimaryColor.main,
            enableInteractiveSelection: widget.enableInteractiveSelection,
            onTap: widget.onTap != null ? widget.onTap! : null,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            textInputAction: TextInputAction.done,
            obscureText: widget.obscureText,
            style: bodyMD,
            maxLength: widget.maxLength,
            validator: widget.validator,
            decoration: ((widget.decoration == null)
                    ? decorator
                    : widget.decoration!)
                .copyWith(
                    labelStyle: bodyMD.copyWith(color: NeutralColor.n70),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    alignLabelWithHint: true,
                    contentPadding: const EdgeInsets.all(10),
                    errorText: ((widget.errorMsg ?? "").isEmpty)
                        ? null
                        : widget.errorMsg,
                    labelText: widget.hint,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: _isValid ? Colors.grey : Colors.red),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: _isValid ? NeutralColor.n40 : Colors.red),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: _isValid ? PrimaryColor.main : Colors.red),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    errorStyle:
                        labelLG.copyWith(fontSize: 12, color: Colors.red)),
            // The validator receives the text that the user has entered.
          ),
        ),
      ],
    );
  }
}
