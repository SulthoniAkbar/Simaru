import 'package:simaru/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:simaru/themes.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';

class EditProfilePage extends StatefulWidget {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController phoneController = TextEditingController(text: '');
  TextEditingController devisionController = TextEditingController(text: '');
  TextEditingController genderController = TextEditingController(text: '');
  TextEditingController addressController = TextEditingController(text: '');
  TextEditingController nipController = TextEditingController(text: '');

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: bgColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profile',
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: primaryColor,
            ),
            onPressed: () {},
          )
        ],
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama',
              style: primaryTextStyle3.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: primaryTextColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                style: primaryTextStyle3,
                decoration: InputDecoration.collapsed(
                  hintText: user.name,
                  hintStyle: subtitleTextStyle,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget devisi() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Devisi',
              style: primaryTextStyle3.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: primaryTextColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                style: primaryTextStyle,
                decoration: InputDecoration.collapsed(
                  hintText: user.devisi,
                  hintStyle: subtitleTextStyle,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget address() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alamat',
              style: primaryTextStyle3.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: primaryTextColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                style: primaryTextStyle,
                decoration: InputDecoration.collapsed(
                  hintText: user.address,
                  hintStyle: subtitleTextStyle,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget phonenumber() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Phone',
              style: primaryTextStyle3.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: primaryTextColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                style: primaryTextStyle3,
                decoration: InputDecoration.collapsed(
                  hintText: user.phone,
                  hintStyle: subtitleTextStyle,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/icon_username.png'),
                  //     image: NetworkImage('assets/splashscreen.png'),
                ),
              ),
            ),
            nameInput(),
            devisi(),
            address(),
            phonenumber(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
