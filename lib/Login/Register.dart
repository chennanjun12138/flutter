import 'package:flutter/material.dart';
import '../main.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.push<int>(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return MyApp();
            }));
          },
          icon: Icon(Icons.backspace),
        ),
        title: Text(
          "注册",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const MyBody(),
    );
  }
}

class MyBody extends StatefulWidget {
  const MyBody({Key key}) : super(key: key);

  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  String _id = " ",
      _name = " ",
      _password = " ",
      _sex = " ",
      _picture = "null",
      _description = "null",
      _email = " ";

  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey, // 设置globalKey，用于后面获取FormStat
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 30),
            // buildImageField(context),
            buildIdTextField(context), // 输入id
            const SizedBox(height: 20),
            buildNameTextField(context), // 输入密码
            const SizedBox(height: 20),
            buildPasswordTextField(context),
            const SizedBox(height: 20),
            buildSexTextField(context),
            const SizedBox(height: 20),
            buildIdImageField(context),
            const SizedBox(height: 20),
            buildDescriptionTextField(context),
            const SizedBox(height: 20),
            buildEmailTextField(context),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () async {
                var headers = {
                  'User-Agent': 'Apifox/1.0.0 (https://www.apifox.cn)'
                };
                var request = http.MultipartRequest('POST',
                    Uri.parse('http://3c40a37e.r3.cpolar.top/user_register'));
                request.fields.addAll({
                  'user_id': _id,
                  'user_name': _name,
                  'user_password': _password,
                  'sex': "男",
                  'user_picture': _picture,
                  'user_description': _description,
                  'user_email': _email,
                });
                request.headers.addAll(headers);
                http.StreamedResponse response = await request.send();
                debugPrint(response.statusCode.toString());
                if (response.statusCode == 200) {
                  print(await response.stream.bytesToString());
                  // String responseContent=await response.stream.transform(utf8.decoder).join();
                  // String responsecode=json.decode(responseContent)["code"].toString();
                  // debugPrint("scode:"+responsecode);

                  Navigator.push<int>(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return MyApp();
                  }));
                } else {
                  print(response.reasonPhrase);
                }
              },
              child: Text("注册并登录"),
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  Widget buildImageFieldArea(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.add_photo_alternate_outlined),
      iconSize: 80.0,
    );
  }

  Widget buildIdImageField(BuildContext context) {
    return TextFormField(
      onSaved: (v) => _id = v,
      validator: (v) {
        _picture = v;
      },
      decoration: const InputDecoration(hintText: "请输入图片信息(非必填)"),
    );
  }

  Widget buildIdTextField(BuildContext context) {
    return TextFormField(
      onSaved: (v) => _id = v,
      validator: (v) {
        if (v.isEmpty) {
          return '请输入id';
        }
      },
      decoration: const InputDecoration(hintText: "请输入id"),
    );
  }

  Widget buildNameTextField(BuildContext context) {
    return TextFormField(
      onSaved: (v) => _name = v,
      validator: (v) {
        if (v.isEmpty) {
          return '请输入昵称';
        }
        _name = v;
      },
      decoration: const InputDecoration(hintText: "请输入昵称"),
    );
  }

  Widget buildPasswordTextField(BuildContext context) {
    return TextFormField(
      onSaved: (v) => _password = v,
      validator: (v) {
        if (v.isEmpty) {
          return '请输入密码';
        }
        _password = v;
      },
      decoration: const InputDecoration(hintText: "请输入密码"),
    );
  }

  Widget buildSexTextField(BuildContext context) {
    return TextFormField(
      onSaved: (v) => _sex = v,
      validator: (v) {
        if (v.isEmpty) {
          return '请输入性别';
        }
        if (v.compareTo("male") != 0 && v.compareTo("female") != 0) {
          return '请输入正确的性别';
        }
        _sex = v;
      },
      decoration: const InputDecoration(hintText: "请输入性别"),
    );
  }

  Widget buildDescriptionTextField(BuildContext context) {
    return TextFormField(
      onSaved: (v) => _description = v,
      validator: (v) {
        _description = v;
      },
      decoration: const InputDecoration(hintText: "请输入描述信息(非必填)"),
    );
  }

  Widget buildEmailTextField(BuildContext context) {
    return TextFormField(
      onSaved: (v) => _email = v,
      validator: (v) {
        var emailReg = RegExp(
            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
        if (!emailReg.hasMatch(v)) {
          return '请输入正确的邮箱地址';
        }
        _email = v;
      },
      decoration: const InputDecoration(hintText: "请输入邮箱地址"),
    );
  }
}
