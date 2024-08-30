import 'package:invoice/header_files.dart';

class PersonalGlobal {
  static String name = '';
  static String phone = '';
  static String emailAddress = '';
  static String itemname = '';
  static String itemPrice = '';
  static String itemQty = '';
  static String discount = '';
  static String taxrate = '';
  static String companyname = '';
  static String companyphone = '';
  static String companyemail = '';
  static bool hide = true;
  static File? image;
  static double total = 0;
  static double totalAmount = 0;
  static GlobalKey<FormState> personalInfoKey = GlobalKey<FormState>();
}

class Global {
  final String name;
  final String phone;
  final String emailAddress;
  final String itemname;
  final String itemPrice;
  final String itemQty;
  final String discount;
  final String taxrate;
  final String companyname;
  final String companyphone;
  final String companyemail;
  static bool hide = true;
  static File? image;
  final double total;
  final double totalAmount;
  static GlobalKey<FormState> personalInfoKey = GlobalKey<FormState>();

  Global({
    required this.name,
    required this.phone,
    required this.emailAddress,
    required this.itemname,
    required this.itemPrice,
    required this.itemQty,
    required this.discount,
    required this.taxrate,
    required this.companyname,
    required this.companyphone,
    required this.companyemail,
    required this.total,
    required this.totalAmount,
    required image,
  });
}

List<Global> item = [];
var bytes;
var pdfsave;
