import 'package:dartz/dartz.dart';
import 'package:home_space/core/errors/failures.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';
import 'package:home_space/features/home/domain/repos/home_repo.dart';
import 'package:home_space/shared/use_cases/use_case.dart';

class GetSaleListingsUseCase extends UseCase<List<SaleListingsEntity>, int> {
  final HomeRepo homeRepo;

  GetSaleListingsUseCase({required this.homeRepo});
  @override
  Future<Either<Failures, List<SaleListingsEntity>>> call([
    int pageNumber = 0,
  ]) async {
    return await homeRepo.getSaleListings(pageNumber: pageNumber);
  }
}
