import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gp/const.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key, required this.recored});
  final String recored;

  @override
  AudioPlayerScreenState createState() => AudioPlayerScreenState();
}

class AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final AudioPlayer _player = AudioPlayer();
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;

  StreamSubscription<Duration>? _positionSub;
  StreamSubscription<Duration?>? _durationSub;
  StreamSubscription<PlayerState>? _playerStateSub;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    try {
      await _player.setUrl(widget.recored);
    } catch (e) {}

    _duration = _player.duration ?? Duration.zero;

    _positionSub = _player.positionStream.listen((pos) {
      if (mounted) {
        setState(() {
          _position = pos;
        });
      }
    });

    _durationSub = _player.durationStream.listen((dur) {
      if (mounted && dur != null) {
        setState(() {
          _duration = dur;
        });
      }
    });

    _playerStateSub = _player.playerStateStream.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state.playing;

          if (state.processingState == ProcessingState.completed) {
            _player.seek(Duration.zero);
            _player.pause();
            _isPlaying = false;
            _position = Duration.zero;
          }
        });
      }
    });
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _positionSub?.cancel();
    _durationSub?.cancel();
    _playerStateSub?.cancel();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final remaining = _duration - _position;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 1.0,
              showValueIndicator: ShowValueIndicator.never,
              thumbShape: SliderComponentShape.noThumb,
            ),
            child: Slider(
              activeColor: color,
              inactiveColor: opacitycolor2,
              value: _position.inSeconds.toDouble(),
              min: 0,
              max: _duration.inSeconds.toDouble().clamp(1, double.infinity),
              onChanged: (value) {
                _player.seek(Duration(seconds: value.toInt()));
              },
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 25),
              Text(formatDuration(_position),
                  style: const TextStyle(fontSize: 10, color: opacitycolor2)),
              const Spacer(),
              Text(formatDuration(remaining),
                  style: const TextStyle(fontSize: 10, color: opacitycolor2)),
              const SizedBox(width: 25),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  final newPos = _position - const Duration(seconds: 10);
                  _player.seek(newPos >= Duration.zero ? newPos : Duration.zero);
                },
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, border: Border.all(width: 2)),
                  child: const Center(
                      child: Icon(Icons.arrow_back_ios_new_outlined, size: 20)),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  _isPlaying ? _player.pause() : _player.play();
                },
                child: _isPlaying
                    ? Container(
                        width: 73,
                        height: 72,
                        padding: const EdgeInsets.all(6),
                        child: const CircleAvatar(
                          backgroundColor: color,
                          radius: 15,
                          child: Center(
                            child: Icon(Icons.pause,
                                color: Colors.white, size: 35),
                          ),
                        ),
                      )
                    : Image.asset('assets/images/Play.png'),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  final newPos = _position + const Duration(seconds: 10);
                  _player.seek(newPos <= _duration ? newPos : _duration);
                },
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, border: Border.all(width: 2)),
                  child: const Center(
                      child: Icon(Icons.arrow_forward_ios_outlined, size: 20)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
