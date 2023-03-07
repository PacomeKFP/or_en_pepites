import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tabs_manager_event.dart';
part 'tabs_manager_state.dart';

class TabsManagerBloc extends Bloc<TabsManagerEvent, TabsManagerState> {
  TabsManagerBloc() : super(TabsManagerInitial(curentPage: 0)) {
    on<MoveToPage>((event, emit) {
      emit(TabsManagerInitial(curentPage: event.nextPage));
    });
  }
}
