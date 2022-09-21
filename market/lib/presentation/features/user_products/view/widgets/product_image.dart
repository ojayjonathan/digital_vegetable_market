part of '../user_product_page.dart';

class _ProductImage extends StatefulWidget {
  @override
  State<_ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<_ProductImage> {
  File? image;

  @override
  void initState() {
    image = context.read<UserProductsCubit>().state.image?.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              image: image != null
                  ? DecorationImage(
                      image: FileImage(image!),
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
                    setState(() {
                      image = file;
                    });
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
  }
}
