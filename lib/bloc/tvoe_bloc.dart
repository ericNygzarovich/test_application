import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_repository/test_repository.dart';

part 'tvoe_event.dart';
part 'tvoe_state.dart';

class TvoeBloc extends Bloc<TvoeEvent, TvoeState> {
  TestRepository repository = TestRepository();

  TvoeBloc() : super(TvoeState()) {
    on<TvoeEvent>(_getData);
  }

  void _getData(TvoeEvent event, Emitter<TvoeState> emitter) async {
    List<CarouselMovieModel> newCarouselList = await repository.getCarouselData();
    List<CoverMainMovieModel> newCoverList = await repository.getCoverData();
    bool? isLoaded;

    if (newCoverList.isNotEmpty && newCarouselList.isNotEmpty) isLoaded = true;

    emitter(state.copyWith(newCoverList, newCarouselList, isLoaded));
  }
}
