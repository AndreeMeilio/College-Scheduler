import 'package:college_scheduler/config/color_config.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key, 
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType inputType = TextInputType.text,
    bool obsureText = false,
    String? Function(String?)? validator,
    bool isPassword = false,
    void Function()? suffixIconOnPressed,
    void Function(String?)? onChanged,
  }) : _controller = controller,
       _label = label, 
       _hint = hint,
       _inputType = inputType,
       _obsureText = obsureText,
       _validator = validator,
       _isPassword = isPassword,
       _suffixIconOnPressed = suffixIconOnPressed,
       _onChanged = onChanged;

  final TextEditingController _controller;
  final String _label;
  final String _hint;
  final TextInputType _inputType;
  final bool _obsureText;
  final bool _isPassword;
  final void Function()? _suffixIconOnPressed;
  final String? Function(String?)? _validator;
  final void Function(String?)? _onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            _label,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
        const SizedBox(height: 8.0,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          child: TextFormField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: ColorConfig.mainColor)
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: ColorConfig.mainColor)
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: ColorConfig.mainColor)
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: Colors.red)
              ),
              fillColor: ColorConfig.mainColor,
              hintText: _hint,
              hintStyle: const TextStyle(
                color: Colors.grey
              ),
              suffixIcon: _isPassword 
                ? IconButton(
                  onPressed: _suffixIconOnPressed,
                  icon: Icon(_obsureText ? Icons.visibility : Icons.visibility_off)
                )
                : null
            ),
            validator: _validator,
            keyboardType: _inputType,
            controller: _controller,
            obscureText: _obsureText,
            onChanged: _onChanged,
          ),
        )
      ],
    );
  }
}