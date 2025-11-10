
struct Product {
    let id: Int
    let name: String
    let price: Double
}

protocol ProductFetching {
    func fetchProducts() async throws -> [Product]
}

protocol ProductCaching {
    mutating func save(_ products: [Product]) -> Void
    func load() -> [Product]?
}

protocol Logger {
    var message: String { get set }
    mutating func log(_ message: String) -> Void
}

struct Fetcher: ProductFetching {
    let products: [Product]
    
    func fetchProducts() async throws -> [Product] {
        return products
    }
}

struct Cacher: ProductCaching {
    private var storage: [Product] = []
    
    mutating func save(_ products: [Product]) {
        storage.append(contentsOf: products)
    }
    
    func load() -> [Product]? {
        return storage.isEmpty ? nil : storage
    }
}

struct Log: Logger {
    var message: String = ""
    
    mutating func log(_ message: String) {
        self.message = message
    }
}

struct ProductListUseCase {
    let fetcher: ProductFetching
    var cache: ProductCaching?
    var logger: Logger?
    
    init(fetcher: ProductFetching, cache: ProductCaching?, logger: Logger?) {
        self.fetcher = fetcher
        self.cache = cache
        self.logger = logger
    }
    
    mutating func loadProducts() async ->  [Product]{
        do {
            var products = try await fetcher.fetchProducts()
            cache?.save(products)
            var cacheProducts = cache?.load()
            logger?.log("Made it")
            return cacheProducts ?? []
        } catch {
            print("error: \(error)")
            return []
        }
    }
}

let products = [
    Product(id: 1, name: "Laptop", price: 1000),
    Product(id: 2, name: "Laptop2", price: 2000),
    Product(id: 3, name: "Iphone", price: 500),
]

Task {
    let logger = Log()
    let cache = Cacher()
    let fetcher = Fetcher(products: products)
    var list = ProductListUseCase(fetcher: fetcher, cache: cache, logger: logger)


    var anotherProducts = await list.loadProducts()
    
    for product in anotherProducts {
        print("Product: \(product.name) \(product.id) \(product.price)")
        print("Log: \(list.logger?.message ?? "There's no Log here")")
    }
}
