import 'package:dio/dio.dart';
import '../../../constant/api_constant.dart';
import '../../../data/vos/movie_vo/movie_vo.dart';
import '../../api/movie_api/movie_api.dart';
import 'movie_data_agent.dart';

class MovieDataAgentImpl extends MovieDataAgent {
  late MovieAPI _movieAPI;

  MovieDataAgentImpl._() {
    _movieAPI = MovieAPI(Dio());
  }

  static final MovieDataAgentImpl _singleton = MovieDataAgentImpl._();

  factory MovieDataAgentImpl() => _singleton;

  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) => _movieAPI
      .getNowPlayingMovies(kApiKey, page)
      .asStream()
      .map((event) => event.results)
      .first;
}
