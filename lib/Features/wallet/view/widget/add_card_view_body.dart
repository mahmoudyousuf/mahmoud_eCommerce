import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahmoud_task/Features/wallet/manager/wallet_cubit.dart';

import '../../../../core/theme/colors.dart';

import '../../../../core/theme/styles.dart';
import '../../../commom/global_top_bar.dart';
import '../../../commom/model/WalletModel.dart';

class AddCardViewBody extends StatefulWidget {
  const AddCardViewBody({Key? key}) : super(key: key);

  @override
  _CreditCardPageState createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<AddCardViewBody> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            globalHeadBar(context),


            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              //true when you want to show cvv(back) view
              onCreditCardWidgetChange: (CreditCardBrand
                  brand) {}, // Callback for anytime credit card brand is changed
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  CreditCardForm(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    onCreditCardModelChange: onCreditCardModelChange,
                    // themeColor: Colors.blue,
                    formKey: formKey,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.sp),
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // await SecureStorage.writeSecureData(SharedConstants.localSavedWallet , jsonString

                          // );

                          WalletModel walletModel = WalletModel(
                              cardNumber: cardNumber,
                              expireDate: expiryDate,
                              cardHolderName: cardHolderName,
                              cvvCode: cvvCode);

                          final jsonString = json.encode(walletModel);

                          context.read<WalletCubit>().addWalletData(jsonString);
                          Navigator.pop(context);

                          context.read<WalletCubit>().getWalletData();
                        } else {}
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsData.primaryLightColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('add card'.toUpperCase(),
                                style: Styles.textStyle16
                                    .copyWith(color: ColorsData.whiteColor)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
