class Professor {
  String nome, descricao, email;
  double valorAula;
  int? id;
  int idade;
  String? fotoPerfil;

  Professor({
    required this.nome,
    required this.descricao,
    required this.email,
    required this.valorAula,
    required this.idade,
    this.fotoPerfil,
    this.id,
  });

  factory Professor.fromJson(Map<String, dynamic> json) {
    return Professor(
      nome: json['nome'],
      descricao: json['descricao'],
      email: json['email'],
      valorAula: double.parse(json['valor_aula']),
      idade: json['idade'],
      fotoPerfil: json['foto_perfil'],
      id: json['id'],
    );
  }
}