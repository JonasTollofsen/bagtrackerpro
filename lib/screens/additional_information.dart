import 'package:bagtrackerpro/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class AdditionalInformation extends StatelessWidget {
  const AdditionalInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
          headerTitle: 'Report bag', subTitle: 'Additional Information'),
    );
  }
}
