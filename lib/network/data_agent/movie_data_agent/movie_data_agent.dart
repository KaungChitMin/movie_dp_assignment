import 'package:movie_dp_assignment/data/vos/movie_vo/movie_vo.dart';

abstract class MovieDataAgent {
  Future<List<MovieVO>?> getNowPlayingMovies(int page);
}
