class Professor {
  String nome, descricao, email;
  double valorAula;
  int? id;
  String? fotoPerfil;

  Professor({
    required this.nome,
    required this.descricao,
    required this.email,
    required this.valorAula,
    this.fotoPerfil,
    this.id,
  });
}
