part of '../user_product_page.dart';

class _ProductUpdateForm extends StatelessWidget {
  const _ProductUpdateForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProductsCubit, UserProductsState>(
      buildWhen: (previous, current) => current.status != previous.status,
      builder: (context, state) {
        return Column(
          children: [
            _ProductImage(),
            TextFormField(
              initialValue: state.name?.value,
              onChanged: (value) =>
                  context.read<UserProductsCubit>().nameChanged(value),
              decoration: InputDecoration(
                errorText: state.status != ServiceStatus.submissionFailure
                    ? null
                    : state.name?.error,
                label: const Text("Label"),
              ),
            ),
            TextFormField(
              initialValue: state.description?.value,
              onChanged: (value) =>
                  context.read<UserProductsCubit>().descriptionChanged(value),
              decoration: InputDecoration(
                  errorText: state.status != ServiceStatus.submissionFailure
                      ? null
                      : state.description?.error,
                  label: const Text("Description")),
            ),
            TextFormField(
              initialValue: state.price?.value?.toString(),
              onChanged: (value) => context
                  .read<UserProductsCubit>()
                  .priceChanged(double.tryParse(value)),
              decoration: InputDecoration(
                errorText: state.status != ServiceStatus.submissionFailure
                    ? null
                    : state.price?.error,
                label: const Text("Price"),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextFormField(
              initialValue: state.availableQuantity?.value?.toString(),
              onChanged: (value) => context
                  .read<UserProductsCubit>()
                  .quantityChanged(double.tryParse(value)),
              decoration: InputDecoration(
                errorText: state.status != ServiceStatus.submissionFailure
                    ? null
                    : state.availableQuantity?.error,
                label: const Text("Available Quantity"),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextFormField(
              initialValue: state.measurementUnit?.value,
              onChanged: (value) => context
                  .read<UserProductsCubit>()
                  .measurementUnitChanged(value),
              decoration: InputDecoration(
                errorText: state.status != ServiceStatus.submissionFailure
                    ? null
                    : state.measurementUnit?.error,
                label: const Text("Measurement Unit"),
              ),
            ),
            const SizedBox(height: 10),
            const ProductCategory(),
            const SizedBox(height: 10),
            const ProductExpectedAvailableDate(),
            const ProductAddress(),
            ProductVarietiesCreate(),
            Row(
              children: [
                const Expanded(child: _SubmitButton()),
                const SizedBox(width: 20),
                Expanded(
                  child: AppButtonOutlined(
                    text: "CANCEL",
                    handlePress: () =>
                        context.read<UserProductsCubit>().productListStarted(),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
      child: BlocBuilder<UserProductsCubit, UserProductsState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          if (state.status == ServiceStatus.submissionInProgress) {
            return const ButtonLoading(text: "Submiting...");
          }
          return SubmitButton(
            handlePress: () => context.read<UserProductsCubit>().submit(),
            text: "Submit",
          );
        },
      ),
    );
  }
}
