import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_user_class3/Domain/UserProvider/user_provider.dart';
import 'package:get_user_class3/Presentation/Screens/HomeScreen/components/reusable_row.dart';
import 'package:provider/provider.dart';

class UserHomeView extends StatefulWidget {
  const UserHomeView({super.key});

  @override
  State<UserHomeView> createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('User Get Api Complex'),
      ),
      body: FutureBuilder(
        future: userProvider.getUserApi(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: userProvider.userList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ReusableRow(
                            name: 'ID :',
                            value: userProvider.userList[index].id.toString()),
                        ReusableRow(
                            name: 'Name : ',
                            value:
                                userProvider.userList[index].name.toString()),
                        ReusableRow(
                            name: 'User Name',
                            value: userProvider.userList[index].username
                                .toString()),
                        ReusableRow(
                            name: 'Email',
                            value:
                                userProvider.userList[index].email.toString()),
                        ReusableRow(
                            name: 'Address => street',
                            value: userProvider.userList[index].address!.street
                                .toString()),
                        ReusableRow(
                            name: 'Address =>suite',
                            value: userProvider.userList[index].address!.suite
                                .toString()),
                        ReusableRow(
                            name: 'Address => City',
                            value: userProvider.userList[index].address!.city
                                .toString()),
                        ReusableRow(
                            name: 'Address => ZipCode',
                            value: userProvider.userList[index].address!.zipcode
                                .toString()),
                        ReusableRow(
                            name: 'Address => Geo => Lat',
                            value: userProvider
                                .userList[index].address!.geo!.lat
                                .toString()),
                        ReusableRow(
                            name: 'Address =>Geo => Lon',
                            value: userProvider
                                .userList[index].address!.geo!.lng
                                .toString()),
                        ReusableRow(
                            name: 'Phone Number',
                            value:
                                userProvider.userList[index].phone.toString()),
                        ReusableRow(
                            name: 'Website',
                            value: userProvider.userList[index].website
                                .toString()),
                        ReusableRow(
                            name: 'Company => Name',
                            value: userProvider.userList[index].company!.name
                                .toString()),
                        ReusableRow(
                            name: 'Company => bs',
                            value: userProvider.userList[index].company!.bs
                                .toString()),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
