import 'package:flutter/material.dart';
import '../../../Core/Helper/Helper.dart';
import '../loader.dart';
import 'MaterialTransparentRoute.dart';

bool loading = false;

void showLoading(){
  if (!loading) {
    loading = true;

    Navigator.of(Helper.materialKey.currentContext!).push(
        MaterialTransparentRoute(
            builder: (BuildContext context) =>
            Scaffold(backgroundColor: Colors.black.withOpacity(.45),body:
            const Center(child:
            Loader()
            ))

        ));
  }
}

void hideLoading(){
  if (loading) {
    Navigator.pop(Helper.materialKey.currentContext!);
    loading = false;
  }
}
