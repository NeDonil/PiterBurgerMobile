import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vorstu/feature/profile/widgets/profile-action-button.dart';
import 'package:vorstu/feature/profile/widgets/profile-divider.dart';
import 'package:vorstu/model/order.dart';
import 'package:vorstu/service/auth-service.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 227, 202, 1.0),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ProfileActionButton(onPressed: () {}, title: 'Сменить имя'),
            const ProfileDivider(),
            ProfileActionButton(onPressed: () {}, title: 'История заказов'),
            const ProfileDivider(),
            ProfileActionButton(onPressed: () {}, title: 'Информация'),
            const ProfileDivider(),
            ProfileActionButton(
              title: 'Корзина',
              onPressed: () => {
                Navigator.of(context).pushNamed('/order')
            }),
            const ProfileDivider(),
            ProfileActionButton(onPressed: () {
              AuthService.logout();
              Navigator.popAndPushNamed(context, '/login');
            }, title: 'Выйти'),
          ],
        ),
      ),
    );
  }
}