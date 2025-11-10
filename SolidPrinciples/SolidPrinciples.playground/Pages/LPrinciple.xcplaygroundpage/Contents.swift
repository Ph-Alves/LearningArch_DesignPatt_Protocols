
protocol Shape {
    func area() -> Double
}

struct Circle: Shape {
    var radius: Double
    func area() -> Double {
        return .pi * radius * radius
    }
}

struct Rectangle: Shape {
    var width: Double
    var height: Double
    func area() -> Double {
        return width * height
    }
}

struct Triangle: Shape {
    var base: Double
    var height: Double
    func area() -> Double {
        return 0.5 * base * height
    }
}

struct BrokenRectangle: Shape {
    var width: Double
    var height: Double
    
    func area() -> Double {
        return -1000
    }
}

var shapes: [Shape] = [
    Circle(radius: 5), Rectangle(width: 10, height: 10), BrokenRectangle(width: 20, height: 20)
]

for shape in shapes {
    print(shape.area())
}
