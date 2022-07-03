abstract class Validators {
  static String? email(String? value) {
    if (value == null) return null;

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return 'Campo inválido';
    } else {
      return null;
    }
  }

  static String? requiredField(String? value) {
    if (value == null) return null;

    if (value.isEmpty) {
      return 'Campo obrigatório';
    }
  }

  static String? cpf(String? value) {
    Pattern pattern = r'^\d{3}\.\d{3}\.\d{3}\-\d{2}$';
    RegExp regex = RegExp(pattern as String);

    if (!regex.hasMatch(value!)) {
      return 'CPF inválido';
    } else if (!validateCpf(value.replaceAll(RegExp(r'[^0-9]'), ''))) {
      return 'CPF inválido';
    } else {
      return null;
    }
  }

  static bool validateCpf(String strCPF) {
    if (strCPF.length < 11) return false;
    int soma = 0;
    int resto = 0;
    soma = 0;
    if (strCPF == "00000000000" ||
        strCPF == "11111111111" ||
        strCPF == "22222222222" ||
        strCPF == "3333333333" ||
        strCPF == "44444444444" ||
        strCPF == "55555555555" ||
        strCPF == "66666666666" ||
        strCPF == "77777777777" ||
        strCPF == "88888888888" ||
        strCPF == "99999999999") {
      return false;
    }

    for (int i = 1; i <= 9; i++) {
      soma = soma + int.parse(strCPF.substring(i - 1, i)) * (11 - i);
    }
    resto = (soma * 10) % 11;

    if ((resto == 10) || (resto == 11)) resto = 0;
    if (resto != int.parse(strCPF.substring(9, 10))) return false;

    soma = 0;
    for (int i = 1; i <= 10; i++) {
      soma = soma + int.parse(strCPF.substring(i - 1, i)) * (12 - i);
    }
    resto = (soma * 10) % 11;

    if ((resto == 10) || (resto == 11)) resto = 0;
    if (resto != int.parse(strCPF.substring(10, 11))) {
      return false;
    } else {
      return true;
    }
  }
}
