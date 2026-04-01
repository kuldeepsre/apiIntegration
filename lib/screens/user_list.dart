import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<UserProvider>(context, listen: false).fetchUsers());
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Users List")),
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : provider.error != null
          ? Center(child: Text(provider.error!))
          :Column(
        children: [

          if (provider.info != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                color: Colors.grey.shade200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Page: ${provider.info?.page}"),
                    Text("Results: ${provider.info?.results}"),
                    Text("Seed: ${provider.info?.seed}"),
                    Text("Version: ${provider.info?.version}"),
                  ],
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: provider.users.length,
              itemBuilder: (context, index) {
                final user = provider.users[index];
            
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                      NetworkImage(user.picture?.thumbnail ?? ""),
                    ),
                    title: Text(
                      "${user.name?.first ?? ""} ${user.name?.last ?? ""}",
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.email ?? ""),
                        Text(user.dob!.date.toString()),
            
                        // Text("${user.location?.city ?? ""}, "
                        //     "${user.location?.country ?? ""}"),
                        Text("Phone: ${user.phone ?? ""}"),
                      ],
                    ),
                    trailing: Text(user.nat ?? ""),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}