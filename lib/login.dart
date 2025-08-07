import 'package:flutter/material.dart';
import 'package:project/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// State untuk LoginPage
class _LoginPageState extends State<LoginPage> {
  // Global key untuk mengakses dan memvalidasi Form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Variabel untuk mengatur visibilitas kata sandi
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold sebagai kerangka utama tampilan
      body: Center(
        // Center untuk memposisikan Card di tengah layar
        child: Card(
          elevation: 8, // Efek bayangan pada Card
          child: Container(
            padding: const EdgeInsets.all(32.0), // Padding dalam Card
            constraints: const BoxConstraints(
              maxWidth: 350,
            ), // Lebar maksimum Card
            child: Form(
              key: _formKey, // Form untuk validasi input
              child: SingleChildScrollView(
                // Agar tampilan bisa di-scroll jika layar kecil
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ukuran kolom mengikuti isi
                  children: [
                    const FlutterLogo(size: 100), // Logo Flutter di atas form
                    const SizedBox(height: 20), // Spasi vertikal
                    Text(
                      "Selamat Datang di Aplikasi Flutter!",
                      style: Theme.of(context).textTheme.titleMedium, // Gaya teks dari tema
                    ),
                    const SizedBox(height: 8), // Jarak bawah dari teks sambutan

                    // INPUT EMAIL
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Masukkan email anda',
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email tidak boleh kosong';
                        }
                        final emailRegex =
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                        final emailValid = RegExp(emailRegex).hasMatch(value);
                        if (!emailValid) {
                          return 'Format email tidak valid';
                        }
                        return null;
                      },
                    ),
                                        // INPUT EMAIL
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email', // Label kolom
                        hintText: 'Masukkan email', // Hint dalam kolom
                        prefixIcon: Icon(
                          Icons.email_outlined, // Icon email di depan
                        ),
                        border: OutlineInputBorder(), // Border kotak
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email tidak boleh kosong';
                        }
                        final emailRegex =
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                        final emailValid = RegExp(emailRegex).hasMatch(value);
                        if (!emailValid) {
                          return 'Format email tidak valid';
                        }
                        return null; // Jika valid
                      },
                    ),

                    _gap(), // Spasi antar input

                    // INPUT PASSWORD
                    TextFormField(
                      obscureText: !_isPasswordVisible, // Jika false, password disembunyikan
                      decoration: InputDecoration(
                        labelText: 'Kata Sandi',
                        hintText: 'Masukkan kata sandi',
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          // Icon untuk toggle visibilitas kata sandi
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kata sandi tidak boleh kosong';
                        }
                        if (value.length < 6) {
                          return 'Kata sandi minimal 6 karakter';
                        }
                        return null;
                      },
                    ),
                                        _gap(), // Spasi bawah password

                    // TOMBOL MASUK
                    SizedBox(
                      width: double.infinity, // Tombol selebar container
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Warna tombol biru
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4), // Sudut tombol membulat
                          ),
                        ),
                        onPressed: () {
                          // Cek validasi form sebelum lanjut
                          if (_formKey.currentState?.validate() ?? false) {
                            // Navigasi ke halaman Home jika login berhasil
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0), // Padding dalam tombol
                          child: Text(
                            'Masuk',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Warna teks putih untuk kontras
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget helper untuk spasi antar elemen
  Widget _gap() => const SizedBox(height: 16);
}


