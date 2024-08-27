import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

Future<void> sendOtpEmail({
  required String recipientEmail,
  required String otp,
}) async {
  String username = 'denysemutoniuwingeneye@gmail.com';
  String password = 'uolr xazr ntom ytil';

  final smtpServer = gmail(username, password);

  final message = Message()
    ..from = Address(username, 'Riders ap')
    ..recipients.add(recipientEmail)
    ..subject = 'Your OTP Code'
    ..text = 'Your OTP code is: $otp';

  try {
    final sendReport = await send(message, smtpServer);
    print('OTP sent: $sendReport');
  } on MailerException catch (e) {
    print('Failed to send OTP: ${e.toString()}');
  }
}
