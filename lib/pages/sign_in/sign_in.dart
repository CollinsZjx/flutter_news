import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter_news/common/widgets/widgets.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // logo
  Widget _buildLogo() {
    return Container(
      width: duSetWidth(110),
      margin: EdgeInsets.only(top: duSetHeight(40 + 44.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: duSetWidth(76),
            height: duSetHeight(76),
            margin: EdgeInsets.symmetric(horizontal: duSetWidth(15)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                    height: duSetHeight(76),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                      boxShadow: [
                        Shadows.primaryShadow,
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(duSetWidth(76 * 0.5))),
                    ),
                    child: Container(),
                  ),
                ),
                Positioned(
                  top: duSetWidth(13),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.none,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Text(
              'SECTOR',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                fontSize: duSetFontSize(16),
                height: 1,
              ),
            ),
          ),
          Text(
            'news',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
              height: 1,
            ),
          )
        ],
      ),
    );
  }

  // email的控制器
  final TextEditingController _emailController = TextEditingController();
  // 密码控制器
  final TextEditingController _passwordController = TextEditingController();

  // 登录操作
  _handleSignIn() {
    if (!duIsEmail(_emailController.value.text)) {
      toastInfo(msg: '请输入正确的邮箱');
      return;
    }
    if (!duCheckStringLength(_passwordController.value.text, 6)) {
      toastInfo(msg: '密码不能少于6位');
      return;
    }
  }

  // 跳转到注册页面
  _handleNavSignUp() {
    Navigator.pushNamed(
      context,
      'sign-up',
    );
  }

  // 登录表单
  Widget _buildInputForm() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(top: duSetHeight(49)),
      child: Column(
        children: [
          // Email
          inputTextEdit(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Email',
            marginTop: 0,
          ),
          // Password
          inputTextEdit(
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            hintText: 'Password',
            isPassword: true,
          ),
          // 注册、登录 横向布局
          Container(
            height: duSetHeight(44),
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Row(
              children: [
                // 注册
                btnFlatButtonWidget(
                  onPressed: _handleNavSignUp,
                  gbColor: AppColors.thirdElement,
                  title: 'Sign up',
                ),
                Spacer(),
                // 登录
                btnFlatButtonWidget(
                  onPressed: _handleSignIn,
                  gbColor: AppColors.primaryElement,
                  title: 'Sign in',
                )
              ],
            ),
          ),
          Container(
            height: duSetHeight(22),
            margin: EdgeInsets.only(top: duSetHeight(20)),
            child: FlatButton(
              onPressed: () => {},
              child: Text(
                'Fogot password?',
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
          ),
        ],
      ),
    );
  }

  // 第三方登录
  Widget _buildThridPartyLogin() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(bottom: duSetHeight(40)),
      child: Column(
        children: <Widget>[
          // title
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
          ),
        ],
      ),
    );
  }

  // 注册按钮
  Widget _buildSignupButton() {
    return Container(
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: btnFlatButtonWidget(
        onPressed: () {},
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: 'Sign up',
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildSignupButton(),
            _buildThridPartyLogin(),
          ],
        ),
      ),
    );
  }
}
