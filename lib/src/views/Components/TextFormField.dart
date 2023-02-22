import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/models/models.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final IconData? icon;
  final String placedholder;
  final bool isObscurable;
  TextEditingController controller;
  final bool isRequired;
  final List<FormValidators>? validators;
  CustomTextField(
      {super.key,
      this.label = "",
      this.placedholder = "",
      this.isObscurable = false,
      required this.controller,
      this.validators,
      this.isRequired = true,
      this.icon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscured = false;
  @override
  void initState() {
    super.initState();

    if (widget.isObscurable) _obscured = true;
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: TextFormField(
        keyboardType: widget.label.toLowerCase().contains('email')
            ? TextInputType.emailAddress
            : TextInputType.text,
        validator: (value) {
          if (!widget.isRequired) return null;
          bool isValid = true;
          List<FormValidators> validators = [(v) => v == null || v.isEmpty];
          validators.addAll(widget.validators ?? []);
          for (FormValidators validator in validators) {
            if (validator(widget.controller.text)) {
              isValid = false;
              break;
            }
          }
          return isValid ? null : 'Ce champ est obligatoire';
        },
        obscureText: _obscured,
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: widget.icon != null
              ? Icon(
                  widget.icon,
                  color: colors.onSecondary,
                )
              : null,
          suffixIcon: widget.isObscurable
              ? IconButton(
                  icon: Icon(
                    _obscured
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: colors.onSecondary,
                  ),
                  onPressed: () => setState(() => _obscured = !_obscured))
              : null,
          hintText: widget.placedholder,
          filled: true,
          fillColor: const Color.fromARGB(50, 252, 252, 255),
          labelText: widget.label,
          labelStyle: const TextStyle(fontSize: 12),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colors.secondary),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colors.onSecondary.withAlpha(150)),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
