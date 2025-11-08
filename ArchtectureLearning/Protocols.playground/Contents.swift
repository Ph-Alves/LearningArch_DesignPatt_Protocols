
protocol MeuProtocolo {
    var meuAtributo: String { get set }
    var outroAtributo: Int { get }
    
    associatedtype etiqueta
    var massaDemais : etiqueta { get }
    
    func metodoPadrao() -> String
    mutating func metodoQueMuda() -> Void
    func metodoaImplementar() -> Int
}

extension MeuProtocolo {
    func metodoPadrao() -> String {
        return "Esse é um método padrão que não precisa ser implementado"
    }
}

struct MinhaStruct: MeuProtocolo {
    var meuAtributo: String = "teste"
    let outroAtributo: Int = 2
    
    typealias etiqueta = String
    var massaDemais = "Isso é uma etiqueta"
    
    mutating func metodoQueMuda() {
        meuAtributo = "Agora não é teste mais"
    }
    
    func metodoaImplementar() -> Int {
        return outroAtributo
    }
}

struct OutraStruct<T>: MeuProtocolo where T: SubElemento {
    var meuAtributo: String = "teste"
    let outroAtributo: Int = 2
    
    var mago: T
    
    typealias etiqueta = String
    var massaDemais = "Isso é uma etiqueta"
    
    func metododoMago() -> String {
        mago.SoltarElemento()
    }
    
    mutating func metodoQueMuda() {
        meuAtributo = "Agora não é teste mais"
    }
    
    func metodoaImplementar() -> Int {
        return outroAtributo
    }
}

protocol SubElemento {
    func SoltarElemento() -> String
}

struct mago : SubElemento {
    func SoltarElemento() -> String {
        return "Estou soltando todos os elementos!!"
    }
}

var structMassa = MinhaStruct()

print("\(structMassa.meuAtributo)")
print("\(structMassa.outroAtributo)")
print("\(structMassa.massaDemais)")
print("\(structMassa.metodoaImplementar())")
print("\(structMassa.metodoPadrao())")

structMassa.metodoQueMuda()

print("\(structMassa.meuAtributo)")
print("\(structMassa.metodoaImplementar())")


var oMago = mago()
var struct2 = OutraStruct(meuAtributo: "Legal", mago: oMago)

var struct3 : OutraStruct<mago> = OutraStruct(meuAtributo: "Interessante", mago: oMago)

print("\(struct2.meuAtributo), \(struct2.metododoMago())")
print("\(struct3.meuAtributo), \(struct3.metododoMago())")
