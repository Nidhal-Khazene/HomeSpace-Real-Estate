import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:home_space/core/errors/failures.dart';
import 'package:home_space/features/home/data/data_sources/home_local_data_source.dart';
import 'package:home_space/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';
import 'package:home_space/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({
    required this.homeLocalDataSource,
    required this.homeRemoteDataSource,
  });

  @override
  Future<Either<Failures, List<SaleListingsEntity>>> getSaleListings({
    int pageNumber = 0,
    String? propertyType,
  }) async {
    try {
      final listings = await homeRemoteDataSource.getSaleListings(
        pageNumber: pageNumber,
        propertyType: propertyType,
      );

      if (listings.isNotEmpty) {
        final isFirstPageOfAll =
            pageNumber == 0 &&
            (propertyType == null || propertyType.toLowerCase() == 'all');
        await homeLocalDataSource.saveSaleListings(
          listings,
          clearFirst: isFirstPageOfAll,
        );
      }

      return right(listings);
    } catch (e) {
      final localListings =
          homeLocalDataSource.getSaleListings(pageNumber: pageNumber);
      if (localListings.isNotEmpty) {
        if (propertyType != null && propertyType.toLowerCase() != 'all') {
          final filtered = localListings
              .where(
                (item) =>
                    item.propertyType.toLowerCase() ==
                    propertyType.toLowerCase(),
              )
              .toList();
          return right(filtered);
        }
        return right(localListings);
      }

      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
