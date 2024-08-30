import 'package:invoice/header_files.dart';
import 'components/itemform.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Add Items"),
        actions: [
          IconButton(
            onPressed: () {
              if (PersonalGlobal.personalInfoKey.currentState!.validate()) {
                PersonalGlobal.personalInfoKey.currentState!.save();
                item.add(
                  Global(
                    name: PersonalGlobal.name,
                    phone: PersonalGlobal.phone,
                    emailAddress: PersonalGlobal.emailAddress,
                    itemname: PersonalGlobal.itemname,
                    itemPrice: PersonalGlobal.itemPrice,
                    itemQty: PersonalGlobal.itemQty,
                    discount: PersonalGlobal.discount,
                    taxrate: PersonalGlobal.taxrate,
                    total: PersonalGlobal.total,
                    totalAmount: PersonalGlobal.totalAmount,
                    image: PersonalGlobal.image,
                    companyname: PersonalGlobal.companyname,
                    companyemail: PersonalGlobal.companyemail,
                    companyphone: PersonalGlobal.companyphone,
                  ),
                );
                SnackBar snackBar = const SnackBar(
                  content: Text(
                    "Item Added",
                    style: TextStyle(fontSize: 18),
                  ),
                  width: 350,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.green,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                setState(() {});
              }
            },
            icon: const Icon(Icons.check),
          ),
          IconButton(
            onPressed: () {
              PersonalGlobal.personalInfoKey.currentState!.reset();
              PersonalGlobal.name;
              PersonalGlobal.phone;
              PersonalGlobal.emailAddress;
              PersonalGlobal.itemname;
              PersonalGlobal.itemPrice;
              PersonalGlobal.itemQty;
              PersonalGlobal.discount;
              PersonalGlobal.taxrate;
              PersonalGlobal.total;
              PersonalGlobal.image;
              PersonalGlobal.companyname;
              PersonalGlobal.companyemail;
              PersonalGlobal.companyphone;

              setState(() {});
            },
            icon: const Icon(
              Icons.restart_alt_outlined,
            ),
          ),
          const SizedBox(
            width: 10,
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
                itemForm(
                  hide: PersonalGlobal.hide,
                  size: s,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
 Tea    : Price : 100
 coffee : Price : 125
 rice   : Price : 200
 Chips  : Price : 100
 Curd   : Price : 50
*/
