library triangles_background;

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Triangles extends StatefulWidget {
  // Vertex colors
  //    v1***v2
  //    *******
  //    *******
  //    v4***v3
  final Color v1Color;
  final Color v2Color;
  final Color v3Color;
  final Color v4Color;

  // Color of triangles strokes
  final Color lineColor;

  // Stroke width
  final double strokeWidth;

  // Radius of circle at vertex
  final double circleRadius;

  // number of horizontal divisions
  final double hDivisions;

  // number of vertica divisions
  final double vDivisions;

  // width of triangles. Approximated to fit the widget width
  final double hSpace;

  // height of triangles. Approximated to fit the widget height
  final double vSpace;

  // min speed of vertices
  final double speedMin;

  // max speed of vertices
  final double speedMax;

  const Triangles({
    Key key,
    this.v1Color: Colors.red,
    this.v2Color: Colors.black,
    this.v3Color: Colors.green,
    this.v4Color: Colors.yellow,
    this.lineColor: Colors.black,
    this.strokeWidth: 0.5,
    this.circleRadius: 2,
    this.hDivisions,
    this.vDivisions,
    this.hSpace,
    this.vSpace,
    this.speedMin: 0.1,
    this.speedMax: 0.3,
  })
    : assert( !(hDivisions == null && vDivisions == null) ||
              !(hSpace == null && vSpace == null),
              "divisions or space must be provided or one division and one space"),
      assert(speedMin <= speedMax, "speedMax must be greater the speedMin"),
      assert(speedMin >= 0, "speedMin must be greater then 0"),
      super(key: key);

  @override
  _TrianglesState createState() => _TrianglesState();
}

class _TrianglesState extends State<Triangles> with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: _Triangles(
        v1Color: widget.v1Color,
        v2Color: widget.v2Color,
        v3Color: widget.v3Color,
        v4Color: widget.v4Color,
        lineColor: widget.lineColor,
        strokeWidth: widget.strokeWidth,
        circleRadius: widget.circleRadius,
        hSpace: widget.hSpace,
        vSpace: widget.vSpace,
        hDivisions: widget.hDivisions,
        vDivisions: widget.vDivisions,
        speedMin: widget.speedMin,
        speedMax: widget.speedMax,
      ),
    );
  }
}


class _Triangles extends SingleChildRenderObjectWidget {

  const _Triangles({
    Key key,
    @required this.v1Color,
    @required this.v2Color,
    @required this.v3Color,
    @required this.v4Color,
    @required this.lineColor,
    @required this.strokeWidth,
    @required this.circleRadius,
    this.hSpace,
    this.vSpace,
    this.hDivisions,
    this.vDivisions,
    this.speedMin,
    this.speedMax,
  })
      : super(key: key);

  final Color v1Color;
  final Color v2Color;
  final Color v3Color;
  final Color v4Color;
  final Color lineColor;
  final double strokeWidth;
  final double circleRadius;
  final double hSpace;
  final double vSpace;
  final double hDivisions;
  final double vDivisions;
  final double speedMin;
  final double speedMax;

  @override
  _RenderTriangles createRenderObject(BuildContext context) {
    return _RenderTriangles(
      v1Color: v1Color,
      v2Color: v2Color,
      v3Color: v3Color,
      v4Color: v4Color,
      lineColor: lineColor,
      strokeWidth: strokeWidth,
      circleRadius: circleRadius,
      hSpace: hSpace,
      vSpace: vSpace,
      hDivisions: hDivisions,
      vDivisions: vDivisions,
      speedMin: speedMin,
      speedMax: speedMax,
    );
  }

  @override
  void updateRenderObject(BuildContext context, _RenderTriangles renderObject) {
    renderObject.v1Color = v1Color;
    renderObject.v2Color = v2Color;
    renderObject.v3Color = v3Color;
    renderObject.v4Color = v4Color;
    renderObject.lineColor = lineColor;
    renderObject.strokeWidth = strokeWidth;
    renderObject.circleRadius = circleRadius;
    renderObject.hSpace = hSpace;
    renderObject.vSpace = vSpace;
    renderObject.hDivisions = hDivisions;
    renderObject.vDivisions = vDivisions;
    renderObject.speedMin = speedMin;
    renderObject.speedMax = speedMax;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Color>('v1Color', v1Color));
    properties.add(DiagnosticsProperty<Color>('v2Color', v2Color));
    properties.add(DiagnosticsProperty<Color>('v3Color', v3Color));
    properties.add(DiagnosticsProperty<Color>('v4Color', v4Color));
    properties.add(DiagnosticsProperty<Color>('lineColor', lineColor));
    properties.add(DoubleProperty('strokeWidth', strokeWidth));
    properties.add(DoubleProperty('circleRadius', circleRadius));
    properties.add(DoubleProperty('hSpace', hSpace));
    properties.add(DoubleProperty('vSpace', vSpace));
    properties.add(DoubleProperty('hDivisions', hDivisions));
    properties.add(DoubleProperty('vDivisions', vDivisions));
    properties.add(DoubleProperty('speedMin', speedMin));
    properties.add(DoubleProperty('speedMax', speedMax));
  }
}



class _RenderTriangles extends RenderProxyBox/*WithHitTestBehavior*/ {
  _RenderTriangles({
    @required Color v1Color,
    @required Color v2Color,
    @required Color v3Color,
    @required Color v4Color,
    @required lineColor,
    @required strokeWidth,
    @required circleRadius,
    double hSpace,
    double vSpace,
    double hDivisions,
    double vDivisions,
    double speedMin,
    double speedMax,
  })
      : _v1Color = v1Color,
        _v2Color = v2Color,
        _v3Color = v3Color,
        _v4Color = v4Color,
        _lineColor = lineColor,
        _strokeWidth = strokeWidth,
        _circleRadius = circleRadius,
        _hSpace = hSpace,
        _vSpace = vSpace,
        _hDivisions = hDivisions,
        _vDivisions = vDivisions,
        _speedMin = speedMin,
        _speedMax = speedMax,
        // super(behavior: HitTestBehavior.opaque);
        super();

  List<List<Vertex>> vertices;
  double _hSpaceComputed;
  double _vSpaceComputed;

  Color get v1Color => _v1Color;
  Color _v1Color;
  set v1Color(Color value) {
    assert(value != null);
    if (value == _v1Color) {
      return;
    }
    _v1Color = value;
    markNeedsPaint();
  }

  Color get v2Color => _v2Color;
  Color _v2Color;
  set v2Color(Color value) {
    assert(value != null);
    if (value == _v2Color) {
      return;
    }
    _v2Color = value;
    markNeedsPaint();
  }

  Color get v3Color => _v3Color;
  Color _v3Color;
  set v3Color(Color value) {
    assert(value != null);
    if (value == _v3Color) {
      return;
    }
    _v3Color = value;
    markNeedsPaint();
  }

  Color get v4Color => _v4Color;
  Color _v4Color;
  set v4Color(Color value) {
    assert(value != null);
    if (value == _v4Color) {
      return;
    }
    _v4Color = value;
    markNeedsPaint();
  }

  Color get lineColor => _lineColor;
  Color _lineColor;
  set lineColor(Color value) {
    assert(value != null);
    if (value == _lineColor) {
      return;
    }
    _lineColor = value;
    markNeedsPaint();
  }

  double _strokeWidth;
  double get strokeWidth => _strokeWidth;
  set strokeWidth(double strokeWidth) {
    _strokeWidth = strokeWidth;
    markNeedsPaint();
  }

  double _circleRadius;
  double get circleRadius => _circleRadius;
  set circleRadius(double circleRadius) {
    _circleRadius = circleRadius;
    markNeedsPaint();
  }

  double _hSpace;
  double get hSpace => _hSpace;
  set hSpace(double hSpace) {
    // assert(hSpace > 0);
    _hSpace = hSpace;
    markNeedsPaint();
  }

  double _vSpace;
  double get vSpace => _vSpace;
  set vSpace(double vSpace) {
    // assert(vSpace > 0);
    _vSpace = vSpace;
    markNeedsPaint();
  }

  double _hDivisions;
  double get hDivisions => _hDivisions;
  set hDivisions(double hDivisions) {
    // assert(hDivisions > 0);
    _hDivisions = hDivisions;
    markNeedsPaint();
  }

  double _vDivisions;
  double get vDivisions => _vDivisions;
  set vDivisions(double vDivisions) {
    // assert(vDivisions > 0);
    _vDivisions = vDivisions;
    markNeedsPaint();
  }

  double _speedMin;
  double get speedMin => _speedMin;
  set speedMin(double speedMin) {
    _speedMin = speedMin;
    markNeedsPaint();
  }

  double _speedMax;
  double get speedMax => _speedMax;
  set speedMax(double speedMax) {
    _speedMax = speedMax;
    markNeedsPaint();
  }


  @override
  void performLayout() {
    super.performLayout();
    if (hSpace == null) _hSpace = size.width  / hDivisions;
    if (vSpace == null) _vSpace = size.height / vDivisions;
    // make spaces fill exacly the dimensions
    if (size.width % hSpace > 0)  hSpace = size.width  / (size.width   / hSpace).ceil();
    if (size.height % vSpace > 0) vSpace = size.height / (size.height  / vSpace).ceil();

    _hSpaceComputed = _hSpace;
    _vSpaceComputed = _vSpace;
    _initVertices();
  }

  @override
  void paint(PaintingContext context, Offset offset) {

    if (size > Size.zero) {
      // context.canvas.drawRect(offset & size, Paint()..color = color);
      Paint paint = Paint();
      Path path = Path();
      Offset v1,v2,v3,v4;

      paint.strokeWidth = strokeWidth;

      for (int y=0; y<vertices.length-1; y++) {
        for (int x=0; x<vertices[y].length-1; x++) {
          if (x>0 && y>0)
            vertices[y][x].currOffset += vertices[y][x].speed;

          // Check vertex bounduaries
          if (vertices[y][x].currOffset.dx - vertices[y][x].startOffset.dx >  _hSpaceComputed/2||
              vertices[y][x].currOffset.dx - vertices[y][x].startOffset.dx < -_hSpaceComputed/2)
            vertices[y][x].speed = Offset(-vertices[y][x].speed.dx , vertices[y][x].speed.dy);

          if (vertices[y][x].currOffset.dy - vertices[y][x].startOffset.dy >  _vSpaceComputed/2 ||
              vertices[y][x].currOffset.dy - vertices[y][x].startOffset.dy < -_vSpaceComputed/2)
            vertices[y][x].speed = Offset(vertices[y][x].speed.dx , -vertices[y][x].speed.dy);


          //    v1***v2
          //    *******
          //    *******
          //    v4***v3
          v1 = vertices[y][x].currOffset + offset;
          v2 = vertices[y][x+1].currOffset + offset;
          v3 = vertices[y+1][x+1].currOffset + offset;
          v4 = vertices[y+1][x].currOffset + offset;

          // first triangle
          path.reset();
          path.moveTo(v1.dx, v1.dy);
          path.lineTo(v2.dx, v2.dy);
          path.lineTo(v4.dx, v4.dy);
          path.close();
          paint.color = vertices[y][x].color;
          context.canvas.drawPath(path, paint);
          paint.color = lineColor;
          context.canvas.drawLine(v1, v2, paint);
          context.canvas.drawLine(v2, v4, paint);
          context.canvas.drawLine(v4, v1, paint);

          context.canvas.drawCircle(v1, circleRadius, paint);

          // second triangle
          path.reset();
          path.moveTo(v2.dx, v2.dy);
          path.lineTo(v4.dx, v4.dy);
          path.lineTo(v3.dx, v3.dy);
          path.close();
          paint.color = vertices[y][x+1].color;
          context.canvas.drawPath(path, paint);
          paint.color = lineColor;
          context.canvas.drawLine(v2, v4, paint);
          context.canvas.drawLine(v4, v3, paint);
          context.canvas.drawLine(v3, v2, paint);

        }
      }

    }

  }

  double _randomSpeed() {
    return speedMin + (math.Random().nextDouble() * (speedMax - speedMin));
  }

  double _randSign() {
    int ret = math.Random().nextInt(2)*2-1;
    return ret.toDouble();
  }

  _initVertices() {
    vertices = List(1+(size.height/_vSpaceComputed).floor());
    for (int y=0; y<vertices.length; y++) {
      vertices[y] = List(1+(size.width / _hSpaceComputed).floor());
      for (int x = 0; x < vertices[y].length; x++) {
        vertices[y][x] = Vertex();
        vertices[y][x].currOffset = Offset.zero + Offset(_hSpaceComputed * x, _vSpaceComputed * y);
        vertices[y][x].startOffset = vertices[y][x].currOffset;
        vertices[y][x].speed = Offset(
            _randomSpeed() * _randSign(),
            _randomSpeed() * _randSign());

        vertices[y][x].color = Color.lerp(
            Color.lerp(v1Color, v4Color, y.toDouble() / vertices[y].length),
            Color.lerp(v2Color, v3Color, y.toDouble() / vertices[y].length),
            x.toDouble() / vertices[y].length);
      }
    }
  }



}


class Vertex {
  Offset startOffset;
  Offset currOffset;
  Offset speed;
  Color color;
}
