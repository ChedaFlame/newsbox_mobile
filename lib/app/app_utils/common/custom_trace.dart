class CustomTrace {
  final StackTrace _trace;

  String? fileName;
  String? functionName;
  String? callerFunctionName;
  String? message;
  int? lineNumber;
  int? columnNumber;

  CustomTrace(this._trace, {this.message}) {
    _parseTrace();
  }

  String _getFunctionNameFromFrame(String frame) {
    var currentTrace = frame;
    var indexOfWhiteSpace = currentTrace.indexOf(' ');
    var subStr = currentTrace.substring(indexOfWhiteSpace);
    var indexOfFunction = subStr.indexOf(RegExp(r'[A-Za-z0-9]'));
    subStr = subStr.substring(indexOfFunction);
    indexOfWhiteSpace = subStr.indexOf(' ');
    subStr = subStr.substring(0, indexOfWhiteSpace);
    return subStr;
  }

  void _parseTrace() {
    /* The trace comes with multiple lines of strings, (each line is also known as a frame), so split the trace's string by lines to get all the frames */
    var frames = _trace.toString().split("\n");

    /* The first frame is the current function */
    functionName = _getFunctionNameFromFrame(frames[0]);

    /* The second frame is the caller function */
    callerFunctionName = _getFunctionNameFromFrame(frames[1]);

    /* The first frame has all the information we need */
    var traceString = frames[0];

    /* Search through the string and find the index of the file name by looking for the '.dart' regex */
    var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z]+.dart'));

    var fileInfo = traceString.substring(indexOfFileName);

    var listOfInfos = fileInfo.split(":");
    try {
      fileName = listOfInfos[0];
      lineNumber = int.tryParse(listOfInfos[1]);
      var columnStr = listOfInfos[2];
      columnStr = columnStr.replaceFirst(")", "");
      columnNumber = int.tryParse(columnStr);
    } catch (e) {}
  }

  @override
  String toString() {
    return "$message | ($functionName)";
  }
}
