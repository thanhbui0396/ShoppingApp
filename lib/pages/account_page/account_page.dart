import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:provider/provider.dart';
import 'package:shopping_app/providers/info_providers.dart';
import 'package:transparent_image/transparent_image.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(id)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(
                          'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o='),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircleAvatar(
                        radius: 70, child: CircularProgressIndicator());
                  }
                  var data = snapshot.data as DocumentSnapshot;
                  return SizedBox(
                    height: 200,
                    width: 200,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: CachedNetworkImage(
                            imageUrl: data['avata'] != ''
                                ? data['avata']
                                : 'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o=',
                            placeholder: (context, url) => Center(
                              child: LoadingAnimationWidget.dotsTriangle(
                                color: Colors.white,
                                size: 200,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            alignment: Alignment.center,
                            child: StreamBuilder(
                              stream:
                                  context.read<InfoProviders>().loadingStream,
                              initialData: 0.0,
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (!snapshot.hasData) {
                                  return Container();
                                }
                                double value = snapshot.data as double;
                                if (value == 0.0 || value == 1) {
                                  return Container();
                                }
                                return Container(
                                  child: LinearProgressIndicator(value: value),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<InfoProviders>().getImage();
                  },
                  child: const Text('Change'))
            ]),
      ),
    );
  }
}
