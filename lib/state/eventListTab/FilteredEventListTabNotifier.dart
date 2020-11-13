import 'package:playport_test/data/Event.dart';
import 'package:playport_test/state/eventListTab/FilteredEventListTabState.dart';
import 'package:state_notifier/state_notifier.dart';

import 'EventListTabState.dart';

class FilteredEventListTabNotifier extends StateNotifier<FilteredEventListTabState> with LocatorMixin {
  FilteredEventListTabNotifier() : super(const FilteredEventListTabState());

  @override
  void update(Locator watch) {
    super.update(watch);

    // EventListTabStateを監視、stateがEventListTabStateDataなら更新されたtodosが渡されてくる、そのほかのstateは無視する
    watch<EventListTabState>().maybeWhen((events, controller) {
      state = state.copyWith(
        completed: state.completed,
        events: events,
      );
    }, orElse: () => null);
  }
}