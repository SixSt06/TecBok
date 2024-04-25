import 'dart:async';

mixin Validators {
  final validaPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 5) {
      sink.add(password);
    } else {
      sink.addError('Contraseña invalida');
    }
  });
}
