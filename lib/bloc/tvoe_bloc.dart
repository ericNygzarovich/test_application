import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tvoe_event.dart';
part 'tvoe_state.dart';

class TvoeBloc extends Bloc<TvoeEvent, TvoeState> {
  TvoeBloc() : super(TvoeInitial()) {
    on<TvoeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
