import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../services/shared_preference.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavInitial()) {
    on<ReloadOrderListEvent>((event, emit) {
      emit(BottomNavInitial());
      emit(ReloadOrdersState());
    });
    on<UpdateBottomNavEvent>((event, emit) {
      emit(BottomNavInitial());
      emit(UpdateBottomNavState());
    });

    on<NavigationNotificationNavEvent>((event, emit) {
      emit(BottomNavInitial());
      emit(NavigateNotificationState(orderID: event.orderID, type: event.type));
    });

    on<RebuildAppEvent>((event, emit) {
      emit(BottomNavInitial());
      EasyLoading.showSuccess('Авторизация прошла успешно!',
          duration: const Duration(seconds: 3));
      emit(RebildAppState());
    });

    on<LogoutAppEvent>((event, emit) {
      emit(BottomNavInitial());
      // sharedPreference.clear();
      EasyLoading.showSuccess('Logout прошла успешно!',
          duration: const Duration(seconds: 3));
      emit(RebildAppState());
    });

    on<ChangePageEvent>((event, emit) {
      emit(BottomNavInitial());

      emit(ChangedPageState(page: event.pageIndex));
    });
  }
}

abstract class BottomNavEvent {}

class ReloadOrderListEvent extends BottomNavEvent {}

class UpdateBottomNavEvent extends BottomNavEvent {
  UpdateBottomNavEvent();
}

class ChangePageEvent extends BottomNavEvent {
  final int pageIndex;
  ChangePageEvent({required this.pageIndex});
}

class NavigationNotificationNavEvent extends BottomNavEvent {
  final String orderID;
  final String type;
  NavigationNotificationNavEvent({required this.orderID, required this.type});
}

class RebuildAppEvent extends BottomNavEvent {
  RebuildAppEvent();
}

class LogoutAppEvent extends BottomNavEvent {
  LogoutAppEvent();
}

abstract class BottomNavState {}

class ReloadOrdersState extends BottomNavState {}

class BottomNavInitial extends BottomNavState {}

class RebildAppState extends BottomNavState {}

class ChangedPageState extends BottomNavState {
  final int page;

  ChangedPageState({required this.page});
}

class UpdateBottomNavState extends BottomNavState {
  final int page = 1;
  UpdateBottomNavState();
}

class NavigateNotificationState extends BottomNavState {
  final String orderID;
  final String type;
  NavigateNotificationState({required this.orderID, required this.type});
}
