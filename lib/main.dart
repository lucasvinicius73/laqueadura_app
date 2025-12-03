import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:laqueadura_app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null);
  runApp(const MyApp());
}


