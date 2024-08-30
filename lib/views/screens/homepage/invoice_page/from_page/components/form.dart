import 'package:invoice/header_files.dart';

Widget form({required bool hide, required size}) {
  String pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

  RegExp regExp = RegExp(pattern);
  return Padding(
    padding: const EdgeInsets.all(16),
    child: SingleChildScrollView(
      child: Column(
        children: [
          //Name
          TextFormField(
            style: const TextStyle(
              color: Colors.white,
            ),
            onChanged: (value) => PersonalGlobal.name = value,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.person_outlined,
                color: Colors.white,
              ),
              hintText: 'Username ',
              hintStyle: const TextStyle(
                color: Colors.green,
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.white, width: 2.5),
              ),
            ),
            validator: (value) => (value!.isEmpty) ? 'Please enter name' : null,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 20,
          ),
          // phone
          TextFormField(
            maxLength: 10,
            onSaved: (val) {
              PersonalGlobal.phone = val!;
            },
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintMaxLines: 10,
              label: const Text(
                "Phone",
                style: TextStyle(
                  color: Colors.green,
                ),
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
              prefixIcon: const Icon(
                Icons.phone_outlined,
                color: Colors.white,
              ),
            ),
            keyboardType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textInputAction: TextInputAction.next,
          ),
          //EmailAddress
          TextFormField(
            onSaved: (val) {
              PersonalGlobal.emailAddress = val!;
            },
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: Colors.white,
              ),
              label: const Text(
                "Email Address",
                style: TextStyle(
                  color: Colors.green,
                ),
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
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    ),
  );
}
