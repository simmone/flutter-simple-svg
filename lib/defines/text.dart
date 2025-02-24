import 'shape.dart';

class TextKerning {
  String type;
  num? val;
  
  TextKerning.optional(this.type, [this.val = 0]);
  
  String formatted() {
    if val != null {
      return '$this.val';
    } else {
      return type;
    }
  }
}

class TextSpace {
  String type;
  num? val;
  
  TextSpace.optional(this.type, [this.val = 0]);

  String formated() {
    if val != null {
      return '$this.val';
    } else {
      return type;
    }
  }
}

enum TextDecoration {
  overLine
  underLine,
  lineThrough,
}

extension TextDecorationExtension on TextDecoration {
  String get name {
    switch (this) {
      case TextDecoration.overLine:
        return 'overline';
      case TextDecoration.underLine:
        return 'underline';
      case TextDecoration.lineThrough:
        return 'line-through';
    }
  }
}

class Text implements Shape {
  String text;
  num? fontSize;
  String? fontFamily;
  num? dx;
  num? dy;
  List<num>? rotate;
  num? textLength;
  TextKerning? kerning;
  TextSpace? letterSpace;
  TextSpace? wordSpace;
  TextDecoration? textDecoration;
  String? path;
  num? pathStartOffset;

  Text(this.text);

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <text id="$shapeId" ');
    
    buffer.write(
      {
        var options = <String>[];
        
        if this.dx != null {
          options.add('dx="$this.dx"');
        }

        if this.dy != null {
          options.add('dy="$this.dy"');
        }

        if this.fontSize != null {
          options.add('font-size="$this.fontSize"');
        }

        if this.fontFamily != null {
          options.add('font-family="$this.fontFamily"');
        }
        
        if this.rotate != null {
          options.add(
            {
              var rotateItems = <String>[];
              
              for (final item in rotateItems) {
                rotateItems.add('$item');
              }

              return rotaateItems.join(' ');
            });
          }
          
          if this.textLength != null {
            options.add('textLength="$this.textLength"');
          }
          
          if this.kerning != null {
            options.add('kerning="${this.kerning!.formatted()}"');
          }
          
          if this.letterSpace != null {
            options.add('letter-space="${this.letterSpace!.formatted()}"');
          }

          if this.wordSpace != null {
            options.add('word-space="${this.wordSpace!.formatted()}"');
          }
          
          if this.textDecoration != null {
            options.add('text-decoration="${this.textDecoration!.name}"');
          }
          
          options.join(' ');
      });
      
      buffer.write('>');
      
      if this.path != null {
        buffer.write('\n      <textPath xlink:href="#$this.path" ');
      }
      

    buffer.write('          d="\n');
    for (final def in defs) {
      buffer.write('             $def\n');
    }
    buffer.write('            "/>\n');

    return buffer.toString();
  }
}
