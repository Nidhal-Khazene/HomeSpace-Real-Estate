import 'package:dartz/dartz.dart';
import 'package:home_space/core/errors/failures.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<SaleListingsEntity>>> getSaleListings({
    int pageNumber = 0,
  });
}
