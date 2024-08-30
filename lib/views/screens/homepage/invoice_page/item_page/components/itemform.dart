import 'package:invoice/header_files.dart';

Widget itemForm({
  required bool hide,
  required size,
}) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: SingleChildScrollView(
      child: Column(
        children: [
          texFormField(
            hintText: 'ItemName',
            prefixIcon: null,
            validator: (value) =>
                (value!.isEmpty) ? 'Please enter item name' : null,
            onSaved: (val) {
              PersonalGlobal.itemname = val!;
            },
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: 20,
          ),
          texFormField(
            hintText: 'ItemPrice',
            prefixIcon: const Icon(
              Icons.currency_rupee,
              color: Colors.white,
              size: 15,
            ),
            validator: null,
            onSaved: (val) {
              PersonalGlobal.itemPrice = val!;
            },
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          texFormField(
            hintText: 'ItemQty',
            prefixIcon: null,
            validator: null,
            onSaved: (val) {
              PersonalGlobal.itemQty = val!;
            },
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          texFormField(
            hintText: 'Discount',
            prefixIcon: null,
            validator: null,
            onSaved: (val) {
              PersonalGlobal.discount = val!;
            },
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          texFormField(
            hintText: 'TexRate',
            prefixIcon: null,
            validator: null,
            onSaved: (val) {
              PersonalGlobal.taxrate = val!;
            },
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    ),
  );
}
