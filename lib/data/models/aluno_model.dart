class Aluno {
  String nome, email, data;

  int? id;

  Aluno({
    required this.nome,
    required this.email,
    required this.data,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      "data_aula": data,
      'id': id,
    };
  }
}
