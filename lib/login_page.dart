
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:telegram_repository/telegram_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _status;
  Timer? _poll;

  TelegramRepository telegramRepository = TelegramRepositoryImpl(baseUrl: '');


  @override
  void dispose() {
    _poll?.cancel();
    super.dispose();
  }

  Future<void> _startTelegramLogin() async {
    setState(() => _status = 'Requesting login token...');

    (String token, Uri tgUri, int code) tgTokenUriRecord = await telegramRepository.initiateLogin();

    setState(() => _status = 'Opening Telegram...');


    String token = tgTokenUriRecord.$1;
    Uri uri = tgTokenUriRecord.$2;

    if (token.isEmpty) return;

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      setState(() => _status = 'Could not open Telegram.');
      return;
    }

    // Start polling for approval
    _poll?.cancel();
    _poll = Timer.periodic(const Duration(seconds: 2), (_) async {
      bool isLoginApproved = await telegramRepository.checkLoginApproved(token);
      if (isLoginApproved) {
        _poll?.cancel();
        await telegramRepository.fetchAccessToken(token);
      } else {
        _poll?.cancel();
      }
    });
    setState(() => _status = 'Waiting for approval in Telegram...');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login with Telegram')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: _startTelegramLogin,
                icon: const Icon(Icons.login),
                label: const Text('Login with Telegram'),
              ),
              const SizedBox(height: 16),
              if (_status != null) Text(_status!),
            ],
          ),
        ),
      ),
    );
  }
}
