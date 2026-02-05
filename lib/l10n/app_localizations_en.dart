// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get appTitle => 'DailyFood';

  @override
  String get restaurantsTitle => 'Restaurant';

  @override
  String get restaurantCreatorId => 'Restaurant creator ID';

  @override
  String get restaurantPostedAt => 'Restaurant posted at';

  @override
  String get restaurantTitle => 'Restaurant';

  @override
  String get restaurantName => 'Name';

  @override
  String get restaurantFullName => 'Full name';

  @override
  String get restaurantAddress => 'Address';

  @override
  String get restaurantCellNumber => 'Cellphone number';

  @override
  String get restaurantGpsPoint => 'GPS coordinate';

  @override
  String get restaurantBackgroundImageURL => 'Background image URL';

  @override
  String get restaurantLogoImageURL => 'Logo image URL';

  @override
  String get restaurantMakeReservation => 'Make reservations';

  @override
  String get restaurantClosed => 'Closed';

  @override
  String get restaurantClosedMessage => 'Closing message';

  @override
  String get restaurantDailyFood => 'Daily dish';

  @override
  String get restaurantDailyFood1name => 'First dish name';

  @override
  String get restaurantDailyFood1image => 'First dish image';

  @override
  String get restaurantDailyFood1price => 'First dish price';

  @override
  String get restaurantDailyFood1active => 'First dish availability';

  @override
  String get restaurantDailyFood2name => 'Name of the second dish';

  @override
  String get restaurantDailyFood2image => 'Image of the second dish';

  @override
  String get restaurantDailyFood2price => 'Price of the second dish';

  @override
  String get restaurantDailyFood2active => 'Availability of the second dish';

  @override
  String get restaurantDailyFood3name => 'Name of the third dish';

  @override
  String get restaurantDailyFood3image => 'Image of the third dish';

  @override
  String get restaurantDailyFood3price => 'Price of the third dish';

  @override
  String get restaurantDailyFood3active => 'Availability of the third dish';

  @override
  String get restaurantLoadError =>
      'Error when loading restaurantsfinal local = AppLocalizations.of(context)!;';

  @override
  String get restaurantEmptyError => 'No restaurants found';

  @override
  String get restaurantCreateError => 'Error creating restaurant';

  @override
  String get restaurantCreateSuccess => 'Restaurant created successfully';

  @override
  String get restaurantCreateTitle => 'Create Restaurant';

  @override
  String get allEnterValue => 'Enter the Value';

  @override
  String get allValueCantEmpty => 'Value Can\'t Be Empty';

  @override
  String get allBack => 'Back';

  @override
  String get allNext => 'Next';

  @override
  String get allSubmit => 'Submit';

  @override
  String get fieldRequired => 'Field required';
}
