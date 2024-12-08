import 'package:simple_svg/defines/svg.dart';

class SimpleSvg {
  Svg? svg;

  SimpleSvg(num width, num height) {
    svg = Svg(width ,height);
  }

  String out() {
    final outBuffer = StringBuffer();
    
    outBuffer.write('<svg\n');
    outBuffer.write('    version="1.1"\n');
    outBuffer.write('    xmlns="http://www.w3.org/2000/svg"\n');
    outBuffer.write('    xmlns:xlink="http://www.w3.org/1999/xlink"\n');
    outBuffer.write('    width="${svg?.width}" height="${svg?.height}"\n');
    outBuffer.write('    >\n');
    outBuffer.write('</svg>\n');
    
    return outBuffer.toString();
  }
}
