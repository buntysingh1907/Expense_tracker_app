
import 'package:expense_tracker/database_service.dart';
import 'package:expense_tracker/expense_maintain_bloc.dart';
import 'package:expense_tracker/widgets/bottom_modal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var kcolorscheme=ColorScheme.fromSeed(
    seedColor:const Color.fromARGB(250, 355,155,255));
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    runApp(MaterialApp(
        theme: ThemeData()
            .copyWith( //here copywith means you can overide default themedata method in your own
          useMaterial3: true,
          colorScheme: kcolorscheme,
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kcolorscheme.onPrimaryContainer,
              foregroundColor: kcolorscheme.primaryContainer
          ),
          cardTheme: CardTheme().copyWith(
            color: kcolorscheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
          ),
        ),
        home: BlocProvider(
          create: (_) => ExpenseBloc(ExpenseRepository()),
          child:BottomModals(),
        )
    ));
  });
}