import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../config/colors.dart';
import 'navigation_page.dart';

class WaktuPage extends StatefulWidget {
  static const routeName = '/waktu';
  @override
  _WaktuPageState createState() => _WaktuPageState();
}

class _WaktuPageState extends State<WaktuPage> {
  String _wibTime = '';
  String _witaTime = '';
  String _witTime = '';
  String _londonTime = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      _updateTimes();
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  void _updateTimes() {
    final now = DateTime.now();
    final wibTime = now.toUtc().add(Duration(hours: 7));
    final witaTime = now.toUtc().add(Duration(hours: 8));
    final witTime = now.toUtc().add(Duration(hours: 9));
    final londonTime = now.toUtc().add(Duration(hours: 1));

    setState(() {
      _wibTime = DateFormat('HH:mm:ss').format(wibTime);
      _witaTime = DateFormat('HH:mm:ss').format(witaTime);
      _witTime = DateFormat('HH:mm:ss').format(witTime);
      _londonTime = DateFormat('HH:mm:ss').format(londonTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushNamed(context, NavigationPage.routeName);
        return true;
      },
      child: Scaffold(
        backgroundColor: primary,
        appBar: AppBar(
          backgroundColor: secondary,
          title: Text('Waktu Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'WIB Time: $_wibTime',
                style: TextStyle(fontSize: 20, color: text),
              ),
              SizedBox(height: 16),
              Text(
                'WITA Time: $_witaTime',
                style: TextStyle(fontSize: 20, color: text),
              ),
              SizedBox(height: 16),
              Text(
                'WIT Time: $_witTime',
                style: TextStyle(fontSize: 20, color: text),
              ),
              SizedBox(height: 16),
              Text(
                'London Time: $_londonTime',
                style: TextStyle(fontSize: 20, color: text),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: text,
          onPressed: _updateTimes,
          child: Icon(Icons.refresh, color: primary),
        ),
      ),
    );
  }
}
