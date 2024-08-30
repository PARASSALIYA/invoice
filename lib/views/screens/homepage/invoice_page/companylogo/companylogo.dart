import 'package:invoice/header_files.dart';

class CompanyLogoPage extends StatefulWidget {
  const CompanyLogoPage({super.key});

  @override
  State<CompanyLogoPage> createState() => _CompanyLogoPageState();
}

class _CompanyLogoPageState extends State<CompanyLogoPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Company Logo"),
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
            width: 10,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            Container(
              height: 250,
              width: 400,
              alignment: Alignment.center,
              child: Stack(
                alignment: const Alignment(0.8, 0.9),
                children: [
                  CircleAvatar(
                    radius: s.height * 0.15,
                    foregroundImage: PersonalGlobal.image != null
                        ? FileImage(PersonalGlobal.image!) as ImageProvider
                        : const NetworkImage(
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
                          ),
                  ),
                  // image
                  FloatingActionButton.extended(
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.black,
                        context: context,
                        builder: (context) {
                          return Container(
                            height: s.height * 0.15,
                            padding: const EdgeInsets.all(16),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(-3, -3),
                                  color: Colors.white38,
                                  blurRadius: 3,
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () async {
                                ImagePicker picker = ImagePicker();
                                XFile? xFile = await picker.pickImage(
                                    source: ImageSource.gallery);

                                PersonalGlobal.image = File(xFile!.path);
                                setState(() {});
                                Navigator.pop(context);
                              },
                              icon: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.image,
                                    size: 30,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Choose Picture From Gallery",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    backgroundColor: Colors.green,
                    label: const Icon(
                      Icons.camera_alt,
                      weight: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //Name
            TextFormField(
              style: const TextStyle(
                color: Colors.white,
              ),
              onChanged: (value) => PersonalGlobal.companyname = value,
              decoration: InputDecoration(
                hintText: 'Company Name ',
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
              validator: (value) =>
                  (value!.isEmpty) ? 'Please enter  CompanyName' : null,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 20,
            ),
            // phone
            TextFormField(
              maxLength: 10,
              onChanged: (val) => PersonalGlobal.companyphone = val,
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
              onChanged: (val) => PersonalGlobal.companyemail = val,
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
}
