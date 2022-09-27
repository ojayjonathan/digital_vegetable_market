import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/presentation/features/account/bloc/bloc.dart';

class ProfileImage extends StatelessWidget {
  // ignore: unusedelement
  const ProfileImage({Key? key, this.showUploadIcon = false}) : super(key: key);
  final bool showUploadIcon;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) => Padding(
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
                image: state.user?.image == null
                    ? const DecorationImage(
                        image: ExactAssetImage('assets/profile.png'),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: NetworkImage(state.user!.image!),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            if (showUploadIcon)
              Padding(
                padding: const EdgeInsets.only(top: 50.0, right: 80.0),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColorDark,
                  radius: 20.0,
                  child: IconButton(
                    onPressed: () =>
                        context.read<AccountBloc>().uploadProfileImage(),
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.desc,
  }) : super(key: key);
  final String imagePath;
  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(color: const Color(0xffF1F1F5))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 40,
            height: 40,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                desc,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
