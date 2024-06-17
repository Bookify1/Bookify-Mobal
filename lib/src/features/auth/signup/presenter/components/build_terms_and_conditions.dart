import 'package:bookify/src/features/auth/signup/presenter/components/build_text_body.dart';
import 'package:bookify/src/features/auth/signup/presenter/components/build_text_title.dart';
import 'package:bookify/src/shared/text.dart';
import 'package:flutter/material.dart';

List<TextSpan> buildTermsAndConditions() {
  List<TextSpan> textSpans = [];
  for (var section in TextGlobals.termsAndConditions) {
    textSpans.add(buildTitle(section['title']!));
    textSpans.add(buildBody(section['body']!));
  }
  return textSpans;
}
