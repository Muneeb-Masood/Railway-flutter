import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_railway_app/blocs/login_bloc/login_bloc.dart';
import 'package:flutter_railway_app/screens/flight/flight_screen.dart';
import 'package:flutter_railway_app/screens/home/home_screen.dart';
import 'package:flutter_railway_app/screens/login/login_screen.dart';
import 'package:flutter_railway_app/screens/passenger/passenger_selection_screen.dart';
import 'package:flutter_railway_app/screens/payment/bill_screen.dart';
import 'package:flutter_railway_app/screens/payment/payment_overview_screen.dart';
import 'package:flutter_railway_app/screens/payment/payment_scren.dart';
import 'package:flutter_railway_app/screens/register/register_screen.dart';
import 'package:flutter_railway_app/screens/splash_screen.dart';
import 'package:flutter_railway_app/screens/walk_through_screen/walk_through_screen.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51RPzSAKiG6LOGW6m5JgijGNVgit8NfhvqP492feYC8OGdtyNjgPgZ0j0MeWHHhvwDw95S3078rPpuOsYdbjQSHB600sphiype5';
  runApp(
    
    BlocProvider(
      create: (_) => LoginBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        routes: {
          '/splash' : (context) => SplashScreen(),
          '/register': (context) => RegisterScreen(),
          '/login': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
          '/walkthrough': (context) => WalkThroughScreen(),
          '/flighResult': (context) => FlightResultsScreen(),
          '/payment': (context) => PaymentScreen(),
          '/passengerSelection': (context) => PassengerSelectionScreen(),
          '/overview': (context) => OverviewScreen(),
          '/bill' : (context) => BillScreen(adults: 0, infants: 0, adultFare: 2000, infantFare: 1000, tax: 100, service: 10000, total: 111111)
        },

        initialRoute: '/splash',
      ),
    ),
  );
}
