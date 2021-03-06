// Copyright 2020 Sarbagya Dhaubanjar. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

///

class VolumeSlider extends StatefulWidget {
  @override
  _VolumeSliderState createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  final _volume = ValueNotifier<int>(100);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Text(
          "Volume",
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: _volume,
            builder: (context, int volume, _) {
              return Slider(
                inactiveColor: Colors.transparent,
                value: volume.toDouble(),
                min: 0.0,
                max: 100.0,
                //divisions: 30,
                label: '$volume',
                onChanged: (value) {
                  setState(() {
                    _volume.value = value.toInt();
                    context.ytController.setVolume(volume);
                    if (_volume.value == 0.0) {
                      context.ytController.mute();
                    } else {
                      context.ytController.unMute();
                    }
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
