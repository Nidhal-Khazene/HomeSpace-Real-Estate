import 'package:dartz/dartz.dart';
import 'package:home_space/core/errors/failures.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';
import 'package:home_space/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failures, List<SaleListingsEntity>>> getSaleListings() {
    // TODO: implement getSaleListings
    throw UnimplementedError();
  }
}
