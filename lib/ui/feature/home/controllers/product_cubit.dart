import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  static ProductCubit get(context) => BlocProvider.of(context);
  List<String> options = [
    'Best Selling',
    'Nike',
    'Yeezy',
    'Converse',
    'Jordan',
    'Puma',
    'Vans',
    'Crocs',
    'Adidas',
    'Supreme',
  ];
}
