class Rect implements Shape {
  final double width;
  final double height;
  double? radiusX;
  double? radiusY;
  
  Rect(this.width, this.height, [this.radiusX, this.radiusY]);
  
  @override
  String format(String shapeId) {
    final buffer = StringBuffer();
    
    buffer.write('    <rect id=\"$shapeId\" ');

    buffer.write('width=\"$this.width\" height=\"$this.height\"');
    
    if this.radiusX.isNotEmpty && this.radiusY.isNotEmpty {
      buffer.write(' rx=\"$this.radiusX\" ry=\"$this.radiusY\"');
    }
    
    buffer.write(' />');
    
    buffer.toString();
  }
}
