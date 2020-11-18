import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/core/base/screen_state.dart';

class LoadingView extends StatelessWidget {
  final ScreenState state;
  final Widget child;
  final String errorMessage;

  LoadingView({Key key, this.state, this.child, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: get(),
    );
  }

  Widget get() {
    switch (state) {
      case ScreenState.LOADING:
        {
          return Center(child: CircularProgressIndicator());
        }
        break;

      case ScreenState.SUCCESS:
        {
          return child;
        }
        break;
      case ScreenState.ERROR:
        {
          return Center(child: Text(errorMessage));
        }
        break;
      default:
        {
          return child;
        }
        break;
    }
  }
}
