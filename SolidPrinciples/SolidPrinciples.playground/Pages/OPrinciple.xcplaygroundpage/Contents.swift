
struct Package {
    let weight: Double
    let destination: String
}

protocol ShippingCalculator {
    func calculateShipping(package: Package) -> Double
}

struct SimpleShippingCalculator: ShippingCalculator {
    func calculateShipping(package: Package) -> Double {
        return 20
    }
}

struct WeightShippingCalculator: ShippingCalculator {
    func calculateShipping(package: Package) -> Double {
        return package.weight * 10
    }
}

struct InternationalShippingCalculator: ShippingCalculator {
    func calculateShipping(package: Package) -> Double {
        return package.weight * 30 + 10
    }
}

var shippings: [ShippingCalculator] = [SimpleShippingCalculator(), WeightShippingCalculator(), InternationalShippingCalculator()]

for shipping in shippings {
    let package: Package = Package(weight: 20, destination: "America")
    let value = shipping.calculateShipping(package: package)
    print("The shipping is going to: \(package.destination), and costs: \(value)")
}
