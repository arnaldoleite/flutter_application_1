🏨 Flutter Restaurant App

Um aplicativo Flutter para gerenciar restaurantes, com integração em Firebase Firestore. Permite listar, criar e visualizar restaurantes, incluindo seus endereços e pratos do dia (DailyFood).

O app utiliza forms dinâmicos com base nas propriedades das classes Restaurant, Address e DailyFood.

📌 Funcionalidades

Listar restaurantes em tempo real do Firestore.

Criar um novo restaurante com:

Nome, Nome completo, Número de contacto

Endereço (Address) e GPS

DailyFood (até 3 pratos)

Imagem de logo e fundo

Mensagens de restaurante fechado

Formulário dinâmico, baseado nas propriedades da classe.

Feedback visual com SnackBar em sucesso/erro ao gravar.

Estrutura preparada para edição futura de restaurantes, endereço e pratos.

🏗 Estrutura do Projeto
lib/
 ├── main.dart
 ├── screens/
 │   ├── restaurant_list_screen.dart
 │   ├── restaurant_create_screen.dart
 │   ├── restaurant_screen.dart
 │   ├── address_screen.dart
 │   └── dailyfood_screen.dart
 ├── models/
 │   ├── restaurant.dart
 │   └── base.dart


screens/ → contém todos os ecrãs da aplicação.

models/ → contém as classes Restaurant, Address, DailyFood e customProperty.

⚡ Tecnologias Utilizadas

Flutter 3.x / Dart

Firebase Firestore para persistência de dados

StreamBuilder para atualização em tempo real

SnackBar para feedback de sucesso/erro

Formulários dinâmicos baseados em metadata das classes

🔧 Como Executar

Clone este repositório:

git clone https://github.com/seu-usuario/flutter-restaurant-app.git
cd flutter-restaurant-app


Instale as dependências:

flutter pub get


Configure o Firebase:

Android → coloque google-services.json em android/app/

iOS → coloque GoogleService-Info.plist em ios/Runner/

Inicialize o Firebase em main.dart:

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


Execute o app:

flutter run

💡 Boas Práticas Implementadas

Formulários dinâmicos com getCustomProperty()

Criação de objetos com valores default (Address.empty(), DailyFood.empty())

Leitura e gravação defensiva de dados do Firestore

Feedback visual para sucesso ou erro na gravação

StreamBuilder para sincronização em tempo real com Firestore

📝 Possíveis Melhorias Futuras

Editar e apagar restaurantes

Separar ecrãs para Address e DailyFood

Integração com Firebase Auth para gerir creatorId

Upload de imagens para Firebase Storage

Validação mais avançada de campos (e.g. GPS, preços)

👨‍💻 Autor

Arnaldo – Desenvolvedor Flutter e Firebase
