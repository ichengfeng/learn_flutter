import 'package:flutter/foundation.dart';
import 'package:stack_trace/stack_trace.dart';

enum LogMode {
  debug,    // ð DEBUG
  warning,  // ð WARNING
  info,     // ð INFO
  error,    // â¤ï¸ ERROR
}

String printf(dynamic msg, { LogMode mode = LogMode.debug }) {
  if (kReleaseMode) { // releaseæ¨¡å¼ä¸æå°
    return "";
  }
  var chain = Chain.current(); // Chain.forTrace(StackTrace.current);
  // å° core å flutter åçå æ åèµ·æ¥ï¼å³ç¸å³æ°æ®åªå©å¶ä¸­ä¸æ¡ï¼
  chain = chain.foldFrames((frame) => frame.isCore || frame.package == "flutter");
  // ååºææä¿¡æ¯å¸§
  final frames = chain.toTrace().frames;
  // æ¾å°å½åå½æ°çä¿¡æ¯å¸§
  final idx = frames.indexWhere((element) => element.member == "printf");
  if (idx == -1 || idx+1 >= frames.length) {
    return "";
  }
  // è°ç¨å½åå½æ°çå½æ°ä¿¡æ¯å¸§
  final frame = frames[idx+1];

  var modeStr = "";
  switch(mode) {
    case LogMode.debug:
      modeStr = "ð DEBUG";
      break;
    case LogMode.warning:
      modeStr = "ð WARNING";
      break;
    case LogMode.info:
      modeStr = "ð INFO";
      break;
    case LogMode.error:
      modeStr = "â¤ï¸ ERROR";
      break;
  }

  final printStr = "$modeStr ${frame.uri.toString().split("/").last}(${frame.line}-${frame.column}) - $msg ";
  print(printStr);
  return printStr;
}