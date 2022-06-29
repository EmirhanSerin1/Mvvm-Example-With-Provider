// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mvvm_example_with_provider/main.dart';
import 'package:mvvm_example_with_provider/services/services.dart';
import 'package:mvvm_example_with_provider/view_model/pictures_view_model.dart';

void main() {
  ListPicturesViewModel listPicturesViewModel = ListPicturesViewModel();

  group("Return body when fetch data is unsuccessful, ", () {
    test('return body string when view model unsuccessful', () async {
      expect( listPicturesViewModel.fetchPictures().toString(),
          "Instance of \'Future<dynamic>\'");
    });

    test('return body when service is unsuccessful', () async {
      expect( PicsumService().fetcPicturesApi().toString(),
          'Instance of \'Future<List<PicsumModel>>\'');
    });
  });
}
