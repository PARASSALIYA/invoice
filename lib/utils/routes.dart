import 'package:invoice/header_files.dart';

class Routes {
  static String splashpage = '/';
  static String homepage = 'homepage';
  static String invoice = 'Invoice';

  static List buildoption = [
    {
      'name': 'Company',
      'route': 'companylogo',
      'icon': 'assets/image/logo.png',
    },
    {
      'name': 'name',
      'route': 'name',
      'icon': 'assets/image/user.png',
    },
    {
      'name': 'Items',
      'route': 'item',
      'icon': 'assets/image/shopping.png',
    },
    {
      'name': 'Signature',
      'route': 'signature',
      'icon': 'assets/image/signature.png',
    },
    {
      'name': 'Bill',
      'route': 'bil',
      'icon': 'assets/image/bill.png',
    },
  ];
}

Map<String, Widget Function(BuildContext)> routes = {
  Routes.splashpage: (context) => const SplashPage(),
  Routes.homepage: (context) => const HomePage(),
  Routes.invoice: (context) => const InvoicePage(),
  Routes.buildoption[0]['route']: (context) => const CompanyLogoPage(),
  Routes.buildoption[1]['route']: (context) => const PersonalInfoPage(),
  Routes.buildoption[2]['route']: (context) => const ItemPage(),
  Routes.buildoption[3]['route']: (context) => const SignaturePage(),
  Routes.buildoption[4]['route']: (context) => const BillPage(),
};
