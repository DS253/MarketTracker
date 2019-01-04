import Foundation

extension Double
{
    static func priceToString(number: Double) -> String
    {
        let fiatSymbol = "$"
        switch true {
        case number > 100.0:
            return fiatSymbol + String(format: DigitFormat.Two, number)
        case number > 10.0:
            return fiatSymbol + String(format: DigitFormat.Three, number)
        case number < 1.0:
            let smallNumber = String(format: DigitFormat.Four, number)
            return fiatSymbol + String(smallNumber.dropFirst())
        default:
            return fiatSymbol + String(format: DigitFormat.Four, number)
        }
    }
    
    static func percentageToString(number: Double) -> String
    {
        let percentSymbol = "%"
        switch true {
        case number > 1000.0:
            return String(format: DigitFormat.Two, number) + percentSymbol
        case number > 100.0:
            return String(format: DigitFormat.Three, number) + percentSymbol
            
        // When the percentage change is less than 1, remove the leading zero
        case (number < 1 && number > 0):
            let smallPercent = String(format: DigitFormat.Four, number)
            let withoutZero = String(smallPercent.dropFirst())
            return withoutZero + percentSymbol
            
        case (number < 0 && number > -1):
            let smallPercent = String(format: DigitFormat.Four, number)
            let removeNegativeSymbol = String(smallPercent.dropFirst())
            let removedLeadingZero = String(removeNegativeSymbol.dropFirst())
            return "-" + removedLeadingZero + percentSymbol
            
        default:
            return String(format: DigitFormat.Four, number) + percentSymbol
        }
    }
}
