import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import '../widgets/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LostConnectionScreen extends StatefulWidget {
  final VoidCallback? onRetry;

  const LostConnectionScreen({super.key, this.onRetry});

  @override
  State<LostConnectionScreen> createState() => _LostConnectionScreenState();
}

class _LostConnectionScreenState extends State<LostConnectionScreen> {
  bool _isRetrying = false;

  Future<void> _handleRetry() async {
    setState(() {
      _isRetrying = true;
    });

    // Simulate API retry
    await Future.delayed(const Duration(seconds: 2));

    if (widget.onRetry != null) {
      widget.onRetry!();
    }

    setState(() {
      _isRetrying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset('assets/icons/app_icons/Arrow_Left.svg'),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          action: IconButton(
            onPressed: () {
              // Navigate to cart or other action
            },
            icon: SvgPicture.asset(IconPath.bag),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Connection icon/image
                Image.asset(
                  Images.disconnect,
                  width: 142,
                  height: 142,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.wifi_off_rounded,
                      size: 120,
                      color: const Color(0xff8F959E),
                    );
                  },
                ),

                AppGap.h40,

                // Lost connection title
                Text(
                  'Lost connection!',
                  style: const TextStyle(
                    fontFamily: 'Geist',
                    fontSize: 18,
                    color: Color(0xff1D1E20),
                  ),
                  textAlign: TextAlign.center,
                ),

                AppGap.h30,

                // Retry button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isRetrying ? null : _handleRetry,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 13.5),
                      backgroundColor: const Color(0xffF5F6FA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      disabledBackgroundColor: const Color(0xffF5F6FA),
                    ),
                    child: _isRetrying
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                const Color(0xff8F959E),
                              ),
                            ),
                          )
                        : Text(
                            'Retry',
                            style: AppTextStyle.s17.copyWith(
                              color: const Color(0xff8F959E),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Helper widget để show lost connection với error handling
class ConnectionErrorHandler extends StatelessWidget {
  final Widget child;
  final bool hasError;
  final VoidCallback onRetry;

  const ConnectionErrorHandler({
    super.key,
    required this.child,
    required this.hasError,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (hasError) {
      return LostConnectionScreen(onRetry: onRetry);
    }
    return child;
  }
}

// Example usage with FutureBuilder
class ExampleApiScreen extends StatefulWidget {
  const ExampleApiScreen({super.key});

  @override
  State<ExampleApiScreen> createState() => _ExampleApiScreenState();
}

class _ExampleApiScreenState extends State<ExampleApiScreen> {
  Future<dynamic>? _futureData;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<dynamic> _loadData() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Simulate network error
    // throw Exception('Network error');

    return {'data': 'success'};
  }

  void _handleRetry() {
    setState(() {
      _futureData = _loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return LostConnectionScreen(onRetry: _handleRetry);
        }

        // Your normal screen content here
        return Scaffold(body: Center(child: Text('Data loaded successfully!')));
      },
    );
  }
}
