import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/blocls.dart';
import '/widgets/widgets.dart';
import '/models/models.dart';

class PaymentSelection extends StatelessWidget {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  static const String routeName = '/payment-selection';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => PaymentSelection(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment Selection'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state is PaymentLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state is PaymentLoaded) {
            return ListView(
              padding: const EdgeInsets.all(20.0),
              children: [
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    context.read<PaymentBloc>().add(
                          SelectPaymentMethod(
                              paymentMethod: PaymentMethod.credit_card),
                        );
                    Navigator.pop(context);
                  },
                  child: Text('Pay with Credit Card'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    context.read<PaymentBloc>().add(
                          SelectPaymentMethod(
                              paymentMethod: PaymentMethod.halo_pesa),
                        );
                    Navigator.pop(context);
                  },
                  child: Text('Pay with Halopesa'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    context.read<PaymentBloc>().add(
                          SelectPaymentMethod(
                              paymentMethod: PaymentMethod.tigo_pesa),
                        );
                    Navigator.pop(context);
                  },
                  child: Text('Pay with Tigo pesa'),
                ),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    context.read<PaymentBloc>().add(
                          SelectPaymentMethod(
                              paymentMethod: PaymentMethod.m_pesa),
                        );
                    Navigator.pop(context);
                  },
                  child: Text('Pay with M-pesa'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    context.read<PaymentBloc>().add(
                          SelectPaymentMethod(
                              paymentMethod: PaymentMethod.artel_money),
                        );
                    Navigator.pop(context);
                  },
                  child: Text('Pay with Airtel Money'),
                ),
                const SizedBox(height: 10),
              ],
            );
          } else {
            return Text('Something went wrong');
          }
        },
      ),
    );
  }
}
