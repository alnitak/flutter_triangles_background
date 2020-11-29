# Triangles background

Animated triangles background widget with color gradients

## Getting Started

click image to see the video
[![Watch the video](https://img.youtube.com/vi/61ba6xrJYGA/maxresdefault.jpg)](https://youtu.be/61ba6xrJYGA)

## Usage

add this line to pubspec.yaml

```yaml

   dependencies:
     triangles_background: ^1.0.0

```

import package

```dart

    import 'package:triangles_background/triangles_background.dart';

```

or

```dart

    triangles_background:
        git:
          url: https://github.com/alnitak/flutter_triangles_background
          ref: master

```

simple example
```dart

Triangles(
    // number of horizontal divisions
    // hDivisions: 20,
    // vDivisions: 20,

    // height and width of triangles. Approximated to fit the widget
    hSpace: 40,
    vSpace: 40,

    // Vertex colors
    //    v1***v2
    //    *******
    //    *******
    //    v4***v3
    v1Color: Colors.red,
    v2Color: Colors.black,
    v3Color: Colors.green,
    v4Color: Colors.yellow,

    // Color of triangles strokes
    lineColor: Colors.black,

    // Stroke width
    strokeWidth: 0.3,

    // Radius of circle at vertex
    circleRadius: 2,

    // min and max speed of vertices
    speedMin: 0.1,
    speedMax: 0.5,
)

```