import 'package:flutter/material.dart';
import 'package:market/data/services/rest/client.dart';
import 'package:market/presentation/widgets/button.dart';
import 'package:market/resources/info.dart';
import 'package:market/resources/theme.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  Future<void> _call(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                child: Hero(tag: "page_paint", child: Container())),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text("Contact Us",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                InkWell(
                  onTap: () => _call("tel:0716539104"),
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    elevation: 2,
                    shadowColor: Colors.grey[250],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              Icons.phone,
                              size: 20,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                          const SelectableText("0716539104")
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  elevation: 2,
                  shadowColor: Colors.grey[250],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.email,
                              size: 20,
                              color: Theme.of(context).primaryColorDark),
                        ),
                        InkWell(
                            onTap: () => _call("mailto:courier.ke.com"),
                            child: const Text("contact@gmail..com"))
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _call("https://0a7b-154-159-237-17.eu.ngrok.io/user-manual"),
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    elevation: 2,
                    shadowColor: Colors.grey[250],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              Icons.link,
                              size: 20,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                          const Text("Online User Manual")
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: AppTheme.inputDecoration.copyWith(
                      label: const Text("Write something...."),
                    ),
                    minLines: 5,
                    maxLines: 10,
                  ),
                ),
                const SizedBox(height: 10),
                AppButton(
                    handlePress: () {
                      context.snackBar(const InfoMessage(message: "Sending feedback...", type: MessageType.success));
                    },
                    text: "Submit")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
