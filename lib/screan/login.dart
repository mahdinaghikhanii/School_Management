import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolmanagement/module/estension.dart';

import 'package:schoolmanagement/module/widgets.dart';
import '../bloc/blocstate.dart';

TextEditingController _mobile = TextEditingController();
TextEditingController _password = TextEditingController();

class Login extends StatelessWidget {
  final BlocState state;
  const Login({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _fromKey = GlobalKey<FormState>();

    return Scaffold(
        //   appBar: AppBar(),
        body: SafeArea(
            child: SizedBox(
      width: context.width * 0.3 < 260 ? 350 : context.width * 0.3,
      child: Form(
        key: _fromKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            "Welcome To School Test"
                .toLabel(bold: true, fontsize: 22, color: Colors.grey)
                .vMargin9,
            MEdit(
                controller: _mobile,
                hint: "Username",
                autoFocus: false,
                notempty: true,
                password: false,
                onChange: (val) => "USername").padding9,
            MEdit(
                controller: _password,
                hint: "Password",
                notempty: true,
                autoFocus: false,
                password: true,
                onChange: (val) => "pas").padding9,
            Column(
              children: [
                Row(
                  children: [
                    Switch(value: false, onChanged: (val) {}),
                    "Remmember me ".toLabel(),
                    const Spacer(),
                    AbsorbPointer(
                        absorbing: state is Loading ? true : false,
                        child: MTextButton(ontap: () {}, title: "register"))
                  ],
                ),
                Row(mainAxisSize: MainAxisSize.min, children: [
                  MButton(
                    color: Colors.blue,
                    title: "Login",
                    onTap: () {
                      if (_fromKey.currentState!.validate()) {
                        context.userBloc
                            .authenticate(_mobile.text, _password.text);
                      }
                    },
                    icon: const Icon(
                      Icons.vpn_key,
                      size: 15,
                    ),
                  ).margin9,
                  const Spacer(),
                  AbsorbPointer(
                      absorbing: state is Loading ? true : false,
                      child: MTextButton(
                          ontap: () {}, title: "Forget my paasword")),
                  state is Loading
                      ? const CupertinoActivityIndicator()
                      : Container(),
                ]),
              ],
            ),
            state is Failed
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12)),
                    child: (state as Failed)
                        .exception
                        .toString()
                        .toLabel(color: Colors.white, bold: true))
                : Container()
          ],
        ),
      ),
    ).padding9.card.center));
  }
}
