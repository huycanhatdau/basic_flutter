import 'package:basic/import.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: factories['header'](context, label: 'Home'),
      body: const Center(
        child: Text('Cá nhân'),
      ),
    );
  }
}
