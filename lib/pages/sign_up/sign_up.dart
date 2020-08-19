import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter_news/common/widgets/widgets.dart';
// import 'package:flutter_news/common/utils/utils.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // fullName控制器
  final TextEditingController _fullnameController = TextEditingController();
  // email控制器
  final TextEditingController _emailController = TextEditingController();
  // password控制器
  final TextEditingController _passwordController = TextEditingController();

  // logo
  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(50)),
      child: Text(
        'Sign up',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          fontSize: duSetFontSize(24),
          height: 1,
        ),
      ),
    );
  }

  // 注册表单
  Widget _buildInputForm() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(top: duSetHeight(49)),
      child: Column(
        children: [
          inputTextEdit(
            controller: _fullnameController,
            keyboardType: TextInputType.text,
            hintText: 'Full name',
            marginTop: 0,
          ),
          inputTextEdit(controller: _emailController, keyboardType: TextInputType.emailAddress, hintText: 'Email'),
          inputTextEdit(
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            hintText: 'Password',
            isPassword: true,
          ),
          // 创建
          Container(
            height: duSetHeight(44),
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: btnFlatButtonWidget(
              onPressed: () {
                if (!duCheckStringLength(_fullnameController.value.text, 5)) {
                  toastInfo(msg: '用户名不能少于5位');
                  return;
                }
                if (!duIsEmail(_emailController.value.text)) {
                  toastInfo(msg: '请输入正确的邮箱');
                  return;
                }
                if (!duCheckStringLength(_passwordController.value.text, 6)) {
                  toastInfo(msg: '密码不能少于6位');
                  return;
                }
                Navigator.pop(context);
              },
              width: 295,
              fontWeight: FontWeight.w600,
              title: 'Create an account',
            ),
          ),
          Spacer(),
          // Forgot password
          Container(
            height: duSetHeight(22),
            margin: EdgeInsets.only(top: duSetHeight(20)),
            child: FlatButton(
              onPressed: () => {},
              child: Text(
                'Forgot password?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w400,
                  fontSize: duSetFontSize(16),
                  height: 1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // 第三方
  Widget _buildThirdPartyLogin() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(bottom: duSetHeight(40)),
      child: Column(
        children: <Widget>[
          // Title
          Text(
            'Or sign in with social networks',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
            ),
          ),
          // 按钮
          Padding(
            padding: EdgeInsets.only(top: duSetHeight(20)),
            child: Row(
              children: <Widget>[
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: 'twitter',
                ),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: 'google',
                ),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: 'facebook',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // 已有账号
  Widget _buildHaveAccountButton() {
    return Container(
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: btnFlatButtonWidget(
        onPressed: () {
          Navigator.pop(context);
        },
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: 'I have an account',
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: transparentAppBar(
        context: context,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: AppColors.primaryText,
            ),
            onPressed: () {
              toastInfo(msg: '这是注册界面');
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Divider(height: 1),
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildThirdPartyLogin(),
            _buildHaveAccountButton(),
          ],
        ),
      ),
    );
  }
}
