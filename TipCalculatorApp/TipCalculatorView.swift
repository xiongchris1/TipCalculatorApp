import SwiftUI

struct TipCalculatorView: View {
    @State private var billAmount: Double = 0.0
    @State private var tipPercentage: Double = 0.0
    @State private var numberOfPeople: Double = 1.0
    @State private var showResult: Bool = false
    
    // Tip total
    private var tipAmount: Double {
        return billAmount * (tipPercentage / 100)
    }
    
    // Amount per person
    private var amountPerPerson: Double {
        return numberOfPeople > 0 ? totalAmount / Double(numberOfPeople) : 0.0
    }
    
    // Total Bill
    private var totalAmount: Double {
        return (billAmount + tipAmount)
    }
    
    var body: some View {
        VStack {
            
            // Title
            
            Text("Tip Calculator")
                .fontWeight(.bold)
                .font(.largeTitle)
                .padding(.top, 350)
                .padding(.bottom, 50)
            
            Spacer()
            
            // Bill Total
            
            VStack {
                HStack{
                    Text("Bill Amount:")
                    
                    Text("\(billAmount, format: .currency(code: "USD"))")
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                }
                
                Slider(value: $billAmount, in: 0...500, step: 1)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                    .tint(.red)
                
                // Tip
                
                VStack {
                    HStack {
                        Text("Tip Percentage:")
                        
                        Text("\(Int(tipPercentage))%")
                            .foregroundColor(.green)
                    }
                    
                    Slider(value: $tipPercentage, in: 0...30)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 30)
                        .tint(.green)
                }
                
                // Num of people
                
                VStack {
                    HStack {
                        Text("Number of People:")
                        
                        Text("\(Int(numberOfPeople))")
                    }
                    
                    Slider(value: $numberOfPeople, in: 1...20, step: 1)
                        .padding(.horizontal, 20)
                    
                }
                
                Spacer()
                
                // Calculate Button
                
                Button(action: {
                    showResult.toggle()
                }) {
                    Text(showResult ? "Hide Results" : "Calculate")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 15)
                        .foregroundStyle(.white)
                        .frame(maxWidth: 300)
                        .background(showResult ? Color.red : Color.blue)
                        .cornerRadius(20)
                        .shadow(color: .black, radius: 5)
                        
                }
                .padding(.top, 50)
                
                Spacer()
                
                // Display total of tip, amount, and per person
                
                if showResult {
                    VStack(spacing: 10) {
                        HStack {
                            Text("Tip Amount:")
                            Text("\(tipAmount, format: .currency(code: "USD"))")
                                .foregroundColor(.green)
                        }
                        
                        HStack {
                            Text("Total Amount:")
                            Text("\(totalAmount, format: .currency(code: "USD"))")
                                .foregroundStyle(.red)
                        }
                        
                        Text("Amount Per Person: \(amountPerPerson, format: .currency(code: "USD"))")
                    }
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: 300)
                    .background(Color(.systemGray4))
                    .cornerRadius(20)
                    .shadow(color: .black, radius: 3)
                    
                }
                
                Spacer()
                    .padding(.bottom, 400)
            }
        }
    }
}

#Preview {
    TipCalculatorView()
}
