import 'package:market/presentation/features/account/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileImage extends StatelessWidget {
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
