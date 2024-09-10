// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:tcddbiletfinding/domain/repository/tcdd_repo.dart' as _i297;
import 'package:tcddbiletfinding/post/block/seats_block/post_bloc.dart'
    as _i544;
import 'package:tcddbiletfinding/post/block/station_block/post_bloc.dart'
    as _i419;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i297.IPostRepository>(() => _i297.PostRepository());
    gh.factory<_i419.StationBloc>(
        () => _i419.StationBloc(postRepository: gh<_i297.IPostRepository>()));
    gh.factory<_i544.SeatsBloc>(
        () => _i544.SeatsBloc(postRepository: gh<_i297.IPostRepository>()));
    return this;
  }
}
