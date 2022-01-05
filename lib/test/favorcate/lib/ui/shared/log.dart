import 'package:flutter/foundation.dart';
import 'package:stack_trace/stack_trace.dart';

enum LogMode {
  debug,    // 💚 DEBUG
  warning,  // 💛 WARNING
  info,     // 💙 INFO
  error,    // ❤️ ERROR
}

String printf(dynamic msg, { LogMode mode = LogMode.debug }) {
  if (kReleaseMode) { // release模式不打印
    return "";
  }
  var chain = Chain.current(); // Chain.forTrace(StackTrace.current);
  // 将 core 和 flutter 包的堆栈合起来（即相关数据只剩其中一条）
  chain = chain.foldFrames((frame) => frame.isCore || frame.package == "flutter");
  // 取出所有信息帧
  final frames = chain.toTrace().frames;
  // 找到当前函数的信息帧
  final idx = frames.indexWhere((element) => element.member == "printf");
  if (idx == -1 || idx+1 >= frames.length) {
    return "";
  }
  // 调用当前函数的函数信息帧
  final frame = frames[idx+1];

  var modeStr = "";
  switch(mode) {
    case LogMode.debug:
      modeStr = "💚 DEBUG";
      break;
    case LogMode.warning:
      modeStr = "💛 WARNING";
      break;
    case LogMode.info:
      modeStr = "💙 INFO";
      break;
    case LogMode.error:
      modeStr = "❤️ ERROR";
      break;
  }

  final printStr = "$modeStr ${frame.uri.toString().split("/").last}(${frame.line}-${frame.column}) - $msg ";
  print(printStr);
  return printStr;
}