import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobScreen extends StatefulWidget {
  const AdMobScreen({super.key});

  @override
  State<AdMobScreen> createState() => _AdMobScreenState();
}

class _AdMobScreenState extends State<AdMobScreen> {
  BannerAd? bannerAd;
  void loadBanner() {

    final adUnitId = Platform.isAndroid
        ? 'ca-app-pub-3940256099942544/6300978111'
        : 'ca-app-pub-3940256099942544/2934735716';
    bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(),
    );
    bannerAd!.load();

  }
  @override
  void initState() {
    super.initState();
    loadBanner();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
            AdWidget(ad: bannerAd!)
        ],
      ),
    );
  }
}


//ca-app-pub-6353946072944491~6371040726 appID
//ca-app-pub-6353946072944491/8551261752 unit Id

//ca-app-pub-6353946072944491/8551261752
