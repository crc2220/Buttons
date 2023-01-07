//
//  ContentView.swift
//  Buttons
//
//  Created by Chris Carey on 1/1/23.
//

import SwiftUI
import AVFoundation

let synthesizer = AVSpeechSynthesizer()

struct ContentView: View {

    func say(_ ball: String) -> Void{
        let utterance = AVSpeechUtterance(string: String(ball))
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5

        synthesizer.speak(utterance)
    }

    @State var BallSetB = Set<Int>()
    @State var BallSetI = Set<Int>()
    @State var BallSetN = Set<Int>()
    @State var BallSetG = Set<Int>()
    @State var BallSetO = Set<Int>()
    @State var ball = "";
    @State var BINGO = [
        "B1",
        "B2",
        "B3",
        "B4",
        "B5",
        "B6",
        "B7",
        "B8",
        "B9",
        "B10",
        "B11",
        "B12",
        "B13",
        "B14",
        "B15",
        "I16",
        "I17",
        "I18",
        "I19",
        "I20",
        "I21",
        "I22",
        "I23",
        "I24",
        "I25",
        "I26",
        "I27",
        "I28",
        "I29",
        "I30",
        "N31",
        "N32",
        "N33",
        "N34",
        "N35",
        "N36",
        "N37",
        "N38",
        "N39",
        "N40",
        "N41",
        "N42",
        "N43",
        "N44",
        "N45",
        "G46",
        "G47",
        "G48",
        "G49",
        "G50",
        "G51",
        "G52",
        "G53",
        "G54",
        "G55",
        "G56",
        "G57",
        "G58",
        "G59",
        "G60",
        "O61",
        "O62",
        "O63",
        "O64",
        "O65",
        "O66",
        "O67",
        "O68",
        "O69",
        "O70",
        "O71",
        "O72",
        "O73",
        "O74",
        "O75"
    ];
    
    func getBallNumber () -> String {

        let BALL_BAG_COUNT = BINGO.count - 1;
        let RANDOM_POSITION = Int.random(in: 0...BALL_BAG_COUNT);
        let BALL = BINGO[RANDOM_POSITION];
        BINGO.remove(at: RANDOM_POSITION)
        return BALL
    }
    
    func Column(letter: String, list: Array<Int>) -> some View{
         return VStack {
            Text(letter)
            List {
                
                ForEach(list, id: \.self) { ball in
                    Text(String(ball)).font(.caption)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 13))
                }
                
            }
        }
    }

    var body: some View {

        let sortedListB = Array(BallSetB).sorted();
        let sortedListI = Array(BallSetI).sorted();
        let sortedListN = Array(BallSetN).sorted();
        let sortedListG = Array(BallSetG).sorted();
        let sortedListO = Array(BallSetO).sorted();
        
        VStack {
            Button("PICK A BALL", action: {
                // while ball has been picked already keep trying to pick one you haven't
                if(BINGO.count != 0){
                    ball = getBallNumber();
                    let letter = ball.prefix(1);
                    print(letter)
                    let number = Int(ball.dropFirst());
                    switch letter {
                        case "B":
                            BallSetB.insert(number!)
                        case "I":
                            BallSetI.insert(number!)
                        case "N":
                            BallSetN.insert(number!)
                        case "G":
                            BallSetG.insert(number!)
                        case "O":
                            BallSetO.insert(number!)
                        default:
                            print("nope")
                    }
                    say(ball);
                }else {
                    say("there are no more balls in the bag, game finished!")
                }
                
            })
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .padding()
            .background(Color(red: 0, green: 0.5, blue: 0.0))
            .clipShape(Capsule())
            
            HStack {
                Text(ball).foregroundColor(.black).font(.title)
                Button(ball){ say(ball) }
            }
            
            Text("\(BINGO.count) balls left" ).foregroundColor(.black)
            
            HStack {
                Column(letter: "B", list: sortedListB)
                Column(letter: "I", list: sortedListI)
                Column(letter: "N", list: sortedListN)
                Column(letter: "G", list: sortedListG)
                Column(letter: "O", list: sortedListO)
            }
           
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
