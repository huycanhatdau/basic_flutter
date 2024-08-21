import 'package:basic/import.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: factories['header'](context, label: 'Home'),
      body: const Center(
        child: Text('Trang chủ'),
      ),
    );
  }
}
