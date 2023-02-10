import 'package:movie_dp_assignment/data/vos/movie_vo/movie_vo.dart';
import '../../network/data_agent/movie_data_agent/movie_data_agent.dart';
import '../../network/data_agent/movie_data_agent/movie_data_agent_impl.dart';
import 'movie_db_apply.dart';

class MovieDBApplyImpl extends MovieDBApply {

  final MovieDataAgent _movieDataAgent = MovieDataAgentImpl();

  MovieDBApplyImpl._();

  static final MovieDBApplyImpl _singleton = MovieDBApplyImpl._();

  factory MovieDBApplyImpl() => _singleton;

  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page)  =>
      _movieDataAgent.getNowPlayingMovies(page).then((value) {
        final temp = value?.map((e) {
          e.isGetNowPlaying = true;
          return e;
        }).toList();
        return temp;
      });
  }



