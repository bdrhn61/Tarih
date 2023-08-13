import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarih/GridContainerController/gridContainerController.dart';
import 'package:tarih/Widgets/Soru/SoruSayfasi.dart';
import 'package:tarih/api/api.dart';
import 'package:tarih/model/soruModel.dart';
import 'package:tarih/providers/all_providers.dart';

class GridContainer extends ConsumerStatefulWidget {
  String metin;
  GridContainer(this.metin);

  @override
  GridContainerState createState() => GridContainerState(metin);
}

class GridContainerState extends ConsumerState {
  String metin;
  GridContainerState(this.metin);
  Map<String, String> yillaraGoreDogruYanlis = {};
  int maxFailedLoadAttempts = 3;
  RewardedInterstitialAd _rewardedInterstitialAd;
  int _numRewardedInterstitialLoadAttempts = 0;

  var aa;

  @override
  Future<void> initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      veriOku(ref, yillaraGoreDogruYanlis);
    });
    _createRewardedInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    double yaziBoyutu = MediaQuery.of(context).size.width * 0.13;
    double yaziBoyutu2 = MediaQuery.of(context).size.width * 0.07;
    double yaziAyari = MediaQuery.textScaleFactorOf(context);

    aa = ref.watch(dogruYanlisSayimProvider);

    return InkWell(
      onTap: () {

        print(_rewardedInterstitialAd.toString()+'**--------------***');
        if(_rewardedInterstitialAd==null){
          soruSayfasinaGit(context, ref, aa, metin);
       
       // CircularProgressIndicator();
         }
        else{
        _showRewardedInterstitialAd();
        }
        
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          //  border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.all(
              Radius.circular(20.0) //                 <--- border radius here
              ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                metin,
                style: GoogleFonts.josefinSans(
                    fontWeight: FontWeight.w300,
                    fontSize: yaziBoyutu / yaziAyari),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    sayiyaCevir(aa[metin])[0],
                    style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w400,
                        fontSize: yaziBoyutu2 / yaziAyari,
                        color: Colors.red),
                  ),
                  Text(
                    ' / ',
                    style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w400,
                        fontSize: yaziBoyutu2 / yaziAyari),
                  ),
                  Text(
                    sayiyaCevir(aa[metin])[1],
                    style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w400,
                        fontSize: yaziBoyutu2 / yaziAyari,
                        color: Colors.green),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _createRewardedInterstitialAd() {
    RewardedInterstitialAd.load(
      //ca-app-pub-3940256099942544/5224354917  test id
      //ca-app-pub-4234963259644081/4776584261 device id
        adUnitId: 'ca-app-pub-4234963259644081/4776584261',
        request: AdRequest(),
        rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
          onAdLoaded: (RewardedInterstitialAd ad) {
            print('$ad loaded.');
            _rewardedInterstitialAd = ad;
            _numRewardedInterstitialLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedInterstitialAd failed to load: $error');
            _rewardedInterstitialAd = null;
            _numRewardedInterstitialLoadAttempts += 1;
            if (_numRewardedInterstitialLoadAttempts < maxFailedLoadAttempts) {
              _createRewardedInterstitialAd();
            }
          },
        ));
  }

  void _showRewardedInterstitialAd() {
    if (_rewardedInterstitialAd == null) {
      print('Warning: attempt to show rewarded interstitial before loaded.');
      return;
    }
    _rewardedInterstitialAd.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedInterstitialAd ad) {
        // soruSayfasinaGit(context, ref, aa,metin);

        print('$ad onAdShowedFullScreenContent.');
      },
      onAdDismissedFullScreenContent: (RewardedInterstitialAd ad) {
       
        soruSayfasinaGit(context, ref, aa, metin);

        print('$ad onAdDismissedFullScreenContent.------------------');
        ad.dispose();
        _createRewardedInterstitialAd();
      },
      onAdFailedToShowFullScreenContent:
          (RewardedInterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createRewardedInterstitialAd();
      },
    );

    _rewardedInterstitialAd.setImmersiveMode(true);
    _rewardedInterstitialAd.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      //soruSayfasinaGit(context, ref, aa, metin);
      print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
    });
    _rewardedInterstitialAd = null;
  }
}
