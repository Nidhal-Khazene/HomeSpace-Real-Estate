import 'package:bloc/bloc.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';
import 'package:meta/meta.dart';

part 'get_sale_listings_state.dart';

class GetSaleListingsCubit extends Cubit<GetSaleListingsState> {
  GetSaleListingsCubit() : super(GetSaleListingsInitial());
}
