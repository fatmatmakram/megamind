enum NamedRoutes {
  splash('/'),
  movie('/movie'),
  movieDetails('/movieDetails');

  final String routeName;

  const NamedRoutes(this.routeName);
}
