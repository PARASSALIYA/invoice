import 'package:invoice/header_files.dart';
import 'components/form.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("New Client"),
        actions: [
          IconButton(
            onPressed: () {
              if (PersonalGlobal.personalInfoKey.currentState!.validate()) {
                PersonalGlobal.personalInfoKey.currentState!.save();
              }
              setState(() {});
            },
            icon: const Icon(Icons.check),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: PersonalGlobal.personalInfoKey,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Column(
              children: [
                form(
                  hide: PersonalGlobal.hide,
                  size: s,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
