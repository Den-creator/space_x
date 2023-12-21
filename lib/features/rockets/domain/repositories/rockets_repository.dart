import 'package:either_dart/either.dart';
import 'package:space_x/features/rockets/data/datasources/rockets_data_source.dart';
import 'package:space_x/features/rockets/data/models/rocket.dart';
import 'package:space_x/services/network/common/failure.dart';

abstract class IRocketsRepository {
  Future<Either<Failure, List<Rocket>>> loadRockets();
  Future<Either<Failure, Rocket>> loadRocket(String id);
}

class RocketsRepository implements IRocketsRepository {
  RocketsRepository(this.dataSource);
  final IRocketsDataSource dataSource;

  @override
  Future<Either<Failure, List<Rocket>>> loadRockets() async {
    try {
      final result = await dataSource.loadRockets();
      return Right(result);
    } catch (e, trace) {
      return Left(Failure.from(e, trace));
    }
  }

  @override
  Future<Either<Failure, Rocket>> loadRocket(String id) async {
    try {
      final result = await dataSource.loadRocket(id);
      return Right(result);
    } catch (e, trace) {
      return Left(Failure.from(e, trace));
    }
  }
}
