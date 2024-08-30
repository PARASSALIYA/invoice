import 'package:invoice/header_files.dart';

Widget texFormField({
  required hintText,
  required prefixIcon,
  required validator,
  required onSaved,
  required keyboardType,
}) {
  return TextFormField(
    style: const TextStyle(
      color: Colors.white,
    ),
    onSaved: onSaved,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Colors.white60,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.white, width: 2.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1.5,
        ),
      ),
      prefixIcon: prefixIcon,
    ),
    validator: validator,
    textInputAction: TextInputAction.next,
    keyboardType: keyboardType,
  );
}
