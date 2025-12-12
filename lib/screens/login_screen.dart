import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  void dispose() {
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _onLogin() {
    // Tạm thời: login xong nhảy vào Home, truyền tên user
    final username = _userCtrl.text.trim().isEmpty
        ? 'user'
        : _userCtrl.text.trim();

    Navigator.pushReplacementNamed(
      context,
      HomeScreen.routeName,
      arguments: username,
    );
  }

  void _goRegister() {
    Navigator.pushNamed(context, RegisterScreen.routeName);
  }

  Widget _buildTopBar(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          Container(color: theme.primaryColor, width: double.infinity),
          Positioned(
            left: 16,
            top: 16,
            child: Material(
              color: Colors.white,
              shape: const CircleBorder(),
              elevation: 2,
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            ),
          ),
          const Positioned(
            right: 16,
            top: 22,
            child: Icon(Icons.pets, color: Colors.white, size: 24),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // icon mèo lớn
                    SizedBox(
                      height: 120,
                      child: Image.asset(
                        'assets/images/cat.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'NetTruyen',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 24),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Đăng Nhập :',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _userCtrl,
                      decoration: const InputDecoration(hintText: 'user'),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _passCtrl,
                      obscureText: true,
                      decoration: const InputDecoration(hintText: 'Mật khẩu'),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _onLogin,
                      child: const Text('Đăng nhập'),
                    ),
                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Bạn chưa có tài khoản ? '),
                        GestureDetector(
                          onTap: _goRegister,
                          child: const Text(
                            'Đăng ký',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Quên mật khẩu?'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
