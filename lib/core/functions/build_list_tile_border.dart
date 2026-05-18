import 'package:flutter/material.dart';

import '../utils/colors.dart';

RoundedRectangleBorder buildListTileRoundedRectangleBorder() {
  return RoundedRectangleBorder(
    side: BorderSide(color: ColorsData.kBorderColor),
    borderRadius: BorderRadius.circular(8),
  );
}
