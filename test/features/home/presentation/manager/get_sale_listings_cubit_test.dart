import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_space/core/errors/failures.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';
import 'package:home_space/features/home/domain/repos/home_repo.dart';
import 'package:home_space/features/home/domain/use_cases/get_sale_listings_use_case.dart';
import 'package:home_space/features/home/presentation/manager/get_sale_listings_cubit/get_sale_listings_cubit.dart';

class FakeHomeRepo implements HomeRepo {
  int callCount = 0;
  String? lastPropertyType;
  int? lastPageNumber;
  List<SaleListingsEntity> resultToReturn = [];

  @override
  Future<Either<Failures, List<SaleListingsEntity>>> getSaleListings({
    int pageNumber = 0,
    String? propertyType,
  }) async {
    callCount++;
    lastPageNumber = pageNumber;
    lastPropertyType = propertyType;
    return Right(resultToReturn);
  }
}

void main() {
  late FakeHomeRepo fakeRepo;
  late GetSaleListingsUseCase useCase;
  late GetSaleListingsCubit cubit;

  final sampleListing = SaleListingsEntity(
    price: 350000,
    formattedAddress: '123 Test St, Austin, TX',
    agentName: 'Agent Smith',
    propertyType: 'Condo',
    bedrooms: 2,
    bathrooms: 2.0,
    squareFootage: 1200,
    lotSize: 0,
    city: 'Austin',
  );

  setUp(() {
    fakeRepo = FakeHomeRepo();
    useCase = GetSaleListingsUseCase(homeRepo: fakeRepo);
    cubit = GetSaleListingsCubit(getSaleListingsUseCase: useCase);
  });

  tearDown(() {
    cubit.close();
  });

  test('initial state should be GetSaleListingsInitial', () {
    expect(cubit.state, equals(GetSaleListingsInitial()));
  });

  test('getSaleListings triggers exactly ONE call on first fetch and emits Success', () async {
    fakeRepo.resultToReturn = [sampleListing];

    final expectedStates = [
      GetSaleListingsLoading(),
      GetSaleListingsSuccess(
        listings: [sampleListing],
        hasMore: true,
        isPaginationLoading: false,
        selectedCategory: 'All',
      ),
    ];

    expectLater(cubit.stream, emitsInOrder(expectedStates));

    await cubit.getSaleListings();

    expect(fakeRepo.callCount, equals(1));
    expect(fakeRepo.lastPageNumber, equals(0));
    expect(fakeRepo.lastPropertyType, equals('All'));
  });

  test('filterByCategory makes exactly ONE API call with target propertyType', () async {
    fakeRepo.resultToReturn = [sampleListing];

    await cubit.filterByCategory('Condo');

    expect(fakeRepo.callCount, equals(1));
    expect(fakeRepo.lastPageNumber, equals(0));
    expect(fakeRepo.lastPropertyType, equals('Condo'));
    expect(cubit.state is GetSaleListingsSuccess, isTrue);

    final successState = cubit.state as GetSaleListingsSuccess;
    expect(successState.selectedCategory, equals('Condo'));
    expect(successState.listings.length, equals(1));
  });

  test('repeated call while loading does not cause duplicate API invocation', () async {
    fakeRepo.resultToReturn = [sampleListing];

    // Trigger two calls concurrently
    final future1 = cubit.getSaleListings();
    final future2 = cubit.getSaleListings();

    await Future.wait([future1, future2]);

    // Should only be called once because isLoading guard is active
    expect(fakeRepo.callCount, equals(1));
  });
}
