part of 'app_cubit.dart';

@immutable
abstract class AppStates {}

class AppInitial extends AppStates {}

class ChangeBottomNavBar extends AppStates {}

class CreateDataBaseSuccessState extends AppStates {}

class CreateDataBaseErrorState extends AppStates {}

class OpenDataBaseSuccessState extends AppStates {}

// insert into database

class InsertIntoDataBaseSuccessState extends AppStates {}

class InsertIntoDataBaseErrorState extends AppStates {}

// get from database

class GetDataFromDatabaseLoadingState extends AppStates {}

class GetDataFromDatabaseSuccessState extends AppStates {}

class GetDataFromDatabaseErrorState extends AppStates {}

// update from database

class UpdateDataSuccessState extends AppStates {}

class UpdateDataErrorState extends AppStates {}

class DeleteDataSuccessState extends AppStates {}

class DeleteDataErrorState extends AppStates {}
