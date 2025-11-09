//
//  Beers.swift
//  SwiftLearning
//
//  Created by Dima on 24.10.25.
//

final class BeerManager {
    
    var beerBrands: [String: Int] = [:]
    var brandsArray: [String] {
        Array(beerBrands.keys)
    }
    
    var pricesArray: [Int] {
        Array(beerBrands.values)
    }
    
    var quantityOfProduct1: Int
    var quantityOfProduct2: Int
    var quantityOfProduct3: Int
    var totalSell: Int
    var totalRevenue: Int
    var initialValueOfBeer: Int
    
    
    
    init(
        beerBrands: [String: Int] = [:],
        quantityOfProduct1: Int,
        quantityOfProduct2: Int,
        quantityOfProduct3: Int,
        totalSell: Int,
        totalRevenue: Int,
        initialValueOfBeer: Int
    ) {
        self.beerBrands = beerBrands
        self.quantityOfProduct1 = quantityOfProduct1
        self.quantityOfProduct2 = quantityOfProduct2
        self.quantityOfProduct3 = quantityOfProduct3
        self.totalSell = totalSell
        self.totalRevenue = totalRevenue
        self.initialValueOfBeer = initialValueOfBeer
        
    }
    
    func addFirstBeerBrand() {
        quantityOfProduct1 += 1
    }
    
    func addSecondBeerBrand() {
        quantityOfProduct2 += 1
    }
    
    func addThirdBeerBrand() {
        quantityOfProduct3 += 1
    }
    
    func removeFirstBeerBrand() {
        if quantityOfProduct1 > 0 {
            quantityOfProduct1 -= 1
        }
    }
    
    func removeSecondBeerBrand() {
        if quantityOfProduct2 > 0 {
            quantityOfProduct2 -= 1
        }
    }
    
    func removeThirdBeerBrand() {
        if quantityOfProduct3 > 0 {
            quantityOfProduct3 -= 1
        }
    }
    
    func calculateSellSummary() -> String {
        let result = calculateQuantity()
        
        totalSell += result.totalBottles
        totalRevenue += result.totalSum
        
        let resultText = """
        
        \(brandsArray[0]): \(quantityOfProduct1) шт. * \(pricesArray[0]) BYN за шт. = \(result.coronaTotal) BYN итого
        \(brandsArray[1]): \(quantityOfProduct2) шт. * \(pricesArray[1]) BYN за шт. = \(result.heinekenTotal) BYN итого
        \(brandsArray[2]): \(quantityOfProduct3) шт. * \(pricesArray[2]) BYN за шт. = \(result.belgianKriekTotal) BYN итого
        ИТОГО: \(result.totalSum) BYN
"""
        
        return resultText
    }
    
    func closeWork() {
        let price1 = pricesArray[0]
        let price2 = pricesArray[1]
        let price3 = pricesArray[2]
        
        let sellCount = quantityOfProduct1 + quantityOfProduct2 + quantityOfProduct3
        let revenue = quantityOfProduct1 * price1 + quantityOfProduct2 * price2 + quantityOfProduct3 * price3
        
        totalSell += sellCount
        totalRevenue += revenue
        
    }
    
    func calculateQuantity() -> (coronaTotal: Int, heinekenTotal: Int, belgianKriekTotal: Int, totalSum: Int, totalBottles: Int) {
        
        let coronaTotal = pricesArray[0] * quantityOfProduct1
        let heinekenTotal = pricesArray[1] * quantityOfProduct2
        let belgianKriekTotal = pricesArray[2] * quantityOfProduct3
        
        let totalSum = coronaTotal + heinekenTotal + belgianKriekTotal
        
        let totalBottles = quantityOfProduct1 + quantityOfProduct2 + quantityOfProduct3
        
        
        return (coronaTotal, heinekenTotal, belgianKriekTotal, totalSum, totalBottles)
        
    }
    
    func resetQuantities() {
        quantityOfProduct1 = 0
        quantityOfProduct2 = 0
        quantityOfProduct3 = 0
    }
    
    
}
