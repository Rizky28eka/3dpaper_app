import 'package:flutter/material.dart';
import 'package:paper_3d/paper_3d.dart';
import 'package:provider/provider.dart';
import 'package:state_machine_animation/state_machine_animation.dart';
import 'package:vector_math/vector_math_64.dart' as vm;

import '../camera/camera_cubit.dart';

class BackAsset extends WorldAsset {
  BackAsset(String id, ScreenSize screenSize, TickerManager tickerManager)
      : super(
            controller: DefaultAssetController<BackAssetModel>(
                BackAssetModel(id, screenSize), tickerManager,
                initialControllerState: const WorldAssetLoaded(0)),
            child: const BackAssetWidget());
}

class BackAssetModel extends WorldAssetModel {
  BackAssetModel(String id, ScreenSize screenSize)
      : super(id, screenSize, position: vm.Vector3(0.0, 0.0, -1.0));

  @override
  AnimationModel copyWith(Map<String, dynamic> valueMap) => BackAssetModel(
        valueMap["id"] ?? id,
        valueMap["screenSize"] ?? screenSize,
      );
}

class BackAssetWidget extends StatelessWidget {
  const BackAssetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => context.read<CameraCubit>().increment(),
        child: Container(
            color: Colors.purple,
            child: const Center(
              child: Text("2",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 200,
                      decoration: TextDecoration.none)),
            )));
  }
}
