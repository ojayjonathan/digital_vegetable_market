part of '../user_product_page.dart';

class _ProductImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProductsCubit, UserProductsState>(
        buildWhen: (previous, current) =>
            previous.image?.value != current.image?.value,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                    image: state.image?.value != null
                        ? DecorationImage(
                            image: FileImage(state.image!.value!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, right: 80.0),
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColorDark,
                    radius: 20.0,
                    child: IconButton(
                      onPressed: () async {
                        final file = await uploadImage();
                        if (file != null) {
                          // ignore: use_build_context_synchronously
                          context.read<UserProductsCubit>().imageChanged(file);
                        }
                      },
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
