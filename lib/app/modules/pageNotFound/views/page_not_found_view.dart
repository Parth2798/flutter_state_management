import 'package:flutter/cupertino.dart';
import 'package:flutter_state_management/app/modules/base_widgets.dart';

class PageNotFoundView extends BaseWidget {
  const PageNotFoundView({Key? key}) : super(key: key);

  @override
  _PageNotFoundState createState() => _PageNotFoundState();
}

class _PageNotFoundState extends BaseWidgetState<PageNotFoundView> with SingleTickerProviderStateMixin {
  @override
  String appBarTitle() => "Page Not Found";

  @override
  void onClickBackButton() {
    super.onClickBackButton();
  }

  final RelativeRectTween _relativeRectTween = RelativeRectTween(
    begin: const RelativeRect.fromLTRB(24, 24, 24, 200),
    end: const RelativeRect.fromLTRB(24, 24, 24, 250),
  );

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        PositionedTransition(
          rect: _relativeRectTween.animate(_controller),
          child: Image.asset('assets/images/brain.png'),
        ),
        Positioned(
          top: 150,
          bottom: 0,
          left: 24,
          right: 24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                '404',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 50,
                    letterSpacing: 2,
                    color: Color(0xff2f3640),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Sorry, we could not find the page!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xff2f3640),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

}
