part of "bloc.dart";

class UserProductsState<T extends FormzInput<File?, String>> extends Equatable {
  final RequiredInput<String>? description;
  final RequiredInput<DateTime>? availableDate;
  final RequiredInput<double>? price;
  final RequiredInput<Address>? address;
  final RequiredInput<String>? name;
  final RequiredInput<String>? category;

  final RequiredInput<double>? availableQuantity;
  final TextInput? measurementUnit;
  final T? image;
  final InfoMessage? message;
  final ServiceStatus status;
  final List<Product> products;
  final int? selectedProductId;
  final List<String> varieties;
  const UserProductsState(
      {this.category = const RequiredInput.pure(value: "VEGETABLES"),
      this.message,
      this.products = const [],
      this.status = ServiceStatus.initial,
      this.image,
      this.measurementUnit,
      this.description,
      this.availableDate,
      this.price,
      this.name,
      this.address,
      this.availableQuantity,
      this.selectedProductId,
      this.varieties = const []});

  UserProductsState copyWith({
    RequiredInput<String>? description,
    RequiredInput<DateTime>? availableDate,
    RequiredInput<double>? price,
    RequiredInput<String>? name,
    RequiredInput<double>? availableQuantity,
    TextInput? measurementUnit,
    InfoMessage? message,
    T? image,
    RequiredInput<Address>? address,
    RequiredInput<String>? category,
    ServiceStatus? status,
    int? selectedProductId,
    List<String>? varieties,
  }) {
    return UserProductsState(
      status: status ?? this.status,
      message: message,
      availableDate: availableDate ?? this.availableDate,
      availableQuantity: availableQuantity ?? this.availableQuantity,
      description: description ?? this.description,
      measurementUnit: measurementUnit ?? this.measurementUnit,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      selectedProductId: selectedProductId ?? this.selectedProductId,
      address: address ?? this.address,
      category: category ?? this.category,
      varieties: varieties ?? this.varieties,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        availableDate,
        availableQuantity,
        description,
        name,
        measurementUnit,
        price,
        image,
        address,
        category,
        varieties,
      ];
  bool get validate {
    for (var f in <FormzInput?>[
      availableDate,
      availableQuantity,
      description,
      name,
      measurementUnit,
      price,
      image,
      category,
    ]) {
      if (f?.error != null) {
        return false;
      }
    }
    return true;
  }
}

class UserProductsListState extends UserProductsState {
  const UserProductsListState({
    List<Product> products = const [],
    InfoMessage? message,
    ServiceStatus status = ServiceStatus.initial,
  }) : super(
          products: products,
        );

  @override
  List<Object?> get props => [products, message, status];
}

class UserProductsCreate extends UserProductsState<RequiredInput<File>> {
  const UserProductsCreate({
    RequiredInput<String> description = const RequiredInput.pure(),
    RequiredInput<DateTime> availableDate = const RequiredInput.pure(),
    RequiredInput<double> price = const RequiredInput.pure(),
    RequiredInput<String> name = const RequiredInput.pure(),
    RequiredInput<double> availableQuantity = const RequiredInput.pure(),
    TextInput measurementUnit = const TextInput.pure(),
    RequiredInput<File> image = const RequiredInput.pure(),
    InfoMessage? message,
    ServiceStatus status = ServiceStatus.initial,
    required List<String> varieties,
    RequiredInput<Address> address = const RequiredInput.pure(),
  }) : super(
          image: const RequiredInput.pure(),
          message: message,
          status: status,
          availableDate: availableDate,
          availableQuantity: availableQuantity,
          description: description,
          measurementUnit: measurementUnit,
          name: name,
          price: price,
          varieties: varieties,
          address: address,
        );
}

class UserProductsUpdateState extends UserProductsState<OptionalInput<File>> {
  const UserProductsUpdateState({
    required RequiredInput<String> description,
    required RequiredInput<DateTime> availableDate,
    required RequiredInput<double> price,
    required RequiredInput<String> name,
    required RequiredInput<String> category,
    required RequiredInput<double> availableQuantity,
    required TextInput measurementUnit,
    RequiredInput<Address> address = const RequiredInput.pure(),
    OptionalInput<File> image = const OptionalInput.pure(),
    InfoMessage? message,
    required int selectedProductId,
    List<String> varieties = const [],
    status = ServiceStatus.initial,
  }) : super(
          message: message,
          status: status,
          image: image,
          availableDate: availableDate,
          availableQuantity: availableQuantity,
          description: description,
          measurementUnit: measurementUnit,
          name: name,
          address: address,
          price: price,
          selectedProductId: selectedProductId,
          category: category,
          varieties: varieties,
        );
}
