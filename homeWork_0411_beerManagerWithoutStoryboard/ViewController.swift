import UIKit

class ViewController: UIViewController {
    
    
    
    var beers = BeerManager(
        beerBrands: [
            "Corona Extra": 6,
            "Heineken": 8,
            "Belgian Kriek": 10
        ],
        quantityOfProduct1: 0,
        quantityOfProduct2: 0,
        quantityOfProduct3: 0,
        totalSell: 0,
        totalRevenue: 0,
        initialValueOfBeer: 100
    )
    
    
    private let mainViewCounter1 = UILabel()
    private let mainViewCounter2 = UILabel()
    private let mainViewCounter3 = UILabel()
    
    
    private let labelBeerName1 = UILabel()
    private let labelBeerName2 = UILabel()
    private let labelBeerName3 = UILabel()
    
    
    private let counterQuantity1 = UILabel()
    private let counterQuantity2 = UILabel()
    private let counterQuantity3 = UILabel()
    
    
    private let buttonAdd1 = UIButton(type: .system)
    private let buttonAdd2 = UIButton(type: .system)
    private let buttonAdd3 = UIButton(type: .system)
    
    
    private let buttonRemove1 = UIButton(type: .system)
    private let buttonRemove2 = UIButton(type: .system)
    private let buttonRemove3 = UIButton(type: .system)
    
    
    private let resultLabel = UILabel()
    
    
    private let viewActionButtons = UIView()
    
    
    private let buttonOpen = UIButton(type: .system)
    private let buttonClose = UIButton(type: .system)
    private let buttonSell = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupLabels()
        setupButtons()
        setupLayout()
        setInitialState()
        
    }
    
    func validationOfQuantityForSell() {
        self.buttonSell.isEnabled =
        (1...100).contains(beers.quantityOfProduct1)
        || (1...100).contains(beers.quantityOfProduct2)
        || (1...100).contains(beers.quantityOfProduct3)
        
        self.buttonAdd1.isEnabled = beers.quantityOfProduct1 < beers.initialValueOfBeer
        self.buttonAdd2.isEnabled = beers.quantityOfProduct1 < beers.initialValueOfBeer
        self.buttonAdd3.isEnabled = beers.quantityOfProduct1 < beers.initialValueOfBeer
    }
    
    func setupLabels() {
        
        labelBeerName1.text = "Corona Extra"
        labelBeerName2.text = "Heineken"
        labelBeerName3.text = "Belgian Kriek"
        
        [labelBeerName1, labelBeerName2, labelBeerName3].forEach {
            $0.textAlignment = .center
            view.addSubview($0)
        }
        
        [counterQuantity1, counterQuantity2, counterQuantity3].forEach {
            $0.text = "0"
            $0.textAlignment = .center
            view.addSubview($0)
        }
        
        resultLabel.frame = CGRect(x: 20, y: 580, width: 350, height: 120)
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 0
        resultLabel.isHidden = true
        view.addSubview(resultLabel)
        
    }
    
    func setupButtons() {
        
        [buttonAdd1, buttonAdd2, buttonAdd3].forEach {
            $0.setTitle("+", for: .normal)
        }
        
        [buttonRemove1, buttonRemove2, buttonRemove3].forEach {
            $0.setTitle("-", for: .normal)
        }
        
        [buttonAdd1, buttonAdd2, buttonAdd3, buttonRemove1, buttonRemove2, buttonRemove3].forEach {
            view.addSubview($0)
        }
        
        buttonAdd1.addTarget(self, action: #selector(add1), for: .touchUpInside)
        buttonAdd2.addTarget(self, action: #selector(add2), for: .touchUpInside)
        buttonAdd3.addTarget(self, action: #selector(add3), for: .touchUpInside)
        
        buttonRemove1.addTarget(self, action: #selector(rem1), for: .touchUpInside)
        buttonRemove2.addTarget(self, action: #selector(rem2), for: .touchUpInside)
        buttonRemove3.addTarget(self, action: #selector(rem3), for: .touchUpInside)
        
        
        buttonOpen.setTitle("Open", for: .normal)
        buttonClose.setTitle("Close", for: .normal)
        buttonSell.setTitle("Sell", for: .normal)
        
        buttonOpen.addTarget(self, action: #selector(openShop), for: .touchUpInside)
        buttonClose.addTarget(self, action: #selector(closeShop), for: .touchUpInside)
        buttonSell.addTarget(self, action: #selector(sellAll), for: .touchUpInside)
        
        [buttonOpen, buttonClose, buttonSell].forEach {
            view.addSubview($0)
        }
    }
    
    func setupLayout() {
        
        labelBeerName1.frame = CGRect(x: 20, y: 260, width: 200, height: 30)
        counterQuantity1.frame = CGRect(x: 230, y: 260, width: 40, height: 30)
        buttonAdd1.frame = CGRect(x: 280, y: 260, width: 30, height: 30)
        buttonRemove1.frame = CGRect(x: 320, y: 260, width: 30, height: 30)
        
        labelBeerName2.frame = CGRect(x: 20, y: 320, width: 200, height: 30)
        counterQuantity2.frame = CGRect(x: 230, y: 320, width: 40, height: 30)
        buttonAdd2.frame = CGRect(x: 280, y: 320, width: 30, height: 30)
        buttonRemove2.frame = CGRect(x: 320, y: 320, width: 30, height: 30)
        
        labelBeerName3.frame = CGRect(x: 20, y: 380, width: 200, height: 30)
        counterQuantity3.frame = CGRect(x: 230, y: 380, width: 40, height: 30)
        buttonAdd3.frame = CGRect(x: 280, y: 380, width: 30, height: 30)
        buttonRemove3.frame = CGRect(x: 320, y: 380, width: 30, height: 30)
        
        buttonOpen.frame = CGRect(x: 20, y: 450, width: 100, height: 40)
        buttonClose.frame = CGRect(x: 130, y: 450, width: 100, height: 40)
        buttonSell.frame = CGRect(x: 240, y: 450, width: 100, height: 40)
    }
    
    func setInitialState() {
        [buttonAdd1, buttonAdd2, buttonAdd3, buttonRemove1, buttonRemove2, buttonRemove3, buttonClose, buttonSell].forEach {
            $0.isEnabled = false
        }
    }
    
    @objc func add1() { beers.addFirstBeerBrand(); counterQuantity1.text = "\(beers.quantityOfProduct1)"; validationOfQuantityForSell() }
    @objc func rem1() { beers.removeFirstBeerBrand(); counterQuantity1.text = "\(beers.quantityOfProduct1)"; validationOfQuantityForSell() }
    
    @objc func add2() { beers.addSecondBeerBrand(); counterQuantity2.text = "\(beers.quantityOfProduct2)"; validationOfQuantityForSell() }
    @objc func rem2() { beers.removeSecondBeerBrand(); counterQuantity2.text = "\(beers.quantityOfProduct2)"; validationOfQuantityForSell() }
    
    @objc func add3() { beers.addThirdBeerBrand(); counterQuantity3.text = "\(beers.quantityOfProduct3)"; validationOfQuantityForSell() }
    @objc func rem3() { beers.removeThirdBeerBrand(); counterQuantity3.text = "\(beers.quantityOfProduct3)"; validationOfQuantityForSell() }
    
    @objc func openShop() {
        [buttonAdd1, buttonAdd2, buttonAdd3, buttonRemove1, buttonRemove2, buttonRemove3, buttonClose].forEach { $0.isEnabled = true }
        buttonOpen.isEnabled = false
        buttonSell.isEnabled = true
        resultLabel.isHidden = true
    }
    
    @objc func closeShop() {
        buttonOpen.isEnabled = true
        [buttonAdd1, buttonAdd2, buttonAdd3, buttonRemove1, buttonRemove2, buttonRemove3, buttonClose].forEach { $0.isEnabled = false }
        
        resultLabel.text = """
        
        Итоги продаж за смену:

        Всего бутылок продано: \(beers.totalSell) шт.
        Общая выручка: \(beers.totalRevenue) BYN
"""
        resultLabel.isHidden = false
    }
    
    @objc func sellAll() {
        
        resultLabel.text = beers.calculateSellSummary()
        resultLabel.isHidden = false
        counterQuantity1.text = "0"
        counterQuantity2.text = "0"
        counterQuantity3.text = "0"
        beers.resetQuantities()
        
    }
}
