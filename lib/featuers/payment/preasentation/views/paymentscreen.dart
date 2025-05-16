import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/const.dart';
import 'package:gp/core/services/localdata.dart';
import 'package:gp/featuers/home/presntation/manger/cubits/suggestedbookscubit/suggestedbookcubit.dart';
import 'package:gp/featuers/mybooks/presentation/manger/purchasedbookscubit/purchasedbookscubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymobPaymentPage extends StatefulWidget {
  const PaymobPaymentPage({super.key,required this.bookid});
final int bookid;

  @override
  State<PaymobPaymentPage> createState() => _PaymobPaymentPageState();
}

class _PaymobPaymentPageState extends State<PaymobPaymentPage> {
  String? checkoutUrl;
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            final url = request.url;

            if (url.contains('success') ||
                url.contains('approved') ||
                url.contains('thank_you')) {
                  BlocProvider.of<Suggestedbookscubit>(context).fetchsuggestedBooks(id:widget.bookid );
                   BlocProvider.of<Purchasedbookscubit>(context).getPurchasedbooks();
              if (mounted) {
                Navigator.pop(context);
                _handlePaymentResult('Payment Successful ✅');
              }
              return NavigationDecision.prevent;
            } else if (url.contains('failed')) {
              if (mounted) _handlePaymentResult('Payment Failed ❌');
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
        ),
      );

    _getCheckoutSessionFromBackend();
  }

  Future<void> _getCheckoutSessionFromBackend() async {
      final prefs = await SharedPreferences.getInstance();
    final userPrefs = UserPrefs(prefs);

    // Get token from SharedPreferences
    final token = userPrefs.getUser()['token'];
    try {
      final dio = Dio();

      final response = await dio.post(
        '$baseurl/api/v1/paymob/create-intention',
        options: Options(
          followRedirects: false,
          validateStatus: (status) => status! < 500,
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
        data: {
          "book_id": widget.bookid,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        print('Decoded response: $data');

        final String clientSecret = data['data']['client_secret'];
        const publicKey = 'egy_pk_test_vJBYdnWLz0hP8K9H6KfnwfrAJM0hJ6i6';

        if (!mounted) return;

        setState(() {
          checkoutUrl =
              'https://accept.paymob.com/unifiedcheckout/?publicKey=$publicKey&clientSecret=$clientSecret';
          _controller.loadRequest(Uri.parse(checkoutUrl!));
        });
      } else {
        if (mounted) {
          _showErrorDialog('Failed to get client secret. Code: ${response.statusCode} ${response}');
        }
      }
    } catch (e) {
      if (mounted) {
        _showErrorDialog('Error occurred: $e');
      }
    }
  }

  void _handlePaymentResult(String message) {
  if (!mounted) return;

  showDialog(
  context: context,
  builder: (dialogContext) => AlertDialog(
    title: Text('Payment Result'),
    content: Text(message),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(dialogContext).pop(); // Close dialog
          if (mounted) {
            Navigator.of(context).pop(); // Pop payment screen
          }
        },
        child: Text('OK'),
      ),
    ],
  ),
);

}

  void _showErrorDialog(String error) {
    if (!mounted) return;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Error'),
        content: Text(error),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay with Paymob'),
      ),
      body: checkoutUrl == null
          ? Center(child: CircularProgressIndicator())
          : WebViewWidget(controller: _controller),
    );
  }
}
