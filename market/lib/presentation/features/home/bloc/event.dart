part of 'bloc.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductStated extends ProductEvent {}

class ProductSearched extends ProductEvent {
  final String q;
  ProductSearched(this.q);
  @override
  List<Object?> get props => [q];
}
