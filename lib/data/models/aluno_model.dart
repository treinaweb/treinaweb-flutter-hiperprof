class Aluno {
  String nome, email, data;

  int? id;

  Aluno({
    required this.nome,
    required this.email,
    required this.data,
    this.id,
  });

  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(
      nome: json['nome'],
      email: json['email'],
      data: json['data_aula'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      "data_aula": data,
      'id': id,
    };
  }
}
