import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:home_space/features/home/data/data_sources/home_local_data_source.dart';
import 'package:home_space/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:home_space/core/errors/failures.dart';
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
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      List<SaleListingsEntity> listings;
      listings = await homeRemoteDataSource.getSaleListings(
        pageNumber: pageNumber,
        queryParameters: queryParameters,
      );
      
      // Save successfully fetched data locally
      if (listings.isNotEmpty) {
        homeLocalDataSource.saveSaleListings(listings);
      }
      
      return right(listings);
    } catch (e) {
      // Fallback to local data if remote fails
      List<SaleListingsEntity> localListings = homeLocalDataSource.getSaleListings(pageNumber: pageNumber);
      if (localListings.isNotEmpty) {
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
