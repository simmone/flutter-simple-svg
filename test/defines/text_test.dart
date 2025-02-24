import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/defines/text.dart';

void main() {
  test('text format', () {
    final text = Text('hello world');
    text.fontSize = 1;
    text.fontFamily = 'Arial';
    text.dx = 2;
    text.dy = 3;
    text.rotate = [4, 5, 6, 7];
    text.textLength = 8;
    text.kerning = TextKerning(TextKerningType.auto);
    text.letterSpace = TextSpace(TextSpaceType.normal);
    text.wordSpace = TextSpace(TextSpaceType.inherit);
    text.textDecoration = TextDecoration.underLine;
    
    expect(text.format('s1'),
      '    <text id="s1" dx="2" dy="3" font-size="1" font-family="Arial" rotate="4 5 6 7" textLength="8" kerning="auto" letter-space="normal" word-space="inherit" text-decoration="underline">hello world</text>\n');

    text.path = '9.0, 10.0';
    text.pathStartOffset = 11;
    expect(text.format('s1'),
      '    <text id="s1" dx="2" dy="3" font-size="1" font-family="Arial" rotate="4 5 6 7" textLength="8" kerning="auto" letter-space="normal" word-space="inherit" text-decoration="underline">\n      <textPath xlink:href="#9.0, 10.0" startOffset="11%">hello world</textPath>\n    </text>\n');
  });
}
