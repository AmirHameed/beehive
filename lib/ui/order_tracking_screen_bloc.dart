import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTrackingScreenBloc extends Cubit<bool>{
  OrderTrackingScreenBloc():super(false);

  void updateTracking()=>emit(true);

}