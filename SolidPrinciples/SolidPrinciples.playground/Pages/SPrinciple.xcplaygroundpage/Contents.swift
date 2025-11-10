protocol PriceFormatter {
    func Format(price: Double) -> String
}

protocol PricePresenting {
    func present(price: Double, formatter: PriceFormatter) -> Void
}

protocol DiscountRule {
    func finalPrice(price: Double) -> Double
}

protocol CheckoutCoordinating {
    func coordinate(discount: DiscountRule, presenter: PricePresenting, product: Product, formatter: PriceFormatter) -> Void
}

struct Product {
    let name: String
    let price: Double
}

struct Formatter: PriceFormatter {
    func Format(price: Double) -> String{
        return "New price: \(price)"
    }
}

struct Presenter: PricePresenting {
    func present(price: Double, formatter: PriceFormatter) {
        let message = formatter.Format(price: price)
        print("\(message)")
    }
}

struct Discount: DiscountRule {
    let discount: Double
    
    func finalPrice(price: Double) -> Double {
        let discountAmount = price * (self.discount/100)
        return price - discountAmount
    }
}

struct Coordinator: CheckoutCoordinating {
    func coordinate(discount: DiscountRule, presenter: PricePresenting, product: Product, formatter: PriceFormatter) {
        let newPrice = discount.finalPrice(price: product.price)
        presenter.present(price: newPrice, formatter: formatter)
    }
}

let laptop = Product(name: "Laptop", price: 1000.0)
let discount = Discount(discount: 10)
let coordinator = Coordinator()
let formatter = Formatter()
let presenter = Presenter()

coordinator.coordinate(discount: discount, presenter: presenter, product: laptop, formatter: formatter)
