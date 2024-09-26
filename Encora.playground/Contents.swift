import UIKit
import Combine

struct DataModel: Decodable {
    var title: String
}

class Model {
    func apiSrevice(url: URL) -> AnyPublisher<DataModel, Error> {
        let rquest = URLRequest(url: url)
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) in
                guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                    return NSError(domain: "", code: 0) as! JSONDecoder.Input
                }
                
                return data
            }
            .receive(on: RunLoop.main)
            .decode(type: DataModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
class ViewModel: ObservableObject {
    
    @Published var data: DataModel?
    var anyCancleable = Set<AnyCancellable>()
    
    let model: Model
    init(model: Model) {
        self.model = model
    }
    
    func fetchApiData() {
        model.apiSrevice(url: URL(string: "")!)
            .sink { completion in
                
            } receiveValue: {[weak self] data in
                self?.data = data
            }
            .store(in: &anyCancleable)

    }
    
}
import SwiftUI
struct MyView: View {
    @StateObject var viewModel: ViewModel
    var body: some View {
        Button {
            viewModel.fetchApiData()
        } label: {
            Text("button")
        }
    }
}



protocol GlobalInstance {
    
}

class SuperCLass: GlobalInstance {
    
}

class InstanceCreator {
    
    var rr:[Int] = []
    private let instance: GlobalInstance
    init(instance: GlobalInstance) {
        self.instance = instance
    }
    func createInstance() -> GlobalInstance {
        self.instance
    }
}

let obj = InstanceCreator(instance: SuperCLass())
let instanceSuper = obj.createInstance()


let s = """
"A man, a plan, a cameo, Zena, Bird, Mocha, Prowel, a rave, Uganda, Wait, a lobola, Argo, Goto, Koser, Ihab, Udall, a revocation, Ebarta, Muscat, eyes, Rehm, a cession, Udella, E-boat, OAS, a mirage, IPBM, a caress, Etam, FCA, a mica, Ojai, Lebowa, Yaeger, a barge, Rab, Alsatian, a mod, Adv, a rps, Ileane, Valeta, Grenada, Hetty, Fayme, REME, HCM, Tsan, Owena, Tamar, Yompur, Isa, Nil, Lorrin, Riksdag, Mona, Ronn, O'Conner, Kirk, an okay, Nafl, Lira, Robi, Rame, FIFA, a need, Rodi, Muharram, Ober, a coma, carri, Hwang, Taos, Salado, Olfe, Camag, Kdar, a hdkf, Jemina, Nadler, Ehud, Rutan, a baster, Ebn, aedegi, a gals, Ira, Tepper, a minim, a gowd, Ulda, Ogawa, TSgt, Callida, Rodl, Ewart, seraphs, Ain, Newgate, Vaden, navettes, Sabah, Swat, Luci, Pam, Arda, pools, a boar, Akira, Gally, CSC, Avalon, a tuba, AAM, Artima, AFB, Selah, wellies, Ronald, BArch, nullos, Uni, an aet, Nadabus, Tyree, Poop, Sennar, CAB, a nanny, Let, Efahan, Dasya, Moon, Ikaria, Nam, Lamar, Egor, Rover, Tanana, Loki, MIP, PharD, endia, rates, Punan, Eba, Alva, Paine, BEF, Fagan, nugae, taws, Una, Woll, a tab, CSE, Kamerad, YCL, a melt, Diehl, Lewellen, Sacci, Reggi, RFA, BSA, naoi, Kuyp, Oceanic, Sipple, Yalu, Kosey, nota, talers, Frida, a wab, Musset, Aoede, Erick, a reign, Attica, Marge, Leta, Mat, Naboth, Saphra, Gila, Arany, Costa, Fasta, Mabel, Udine, Derte, Medill, Erotes, RuPaul, Uzzi, Waler, Omak, a kaif, Freed, a doc, a marga, Nilla, Dole, USPO, Ogata, tubas, somata, Dash, Danika, Salida, Fiji, Emili, Kazak, Oder, CAC, Ilocanos, Nudd, Uda, Susette, Diskin, Numitor, Munn!"
"""
func isPalindrome(_ s: String) -> Bool {
    var left = 0
    var right = s.count - 1
    var newS = s.lowercased()
    while left < right {
        let leftChar = newS[newS.index(newS.startIndex, offsetBy: left)]
        let rightChar = newS[newS.index(newS.startIndex, offsetBy: right)]
        if !leftChar.isLetter && !rightChar.isLetter {
            left += 1
            right -= 1
        } else if !leftChar.isLetter {
            left += 1
        } else if !rightChar.isLetter {
            right -= 1
        } else {
            if leftChar != rightChar {
                return false
            }
            left += 1
            right -= 1
        }
        
    }
    return true
}
print(isPalindrome(s))

/*
 
 n = 5
 *****   i = 1 , j = 1
    *    i = 2 , j = 2 ,
   *
  *
 *****
  */

func showPatternZ(n: Int) {
    
    for i in 1...n {
        for j in 1...n {
            if i == 1 || i == n {
                print("*")
            } else if j == n - i {
                print("*")
            } else {
                print(" ")
            }
        }
    }
}

print(showPatternZ(n: 5))
