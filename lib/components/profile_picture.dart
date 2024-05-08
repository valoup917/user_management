import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final String? pictureUrl;
  final VoidCallback onTap;

  const ProfilePicture({Key? key, this.pictureUrl, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: pictureUrl != null
                ? NetworkImage(pictureUrl!)
                : const AssetImage('assets/UMLogo.png') as ImageProvider,
          ),
        ),
      ),
    );
  }
}
