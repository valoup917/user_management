import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_management/components/notification_service_web.dart';
import 'package:user_management/components/user_status.dart';

class AdminButton extends StatefulWidget {
  @override
  _AdminButtonState createState() => _AdminButtonState();
}

class _AdminButtonState extends State<AdminButton> {
  bool _isAdmin = false;

  @override
  void initState() {
    super.initState();
    _checkAdminStatus();
  }

  Future<void> _checkAdminStatus() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final bool isAdmin = await userStatus().checkAdminStatus(user.uid);
      setState(() {
        _isAdmin = isAdmin;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: _isAdmin
            ? () {
                NotificationService.pushNotification(
                  title: 'Admin Button',
                  body: 'You are an admin, this is why you are special and can press this button'
                );
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: _isAdmin ? Theme.of(context).colorScheme.primary : Colors.grey[400],
          foregroundColor: Colors.white,
          elevation: 10,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.notifications_active),
            SizedBox(width: 10),
            Text('Send Notification'),
          ],
        ),
      ),
    );
  }
}
