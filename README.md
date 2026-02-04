<h1>🏨 Flutter Restaurant App</h1>
<h1> Ongoing project !</h1>
Um aplicativo Flutter para gerenciar restaurantes, com integração em Firebase Firestore. Permite listar, criar e visualizar restaurantes, incluindo seus endereços e pratos do dia (DailyFood).

O app utiliza forms dinâmicos com base nas propriedades das classes Restaurant, Address e DailyFood.

<h1>📌 Funcionalidades</h1>
<ul>
 <li>Listar restaurantes em tempo real do Firestore.</li>

 <li>Criar um novo restaurante com:</li>
  <ul>
   <li>Nome, Nome completo, Número de contacto</li>

   <li>Endereço (Address) e GPS</li>

   <li>DailyFood (até 3 pratos)</li>

   <li>Imagem de logo e fundo</li>

   <li>Mensagens de restaurante fechado</li>
 </ul>
 <li>Formulário dinâmico, baseado nas propriedades da classe.</li>
 
 <li>Feedback visual com SnackBar em sucesso/erro ao gravar.</li>
 
 <li>Estrutura preparada para edição futura de restaurantes, endereço e pratos.</li>
</ul>
<h1>🏗 Estrutura do Projeto</h1>
<ul>
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


 <li>screens/ → contém todos os ecrãs da aplicação.</il>

 <li>models/ → contém as classes Restaurant, Address, DailyFood e customProperty.</il>
</ul>
<h1>⚡ Tecnologias Utilizadas</h1>
<ul>
 <li>Flutter 3.x / Dart</il>

 <li>Firebase Firestore para persistência de dados</il>

 <li>Formulários dinâmicos baseados em metadata das classes</il>
</ul>
<h1>🔧 Como Executar</h1>
<ol>
 <li>clone este repositório:</il>

git clone https://github.com/seu-usuario/flutter-restaurant-app.git
cd flutter-restaurant-app


 <li>Instale as dependências:</il>

flutter pub get


 <li>Configure o Firebase:</il>
   <ul>
     <li>Android → coloque google-services.json em android//app//</il>
     <li>iOS → coloque GoogleService-Info.plist em ios//Runner//</il>
   </ul>
 <li>Inicialize o Firebase em main.dart:</il>

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


<li>Execute o app:</il>

flutter run
</ol>
<h1>💡 Boas Práticas Implementadas</h1>
<ul>
 <li>Formulários dinâmicos com getCustomProperty()</il>

 <li>Criação de objetos com valores default (Address.empty(), DailyFood.empty())</il>

 <li>Leitura e gravação defensiva de dados do Firestore</il>

 <li>Feedback visual para sucesso ou erro na gravação</il>

 <li>StreamBuilder para sincronização em tempo real com Firestore</il>
</ul>

<h1>👨‍💻 Autor</h1>

Arnaldo

<dl>
  <dt>📍 Portugal</dt>
  <dt>💼 Project developed for learning and demonstrating development with Flutter + Firebase Firestore</dt>
</dl>
