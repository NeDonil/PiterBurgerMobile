import 'package:flutter/material.dart';
import 'package:vorstu/feature/home-screen/view/group.dart';
import 'package:vorstu/model/group.dart';
import 'package:vorstu/service/customer-service.dart';
import 'package:vorstu/widgets/button.dart';
import 'package:vorstu/widgets/header.dart';

class GroupList extends StatefulWidget{
  GroupList({super.key});
  @override
  _GroupListState createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  late List<Group> groups;

  final CustomerService customerService = CustomerService();

  @override
  void initState() {
    super.initState();
    customerService.getManyGroups()
        .then((response) => setState(() => groups = response));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: FutureBuilder(
          future: customerService.getManyGroups(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 32),
                itemCount: groups.length,
                itemBuilder: (context, index) =>
                    Align(
                        alignment: Alignment.center,
                        child: Button(
                          height: 60,
                          width: 220,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  GroupView(
                                      groupId: groups.elementAt(index).id
                                  )),
                            );
                          },
                          title: groups.elementAt(index).name, // TODO: Name
                        )
                    ),
                separatorBuilder: (context, index) => const SizedBox(height: 10),
              );
            }
          }
      )
    );
  }
}