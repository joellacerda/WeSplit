//
//  ContentView.swift
//  WeSplit
//
//  Created by Joel Lacerda on 18/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var totalConta = 0.0
    @State private var numeroDePessoas = 2
    @State private var porcentagemServico = 10
    
    let porcentagens = [0, 5, 10, 15, 20]
    
    var totalPorPessoa: Double {
        let pessoas = Double(numeroDePessoas + 2)
        let porcentagem = Double(porcentagemServico)
        let totalServico = totalConta / 100 * porcentagem
        let total = totalConta + totalServico
        let totalDividido = total / pessoas
        
        return totalDividido
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Total da conta", value: $totalConta, format: .currency(code: Locale.current.currency?.identifier ?? "BRL"))
                        .keyboardType(.decimalPad)
                    
                    Picker("Número de pessoas", selection: $numeroDePessoas) {
                        ForEach(2..<100) {
                            Text("\($0) pessoas")
                        }
                    }
//                    .pickerStyle(.navigationLink)
                }
                
                Section("Porcentagem de serviço") {
                    Picker("Porcentagem", selection: $porcentagemServico) {
                        ForEach(porcentagens, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Total por pessoa") {
                    Text(totalPorPessoa, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
