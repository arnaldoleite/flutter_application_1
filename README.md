<h1>🏨 Flutter Restaurant App</h1>
<h1> Ongoing project !</h1>
A Flutter app for managing restaurants, with Firebase Firestore integration. It allows you to list, create, and view restaurants, including their addresses and daily specials (DailyFood).

The app uses dynamic forms based on the properties of the Restaurant, Address, and DailyFood classes.

<h1>📌 Funcionalidades</h1>
<h1>📌 Features</h1>
<ul>
 <li>List restaurants in real time from Firestore.</li>
 
 <li>Create a new restaurant with:</li>
 
 <li>Name, Full Name, Contact Number</li>
 
 <li>Address and GPS</li>
 
 <li>Daily Food (up to 3 dishes)</li>
 
 <li>Logo and background image</li>
 
 <li>Location in Flutter, using ARB code generation and UI-level location mapping.</li>

 <li>Dynamic form, based on class properties.</li>
 
 <li>Visual feedback with SnackBar on success/error when saving.</li>
 
 <li>Structure prepared for future editing of restaurants, addresses, and dishes.</li>
</ul>

<h1>🏗 Project Structure</h1>
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


 
 <li>screens/ → contains all the application screens.</il>
 
 <li>models/ → contains the classes Restaurant, Address, DailyFood, and customProperty.</il>
</ul>
<h1>⚡ Technologies Used</h1>
<ul>
 <li>Flutter 3.x / Dart</il>
 
 <li>Firebase Firestore for data persistence</il>
 
 <li>Dynamic forms based on class metadata</il>
</ul>
<h1>🔧 How to Run</h1>
<ol>
 <li>Clone this repository:</il>
git clone https://github.com/seu-usuario/flutter-restaurant-app.git
cd flutter-restaurant-app


 <li>Install dependencies:</il>

flutter pub get


 <li>Configure Firebase:</il>
   <ul>
     <li>Android → put google-services.json in android//app//</il>
     <li>iOS → put GoogleService-Info.plist in ios//Runner//</il>
   </ul>
 <li>Start Firebase in main.dart:</il>

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


<li>Run the app:</il>

flutter run
</ol>
<h1>💡 Implemented Best Practices</h1>
<ul>
<li>Dynamic forms with getCustomProperty()</il>

<li>Creating objects with default values ​​(Address.empty(), DailyFood.empty())</il>

<li>Defensive reading and writing of Firestore data</il>

<li>Visual feedback for success or error in writing</il>

<li>StreamBuilder for real-time synchronization with Firestore</il>
</ul>

<h1>👨‍💻 Author</h1>

Arnaldo

<dl>
  <dt>📍 Portugal</dt>
  <dt>💼 Project developed for learning and demonstrating development with Flutter + Firebase Firestore</dt>
</dl>

<h1>✨ Example images</h1>

<img width="1878" height="1017" alt="vscode_ex1" src="https://github.com/user-attachments/assets/0650fd65-de66-40cf-b5b7-7325a1808039" />

<img width="1912" height="1022" alt="vscode_ex2" src="https://github.com/user-attachments/assets/1717c10d-7666-4671-b73f-e7810a8528ce" />

<img width="1912" height="1016" alt="vscode_ex3" src="https://github.com/user-attachments/assets/4946e08d-0c83-4d70-b606-85962e140cfe" />

<img width="1826" height="836" alt="FireBase_ex1" src="https://github.com/user-attachments/assets/44caa850-87ba-4648-a6d4-f0db53b9a28d" />


