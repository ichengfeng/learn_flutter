void cfLog(Object message, StackTrace current) {
  CFCustomTrace programInfo = CFCustomTrace(current);
  print('所在文件：${programInfo.fileName},所在行：${programInfo.lineNumber},所在列：${programInfo.columnNumber}');
  print(message);
}

class CFCustomTrace {
  final StackTrace _trace;

  late String fileName;
  late int lineNumber;
  late int columnNumber;

  CFCustomTrace(this._trace) {
    _parseTrace();
  }

  void _parseTrace() {
    var traceString = _trace.toString().split('\n')[0];
    var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z_]+.dart'));
    var fileInfo = traceString.substring(indexOfFileName);
    var listOfInfos = fileInfo.split(':');

    fileName = listOfInfos[0];
    lineNumber = int.parse(listOfInfos[1]);
    var columnStr = listOfInfos[2];
    columnStr = columnStr.replaceFirst(')',"");
    columnNumber = int.parse(columnStr);
  }

}