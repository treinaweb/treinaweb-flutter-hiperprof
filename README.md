# Projeto pratico: Superprof

<p align="center">
  <img src="https://github.com/treinaweb.png" width="200">
</p>


<p align="center">
    Superprof by <a href="https://github.com/treinaweb">TreinaWeb</a>
</p>

## índice
- [Descrição](#descrição)
- [Layout da aplicação](#layout-da-aplicação)
- [Documentacao Api](#documentacao-Api)
- [Commit por aula](#commit-por-aula)

## Descrição

A aplicação a ser desenvolvida deve permitir que pessoas encontrem professores para se candidatar
a uma aula de maneira fácil, além de facilitar a vida de novos professores com um cadastro simples e
para receber as candidaturas dos alunos.

## Layout da aplicação

Abaixo está o link para acessar o [wireframes](https://pt.wikipedia.org/wiki/Website_wireframe) 

- [Wireframes](https://whimsical.com/superprof-WAk9kQhU2Zk85AGPq5seDK)

## Documentacao Api

Abaixo você encontrará todas as informações do quê e como deve ser desenvolvido no front-end.

### Rotas

| Rota                      | Verbo HTTP | Descrição                                                                     |
|---------------------------|------------|-------------------------------------------------------------------------------|
| /api/auth/login           | POST       | Rota responsável por fazer login                                              |
| /api/professores          | POST       | Rota responsável para cadastrar um novo professor                             |
| /api/professores/1/alunos | POST       | Rota responsável por vincular aluno ao professor                              |
| /professores/15/foto      | POST       | Rota responsável para cadastrar foto do professor                             |
| /api/professores          | PUT        | Rota responsável por atualizar um professor                                   |
| /api/professores          | GET        | Rota responsável por pegar todos os professores cadastrado                    |
| /api/professores/1        | GET        | Rota responsável por pegar um profesor especifico                             |
| /api/professores/alunos   | GET        | Rota responsável por pegar todos os alunos do professor                       |
| /api/professores          | GET        | Rota responsável por filtrar professores                                      |
| /api/professores          | DELETE     | Rota responsável deletar professor                                            |

### Rota POST /api/auth/login

**Dados no corpo da requisição**

| Campo       | Tipo    | Exemplo       |
|-------------|---------|---------------|
| email       | string  | joao@mail.com |
| password    | string  | senha@123     |
| dispositivo | string  | androidId     |

Regras de validação:

- `email`: não pode ser nulo
- `email`: não pode ser vazio
- `email`: não pode ser menor que 3 caracteres
- `email`: não pode ser maior que 255 caracteres
- `email`: deve ser um `email` válido
- `password`: não pode ser nulo
- `password`: não pode ser vazio
- `password`: deve ser igual a senha cadastrada para o usuário encontrado
- `dispositivo`: nao deve ser nulo
- `dispositivo`: nao deve ser vazio

**Exemplo de requisição**

```
Content-Type: application/json
Accept : application/json

{
  "email": "joao@mail.com",
  "password": "senha@123",
  "dispositivo": "androdiId"
}
```

### Rota POST /api/professores


**Dados no corpo da requisição**

Dados do local:

| Campo                | Tipo    | Exemplo            |
|----------------------|---------|--------------------|
| nome                 | string  | Ariel Sardinha     |
| idade                | int     | 29                 |
| valorAula            | double  | 50.5               |
| descricao            | string  | -                  |
| email                | string  | 29                 |
| password             | string  | 50.0               |
| passowrdConfirmacao  | string  | 50.0               |

Regras de validação do local:

- `nome`: não pode ser nulo
- `nome`: não pode ser vazio
- `email`: não pode ser nulo
- `email`: não pode ser vazio
- `email`: deve ser um `email` válido
- `password`: não pode ser nulo
- `password`: não pode ser vazio
- `password`: não pode ser menor que 6 caracteres
- `passowrdConfirmacao`: não pode ser nulo
- `passowrdConfirmacao`: não pode ser vazio
- `passowrdConfirmacao`: não pode ser menor que 6 caracteres
- `passowrdConfirmacao e password`: devem ser identicos

**Exemplo de requisição**

```
Content-Type: application/json
Accept : application/json

{
	"nome": "Ariel",
	"idade": 30,
	"valor_aula": 70.00,
	"descricao": "",
	"email": "admin@admin.com",
	"password": "123456",
	"password_confirmation": "123456"
}
```


### Rota POST /api/professores/professorId/alunos


**Dados no corpo da requisição**

Dados do local:

| Campo     | Tipo    | Exemplo                            |
|-----------|---------|------------------------------------|
| nome      | string  | Ariel Sardinha                     |
| email     | string  | ariel@treinaweb.com                |
| dataAula  | string  | 2022-09-10 10:00:00                |

Regras de validação do local:

- `nome`: não pode ser nulo
- `nome`: não pode ser vazio
- `email`: não pode ser nulo
- `email`: não pode ser vazio
- `email`: deve ser um `email` válido
- `dataAula`: deve ser no formato americano
- 
**Exemplo de requisição**

```
Content-Type: application/json
Accept : application/json

{
	"nome": "joao",
	"email": "asd@asd.com",
	"data_aula": "2022-09-10 10:00:00"
}
```

### Rota PUT /api/professores

**Dados no corpo da requisição**

Dados do local:

| Campo                | Tipo    | Exemplo            |
|----------------------|---------|--------------------|
| nome                 | string  | Ariel Sardinha     |
| idade                | int     | 29                 |
| valorAula            | double  | 50.5               |
| descricao            | string  | -                  |
| email                | string  | 29                 |
| password             | string  | 50.0               |
| passowrdConfirmacao  | string  | 50.0               |

Regras de validação do local:

- `nome`: não pode ser nulo
- `nome`: não pode ser vazio
- `email`: não pode ser nulo
- `email`: não pode ser vazio
- `email`: deve ser um `email` válido
- `password`: não pode ser nulo
- `password`: não pode ser vazio
- `password`: não pode ser menor que 6 caracteres
- `passowrdConfirmacao`: não pode ser nulo
- `passowrdConfirmacao`: não pode ser vazio
- `passowrdConfirmacao`: não pode ser menor que 6 caracteres
- `passowrdConfirmacao e password`: devem ser identicos

**Exemplo de requisição**

```
Content-Type: application/json
Accept : application/json
Authorization : Bearer token

{
	"nome": "Ariel",
	"idade": 30,
	"valor_aula": 70.00,
	"descricao": "",
	"email": "admin@admin.com",
	"password": "123456",
	"password_confirmation": "123456"
}
```

### Rota GET /api/professores


**Exemplo de requisição**

```
Content-Type: application/json
Accept : application/json

[
	{
		"id": 1,
		"nome": "aa",
		"idade": 30,
		"valor_aula": "70.00",
		"descricao": "asd",
		"email": "asd",
		"created_at": "2022-05-26T20:51:50.000000Z",
		"updated_at": "2022-05-26T20:51:50.000000Z",
		"foto_perfil": null
	},
	{
		"id": 15,
		"nome": "Ariel",
		"idade": 30,
		"valor_aula": "45.00",
		"descricao": "admin aula de programacao",
		"email": "admin@admin.com",
		"created_at": "2022-05-30T11:30:44.000000Z",
		"updated_at": "2022-05-30T22:00:32.000000Z",
		"foto_perfil": "https:\/\/ediaristas-php.s3.sa-east-1.amazonaws.com\/public\/professores\/OSbPP8c8yRH32BfZKtLnUuOOdz8HEMkt1Zg4sWBY.jpg"
	}
]
```

### Rota GET /api/professores/1


**Exemplo de requisição**

```
Content-Type: application/json
Accept : application/json
Authorization : Bearer token

{
	"id": 1,
	"nome": "aa",
	"idade": 30,
	"valor_aula": "70.00",
	"descricao": "asd",
	"email": "asd",
	"created_at": "2022-05-26T20:51:50.000000Z",
	"updated_at": "2022-05-26T20:51:50.000000Z",
	"foto_perfil": null
},
```

### Rota GET /api/professores/alunos

**Exemplo de requisição**

```
Content-Type: application/json
Accept : application/json
Authorization : Bearer token

[
  {
    "nome": "Ariel Sardinha",
    "email": "ariel@treinaweb.com",
    "hora": "00:00:15",
    "id": 1,
  }
  {
    "nome": "Ariel Sardinha",
    "email": "ariel@treinaweb.com",
    "hora": "00:00:15",
    "id": 2,
  }
]
```


### Rota GET /api/professores?q=`valor`


**Exemplo de requisição**

```
Content-Type: application/json
Accept : application/json

[
	{
		"id": 1,
		"nome": "aa",
		"idade": 30,
		"valor_aula": "70.00",
		"descricao": "asd",
		"email": "valor maior",
		"created_at": "2022-05-26T20:51:50.000000Z",
		"updated_at": "2022-05-26T20:51:50.000000Z",
		"foto_perfil": null
	},
	{
		"id": 15,
		"nome": "Ariel",
		"idade": 30,
		"valor_aula": "45.00",
		"descricao": "admin aula de programacao valor",
		"email": "admin@admin.com",
		"created_at": "2022-05-30T11:30:44.000000Z",
		"updated_at": "2022-05-30T22:00:32.000000Z",
		"foto_perfil": "https:\/\/ediaristas-php.s3.sa-east-1.amazonaws.com\/public\/professores\/OSbPP8c8yRH32BfZKtLnUuOOdz8HEMkt1Zg4sWBY.jpg"
	}
]
```

### Rota POST /professores/15/foto

**Exemplo de requisição**

```
Content-Type: multipart/form-data
Accept : application/json
Authorization : Bearer token

{
    "foto": "foto.png",
}
```


## Commit por aula

Vídeo | Aula | Commit | Link
------ | ------ | ------ | ------
Vídeo 02 | Aula 01 - criando projeto | 08:02 - criando projeto | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/c7349b62921122e94fe7460c32a86d139ce99f9e.zip)
Vídeo 03 | Aula 01 - configurando tema light e dark | 08:02 - configurando tema light e dark | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/a77da5408dbead0e0abc479735575fc806a9dd49.zip)
Vídeo 04 | Aula 01 - criando componente HPTextFormField | 08:02 -  criando componente HPTextFormField  | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/be5ca8b951c0b6a9380e97ebf87d42d6a0ee2fad.zip)
Vídeo 05 | Aula 01 - Criando componente de search, título e botões | 08:02 - Criando componente de search | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/192dcf55351749151fc0926ff4f16981c312a18e.zip)
Vídeo 06 | Aula 02 - criando tela home | 08:02 - criando tela home | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/3fd0c1f8796e1e3c832e86d3e5102241a96f509d.zip)
Vídeo 07 | Aula 02 - criando logica da tela inicial | 08:02 - criando logica da tela inicial | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/753b8ab42f3afd1c8394da405b84a2b9b27daa38.zip)
Vídeo 08 | Aula 02 - Configurando ApiClient | 08:02 - Configurando ApiClient | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/b358c1de864184c74aaa039ec350ae8439de6fda.zip)
Vídeo 09 | Aula 03 - Construindo tela de pesquisa professor | 09:03 - Construindo tela de pesquisa professor | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/69535cd4e5ec0f1caf56a5c6624223d1162620a1.zip)
Vídeo 10 | Aula 03 - Criando a lógica da tela de pesquisa professor | 10:03 - Criando a lógica da tela de pesquisa professor | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/b207d58a532bd33061b20e454ade946c9e3e14f6.zip)
Vídeo 11 | Aula 03 - Integrando tela de pesquisa professor | 11:03 - Integrando tela de pesquisa professor | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/749a7bb7fd57733157d2643d0d29cb6fa46dcd56.zip)
Vídeo 12 | Aula 03 - Finalizando tela de pesquisa professor | 12:03 - Finalizando tela de pesquisa professor | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/ba28083f5e637aba08d9e01f7e5fc5497aaf36fa.zip)
Vídeo 13 | Aula 03 - Criando tela de detalhe do professor | 13:03 - Criando tela de detalhe do professor | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/3c54e23a83e427ea88e1dda3ecea14b9f12ad16f.zip)
Vídeo 14 | Aula 03 - construindo logica e modal da tela | 14:03 - construindo logica e modal da tela | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/2c76bd8cfc7a140f9c3c4f82a97065486ee1fae9.zip)
Vídeo 15 | Aula 03 - integrando tela de detalhe professor | 15:03 - integrando tela de detalhe professor | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/2aba9c6e76ce03083920945c019b998f1b9fc852.zip)
Vídeo 15 | Aula 03 - integrando tela de detalhe professor | 15:03 - integrando tela de detalhe professor | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/94e10f9b4e666dfaa4505ac3615e9fb0eba22ed9.zip)
Vídeo 16 | Aula 03 - Validação do formulario parte 1 | 16:03 - Validação do formulario parte 1 | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/71d58ba2a3f86c711e854bee46afa4483a09711a.zip)
Vídeo 17 | Aula 03 - validação do formulário parte 2 | 17:03 - validação do formulário parte 2 | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/dc804973853ae1877618d2b3cb7a04c3781b3f38.zip)
Vídeo 18 | Aula 04 - Criando tela de cadastro professor | 18:04 - Criando tela de cadastro professor | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/f583d027bbae15a8cf9a6e682a39f2dab10567fc.zip)
Vídeo 20 | Aula 04 - implementando lógica de cadastro | 20:04 - implementando lógica de cadastro | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/d3747457c4664656bc44b9c07e1a469c59848e8d.zip)
Vídeo 21 | Aula 04 - implementando lógica de cadastro parte 2 | 21:04 - implementando lógica de cadastro parte 2 | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/32bec14051cab1edb5ebbca7193f8480aa03f716.zip)
Vídeo 22 | Aula 05 - tela de login | 22:05 - tela de login | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/8ba17d443a062d85c9fd7d20edf26d34deeb545d.zip)
Vídeo 23 | Aula 05 - integrando tela de login | 23:05 - integrando tela de login | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/a82f07fb0ce8df0ee82b30c266b692a2685bd307.zip)
Vídeo 24 | Aula 05 - finalizando logica da tela para fazer login | 24:05 - finalizando logica da tela para fazer login | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/a4d46973a00016f6c46cf959be6a73ffceb96e7c.zip)
Vídeo 25 | Aula 06 - Criando tela do professor | 25:06 - Criando tela do professor | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/c417b51c4c56c12173e69f23b39beaaea817a87b.zip)
Vídeo 26 | Aula 06 - Configurando get para pegar alunos | 26:06 - Configurando get para pegar alunos | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/0fc0b912da5ae63a7568e51d1dfcdc0f5d5c1055.zip)
Vídeo 28 | Aula 06 - Acessando tela professor sem fazer login | 28:06 - Acessando tela professor sem fazer login | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/9794b9053d08d317fa2d666a52656ac4e8aebcbd.zip)
Vídeo 29 | Aula 06 - Logout e acessando página inicial | 29:06 - Logout e acessando página inicial | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/23a6ca812a3d489d60d1c18d0a8b8f2276025f91.zip)
Vídeo 30 | Aula 06 - Passando Professor para tela de formulário | 30:06 - Passando Professor para tela de formulário | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/13d1195be1efec593589cb6e51c8e242d47776f5.zip)
Vídeo 31 | Aula 06 - Abrindo modal para excluir | 31:06 - Abrindo modal para excluir | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/5c02e0c497d650872066c7d022d68b92f44336c6.zip)
Vídeo 32 | Aula 06 - Adicinando câmera | 32:06 - Adicinando câmera | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/e01789840ddcc25e9ec47c533ab735186e9e1768.zip)
Vídeo 33 | Aula 06 - integrando_edição_com_api | 33:06 - integrando_edição_com_api | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/9d910a1a1a7fc8c9110e785a4f94dc24e2ac5e82.zip)
Vídeo 34 | Aula 06 - Aplicando método para deletar e editar professor | 34:06 - Aplicando método para deletar e editar professor | [Download](https://github.com/treinaweb/treinaweb-flutter-hiperprof/archive/85584a8fb1211786b97c87413d1e2a3555d3e690.zip)
