import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kopay/app/helper.dart';

import 'custom_text_form.dart';

class FormUsernameField extends StatefulWidget {
  const FormUsernameField({Key? key, required this.ctrl}) : super(key: key);

  final TextEditingController ctrl;

  @override
  FormUsernameFieldState createState() => FormUsernameFieldState();
}

class FormUsernameFieldState extends State<FormUsernameField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextForm(
        controller: widget.ctrl,
        hint: "username_placeholder".tr,
        title: "username_title".tr,
        isMandatory: true,
        validator: (value) {
          if (value.isEmpty) {
            return "username_empty".tr;
          } else if (value.toString().length > 50) {
            return "username_invalid".tr;
          }
          return null;
        });
  }
}

class FormPasswordField extends StatefulWidget {
  const FormPasswordField(
      {Key? key, required this.ctrl, this.label, this.errorMsg})
      : super(key: key);

  final TextEditingController ctrl;
  final String? label;
  final String? errorMsg;

  @override
  FormPasswordFieldState createState() => FormPasswordFieldState();
}

class FormPasswordFieldState extends State<FormPasswordField> {
  bool _obscureText = true;

  _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextForm(
      errorMsg: widget.errorMsg,
      isMandatory: true,
      controller: widget.ctrl,
      obscureText: _obscureText,
      hint: "password_placeholder".tr,
      title: (widget.label == null) ? "password_title".tr : widget.label!,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: _obscureText
              ? SvgPicture.asset('assets/images/svg/eye_off.svg')
              : SvgPicture.asset('assets/images/svg/eye_on.svg'),
          onPressed: () {
            _togglePassword();
          },
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "password_empty".tr;
        }
        return null;
      },
    );
  }
}

class FormConfirmPasswordField extends StatefulWidget {
  const FormConfirmPasswordField(
      {Key? key, required this.ctrl, required this.passCtrl, this.label})
      : super(key: key);

  final TextEditingController ctrl;
  final TextEditingController passCtrl;
  final String? label;

  @override
  FormConfirmPasswordFieldState createState() =>
      FormConfirmPasswordFieldState();
}

class FormConfirmPasswordFieldState extends State<FormConfirmPasswordField> {
  bool _obscureText = true;

  _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextForm(
      isMandatory: true,
      controller: widget.ctrl,
      obscureText: _obscureText,
      hint: "conf_password_placeholder".tr,
      title: "conf_password_title".tr,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: _obscureText
              ? SvgPicture.asset('assets/images/svg/eye_off.svg')
              : SvgPicture.asset('assets/images/svg/eye_on.svg'),
          onPressed: () {
            _togglePassword();
          },
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "conf_password_empty".tr;
        } else if (value != widget.passCtrl.value.text) {
          return "conf_password_invalid".tr;
        }
        return null;
      },
    );
  }
}

class FormEmailField extends StatefulWidget {
  const FormEmailField({Key? key, required this.ctrl, this.node, this.errorMsg})
      : super(key: key);

  final TextEditingController ctrl;
  final FocusNode? node;
  final String? errorMsg;

  @override
  FormEmailFieldState createState() => FormEmailFieldState();
}

class FormEmailFieldState extends State<FormEmailField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextForm(
        errorMsg: widget.errorMsg,
        isMandatory: true,
        node: widget.node,
        controller: widget.ctrl,
        hint: "email_placeholder".tr,
        title: "email_title".tr,
        validator: (value) {
          if (value.toString().isEmpty) {
            return "email_empty".tr;
          } else if (value.toString().isInvalidEmail()) {
            return "email_invalid".tr;
          }
        });
  }
}

class FormDOBField extends StatefulWidget {
  const FormDOBField({super.key, required this.ctrl, required this.onTap});

  final TextEditingController ctrl;
  final Function onTap;

  @override
  State<FormDOBField> createState() => _FormDOBFieldState();
}

class _FormDOBFieldState extends State<FormDOBField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextForm(
        readOnly: true,
        onTap: () => widget.onTap(),
        controller: widget.ctrl,
        hint: "dob_field_placeholder".tr,
        title: "dob_field_title".tr,
        decoration: InputDecoration(
          suffixIconConstraints:
              const BoxConstraints.expand(width: 36, height: 20),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset('assets/images/svg/icon_calendar_gray.svg'),
          ),
        ),
        validator: (value) {
          if (value.toString().isEmpty) {
            return "dob_empty".tr;
          }
        });
  }
}

class FormProvinceField extends StatefulWidget {
  const FormProvinceField({super.key, required this.ctrl, required this.onTap});

  final TextEditingController ctrl;
  final Function onTap;

  @override
  State<FormProvinceField> createState() => _FormProvinceFieldState();
}

class _FormProvinceFieldState extends State<FormProvinceField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextForm(
        readOnly: true,
        onTap: () => widget.onTap(),
        controller: widget.ctrl,
        hint: "province_field_placeholder".tr,
        title: "province_field_title".tr,
        decoration: InputDecoration(
          suffixIconConstraints:
              const BoxConstraints.expand(width: 36, height: 20),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset('assets/images/svg/icon_arrow_down.svg'),
          ),
        ),
        validator: (value) {
          if (value.toString().isEmpty) {
            return "province_empty".tr;
          }
        });
  }
}

class FormFeedbackTitleField extends StatefulWidget {
  const FormFeedbackTitleField(
      {Key? key, required this.ctrl, this.node, this.errorMsg})
      : super(key: key);

  final TextEditingController ctrl;
  final FocusNode? node;
  final String? errorMsg;

  @override
  FormFeedbackTitleFieldState createState() => FormFeedbackTitleFieldState();
}

class FormFeedbackTitleFieldState extends State<FormFeedbackTitleField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextForm(
        maxLength: 50,
        errorMsg: widget.errorMsg,
        isMandatory: true,
        node: widget.node,
        controller: widget.ctrl,
        hint: "feedback_title_placeholder".tr,
        title: "feedback_title".tr,
        validator: (value) {
          if (value.toString().isEmpty) {
            return "feedback_title_empty".tr;
          }
        });
  }
}

class FormFeedbackDescription extends StatefulWidget {
  const FormFeedbackDescription(
      {super.key, required this.ctrl, this.node, this.errorMsg});

  final TextEditingController ctrl;
  final FocusNode? node;
  final String? errorMsg;

  @override
  State<FormFeedbackDescription> createState() =>
      _FormFeedbackDescriptionState();
}

class _FormFeedbackDescriptionState extends State<FormFeedbackDescription> {
  @override
  Widget build(BuildContext context) {
    return MultilineTextForm(
        keyboardType: TextInputType.multiline,
        maxLength: 500,
        errorMsg: widget.errorMsg,
        isMandatory: true,
        node: widget.node,
        controller: widget.ctrl,
        hint: "description_placeholder".tr,
        title: "description".tr,
        validator: (value) {
          if (value.toString().isEmpty) {
            return "description_empty".tr;
          }
        });
  }
}

class FormPhoneField extends StatefulWidget {
  const FormPhoneField({Key? key, required this.ctrl, this.node, this.errorMsg})
      : super(key: key);

  final TextEditingController ctrl;
  final FocusNode? node;
  final String? errorMsg;

  @override
  FormPhoneFieldState createState() => FormPhoneFieldState();
}

class FormPhoneFieldState extends State<FormPhoneField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextForm(
        errorMsg: widget.errorMsg,
        keyboardType: TextInputType.number,
        isMandatory: true,
        node: widget.node,
        controller: widget.ctrl,
        hint: "phone_placeholder".tr,
        title: "phone_title".tr,
        validator: (value) {
          if (value.toString().isEmpty) {
            return "phone_empty".tr;
          }
        });
  }
}

class FormCodeField extends StatefulWidget {
  const FormCodeField({Key? key, required this.ctrl, this.node, this.errorMsg})
      : super(key: key);

  final TextEditingController ctrl;
  final FocusNode? node;
  final String? errorMsg;

  @override
  FormCodeFieldState createState() => FormCodeFieldState();
}

class FormCodeFieldState extends State<FormCodeField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextForm(
        errorMsg: widget.errorMsg,
        keyboardType: TextInputType.text,
        isMandatory: true,
        node: widget.node,
        controller: widget.ctrl,
        hint: "Masukan Kode pada kolom ini",
        title: "Kode",
        validator: (value) {
          if (value.toString().isEmpty) {
            return "code_empty".tr;
          }
        });
  }
}
