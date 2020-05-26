import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:pahlevikun.github.io/common/config/screen_util.dart';
import 'package:pahlevikun.github.io/common/widget/page_title.dart';
import 'package:pahlevikun.github.io/presentation/base_page.dart';

class PortfolioSection extends StatefulWidget {
  PortfolioSection(GlobalKey key) : super(key: key);

  @override
  _PortfolioSectionState createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> {
  Widget build(BuildContext context) {
    return BasePage(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: SizeConfig.HORIZONTAL_PADDING_SIZE,
              right: SizeConfig.HORIZONTAL_PADDING_SIZE,
              top: SizeConfig.VERTICAL_PADDING_SIZE,
            ),
            child: PageTitle("Portfolio"),
          ),
          SizedBox(height: SizeConfig.LARGE_SIZE),
          _buildExpertise(),
          SizedBox(height: SizeConfig.LARGE_SIZE),
        ],
      ),
    );
  }

  Widget _buildExpertise() {
    return Padding(
      padding: const EdgeInsets.only(
        left: SizeConfig.HORIZONTAL_PADDING_SIZE,
        right: SizeConfig.HORIZONTAL_PADDING_SIZE,
      ),
      child: Image(
        width: double.infinity,
        fit: BoxFit.fill,
        image: AdvancedNetworkImage(
          "https://ghchart.rshah.org/2274A5/pahlevikun",
          useDiskCache: true,
          cacheRule: CacheRule(maxAge: const Duration(days: 10)),
        ),
      ),
    );
  }
}
