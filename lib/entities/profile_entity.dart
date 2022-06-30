class Profile {
  final String name;
  final String cpf;
  final String email;
  final String? password;

  Profile({
    required this.cpf,
    required this.email,
    required this.name,
    this.password,
  });
}
