import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const StopwatchApp());
}

class StopwatchApp extends StatelessWidget {
  const StopwatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stopwatch',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B111C),
        useMaterial3: true,
      ),
      home: const StopwatchHomePage(),
    );
  }
}

class StopwatchHomePage extends StatefulWidget {
  const StopwatchHomePage({super.key});

  @override
  State<StopwatchHomePage> createState() => _StopwatchHomePageState();
}

class _StopwatchHomePageState extends State<StopwatchHomePage> {
  final Stopwatch _stopwatch = Stopwatch();

  Timer? _ticker;
  bool _isRunning = false;

  static const Color primaryColor = Color(0xFF2997FF);
  static const Color backgroundColor = Color(0xFF0B111C);

  void _startStopwatch() {
    if (_isRunning) return;

    _stopwatch.start();

    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(milliseconds: 10), (_) {
      if (mounted) {
        setState(() {});
      }
    });

    setState(() {
      _isRunning = true;
    });
  }

  void _stopStopwatch() {
    if (!_isRunning) return;

    _stopwatch.stop();
    _ticker?.cancel();
    _ticker = null;

    setState(() {
      _isRunning = false;
    });
  }

  void _resetStopwatch() {
    _stopwatch
      ..stop()
      ..reset();

    _ticker?.cancel();
    _ticker = null;

    setState(() {
      _isRunning = false;
    });
  }

  String _formatTime() {
    final int milliseconds = _stopwatch.elapsedMilliseconds;

    final int minutes = milliseconds ~/ 60000;
    final int seconds = (milliseconds ~/ 1000) % 60;
    final int centiseconds = (milliseconds % 1000) ~/ 10;

    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}.'
        '${centiseconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int milliseconds = _stopwatch.elapsedMilliseconds;

    final double progress = (milliseconds % 60000) / 60000;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stopwatch',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double dialSize = (constraints.maxWidth * 0.78).clamp(
              240.0,
              340.0,
            );

            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: dialSize,
                      height: dialSize,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: dialSize,
                            height: dialSize,
                            child: CircularProgressIndicator(
                              value: progress,
                              strokeWidth: 7,
                              strokeCap: StrokeCap.round,
                              backgroundColor: const Color(0xFF293548),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                primaryColor,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  _formatTime(),
                                  style: TextStyle(
                                    fontSize: dialSize * 0.145,
                                    fontWeight: FontWeight.w600,
                                    fontFeatures: const [
                                      FontFeature.tabularFigures(),
                                    ],
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                _isRunning ? 'RUNNING' : 'STOPWATCH',
                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 12,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 60),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildControlButton(
                          label: 'Start',
                          icon: Icons.play_arrow_rounded,
                          color: const Color(0xFF20B981),
                          onPressed: _startStopwatch,
                        ),
                        _buildControlButton(
                          label: 'Stop',
                          icon: Icons.pause_rounded,
                          color: const Color(0xFFFF5252),
                          onPressed: _stopStopwatch,
                        ),
                        _buildControlButton(
                          label: 'Reset',
                          icon: Icons.refresh_rounded,
                          color: const Color(0xFF536174),
                          onPressed: _resetStopwatch,
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    Text(
                      _isRunning
                          ? 'Keep going!'
                          : milliseconds > 0
                          ? 'Time recorded'
                          : 'Ready when you are',
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 76,
          height: 76,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Colors.white,
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 4,
            ),
            child: Icon(icon, size: 38),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
