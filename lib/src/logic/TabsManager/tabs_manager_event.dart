part of 'tabs_manager_bloc.dart';

@immutable
abstract class TabsManagerEvent {}

class MoveToPage extends TabsManagerEvent {
  final int nextPage;

  MoveToPage({required this.nextPage});
}
