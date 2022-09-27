import 'package:flutter/material.dart';
import 'package:market/data/models/http/http.dart';
import 'package:market/data/models/user/user.dart';
import 'package:market/data/services/rest/client.dart';
import 'package:market/data/services/service.dart';
import 'package:market/presentation/widgets/button.dart';
import 'package:market/resources/info.dart';
import 'package:market/resources/theme.dart';

class WalletPage extends StatelessWidget {
  WalletPage({Key? key}) : super(key: key);
  final controler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Wallet"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<HttpResult<Wallet>>(
          future: service<UserAccount>().wallet(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Center(child:  CircularProgressIndicator());
            if (snapshot.data is ErrorResponse) {
              return Text((snapshot.data as ErrorResponse).error.message);
            }
            return SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Balance",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColorLight,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                              text:
                                  "\t\t ${(snapshot.data as SuccessResponse<Wallet>).data.balance}",
                              style: const TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: AppTheme.inputDecoration.copyWith(
                                label: const Text("Amount"),
                                prefixIcon: const Icon(Icons.phone),
                              ),
                              keyboardType: TextInputType.number,
                              controller: controler,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: AppButton(
                            handlePress: () async {
                              final amount = double.tryParse(controler.text);
                              if (amount != null) {
                                context.snackBar(
                                  const InfoMessage(
                                      message: "Please wait...",
                                      type: MessageType.success),
                                );
                                final res = await service<UserAccount>()
                                    .walletWidthdraw(amount);
                                res.when(
                                  onError: (error) => context.snackBar(
                                    InfoMessage.fromError(error),
                                  ),
                                  onSuccess: (data) {
                                    context.snackBar(
                                      InfoMessage(
                                        message: data.message,
                                        type: MessageType.success,
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                            text: "Widthdraw",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
