import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moor_flutter/moor_flutter.dart';

class Encryption {
  final localStorage = GetStorage("Money Manager");
  final iv = IV.fromLength(16);

  Uint8List encrypt(Uint8List plainText) {
    String keyString = passwordToKey(localStorage.read("dbPassword"));
    final key = Key.fromUtf8(keyString);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encryptBytes(
      plainText,
      iv: iv,
    );
    return encrypted.bytes;
  }

  Uint8List decrypt(Uint8List encryptedString) {
    String keyString = passwordToKey(localStorage.read("dbPassword"));
    final key = Key.fromUtf8(keyString);
    final encrypter = Encrypter(AES(key));

    final decrypted = encrypter.decryptBytes(
      Encrypted.fromBase64(base64Encode(encryptedString)),
      iv: iv,
    );
    return Uint8List.fromList(decrypted);
  }

  String passwordToKey(String password) {
    int i = 0;
    String key = 'money_manager';
    while (key.length < 32) {
      key = key + password[i++];
      if (i == password.length && key.length < 32) {
        key = key + '_';
        i = 0;
      }
    }
    return key;
  }
}
