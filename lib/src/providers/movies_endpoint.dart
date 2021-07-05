class MoviesEndpoint {
  static String baseEndpoint = 'api.themoviedb.org';
  static String getNowPlaying = '3/movie/now_playing';
  static String getPopular = '3/movie/popular';
  static String getCredits(int movieId) => '3/movie/$movieId/credits';
  static String findMovie = '3/search/movie';
}
