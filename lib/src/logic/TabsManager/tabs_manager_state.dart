part of 'tabs_manager_bloc.dart';

@immutable
abstract class TabsManagerState {}

class TabsManagerInitial extends TabsManagerState {
  int curentPage;

  TabsManagerInitial({required this.curentPage});
}
