import 'package:flutter/material.dart';
import 'package:uniceps/features/Profile/presentation/widgets/settings_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uniceps"),
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("ASDASDASDASDASD"),
                      content: Text("content contentcontentcontentcontent"),
                      actions: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("ok"),
                        ),
                        ElevatedButton(onPressed: () {}, child: Text("no"))
                      ],
                    ).build(context);
                  });
            },
            icon: Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                child: Text("Uniceps"),
                radius: 50,
              ),
            ),
            SettingTile(
              title: "Measurements",
            ),
            SettingTile(
              title: "Language",
            ),
            SettingTile(
              title: "About",
            ),
          ],
        ),
      ),
    );
  }
}
