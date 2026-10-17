import 'package:dartz/dartz.dart';
import 'package:home_space/core/errors/failures.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';
import 'package:home_space/features/home/domain/repos/home_repo.dart';
import 'package:home_space/shared/use_cases/use_case.dart';

class GetSaleListingsParams {
  final int pageNumber;
  final String? propertyType;

  const GetSaleListingsParams({
    this.pageNumber = 0,
    this.propertyType,
  });
}

class GetSaleListingsUseCase
    extends UseCase<List<SaleListingsEntity>, GetSaleListingsParams> {
  final HomeRepo homeRepo;

  GetSaleListingsUseCase({required this.homeRepo});

  @override
  Future<Either<Failures, List<SaleListingsEntity>>> call([
    GetSaleListingsParams? param,
  ]) async {
    final params = param ?? const GetSaleListingsParams();
    return await homeRepo.getSaleListings(
      pageNumber: params.pageNumber,
      propertyType: params.propertyType,
    );
  }
}
