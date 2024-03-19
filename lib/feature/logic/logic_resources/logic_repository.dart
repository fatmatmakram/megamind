// ignore_for_file: file_names

part of 'logic_repo_imports.dart';

class LogicRepository {
   late LogicHttpMethods _logicHttpMethods;

  LogicRepository( ) {
     _logicHttpMethods = LogicHttpMethods( );
  }

  Future<List<MovieModel>> getMovie() => _logicHttpMethods.getMovies();



}
