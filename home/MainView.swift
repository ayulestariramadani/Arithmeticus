//
//  MainView.swift
//  home
//
//  Created by Ayu Lestari Ramadani on 14/04/23.
//

import SwiftUI

struct MainView: View {
    @State private var restart: Bool = false
    
    @State private var level: Int = 1
    @State private var score: Int = 0
    @State private var lives: Int = 3
    
    @State private var answer: String = ""
    @State private var answerMinus: Bool = false
    @State private var correctAnswer: Bool = false
    @State private var wrongAnswer: Bool = false
    
    @State private var hintCounter: Int = 0
    @State private var hintValue: Int = 10
    @State private var hintAlert: Bool = false
    
    @State private var timeWarning: Bool = false
    @State private var timesUp: Bool = false
    @State private var time: Double = 0.0
    @State private var timePercentage: Double = 120 //120-615'=
    
    @Binding var skipped : Bool
    
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    @State private var counter: Double = 0
    
    @State private var aritmatikus: Bool = false
    @State private var earth: Bool = false
    
    let numbers0 = "1234567890"
    let numbers = "123456789"
    let operators = "+-×"
    let simpleOperators = "+-"
    @State private var operatorsAmount: Int = 0
    @State private var questions : [String] = []
    
    @State private var coloredQuestion = ""
    @State private var coloredQuestions : [String] = []
    @State private var leveledOperator : [String] = []
    
    
    @State private var question = ""
    @State private var operand = 0
    @State private var digit = 0
    
    let buttons = [
            ["1", "4", "7"],
            ["2", "5", "8"],
            ["3", "6", "9"],
            ["+", "0", "x"],
            ["="]
        ]
    
    func compliment (counter: Double) -> String {
        if 0.0..<3.0 ~= counter {
            return "Perfect!"
        } else if 3.0..<5.0 ~= counter {
            return "Amazing!"
        } else if 5.0..<8.0 ~= counter {
            return "Great Job!"
        } else if 8.0..<12.0 ~= counter {
            return "Nice Work!"
        } else if 12.0..<20.0 ~= counter {
            return "Good Effort!"
        } else if 20.0..<35.0 ~= counter {
            return "Not Bad!"
        } else if 35.0..<60.1 ~= counter {
            return "Nice Try!"
        }else {
            return "Improve More!"
        }
    }
    
    func questionGenerating() {
        if 25..<100 ~= level{
            operand+=5
        } else if 15..<25 ~= level{
            operand+=4
        } else if 5..<15 ~= level{
            operand+=3
        } else if 0..<5 ~= level{
            operand+=2
        } else {
            operand+=6
        }
        if 250..<1000 ~= level{
            digit+=4
        } else if 100..<250 ~= level{
            digit+=3
        } else if 25..<100 ~= level{
            digit+=2
        } else if 0..<25 ~= level{
            digit+=1
        } else {
            digit+=5
        }
        
        timeGenerating()
        
        var opr = operand
        var dig = Int.random(in: 1...digit)
        var digiterate = dig
        while opr>0 {
            //question+="(\(digit))(\(operand))"
            dig = Int.random(in: 1...digit)
            digiterate = dig
            if opr>1&&level>5 {
                if 1 == Int.random(in: 1...5){
                    question+=divisibleProblem(dividedBy: Int.random(in: 1...9), digitEnd: digitEnd(digit: dig))
                    opr-=2
                    dig=0
                    if opr >= 0 {
                        question+=String(operators.randomElement() ?? "?")
                    }
                }
            }
            if (opr>1&&level>5)&&opr<operand {
                if 1 == Int.random(in: 1...3){
                    question+=brecketsProblem(digitEnd: digitEnd(digit: dig))
                    opr-=2
                    dig=0
                    if opr >= 0 {
                        question+=String(operators.randomElement() ?? "?")
                    }
                }
            }
            if (opr>2&&level>5)&&opr<operand {
                if 1 == Int.random(in: 1...3){
                    question+=brecketsProblems(digitEnd: digitEnd(digit: dig))
                    opr-=3
                    dig=0
                    if opr >= 0 {
                        question+=String(operators.randomElement() ?? "?")
                    }
                }
            }
            while digiterate>0 {
                if digiterate == dig{
                    question+=String(numbers.randomElement() ?? "?")
                } else {
                    question+=String(numbers0.randomElement() ?? "?")
                }
                digiterate-=1
            }
            if opr>1 {
                if(level<5){
                    question+=String(simpleOperators.randomElement() ?? "?")
                } else {
                    question+=String(operators.randomElement() ?? "?")
                }
            }
            opr-=1
        }
        questionAdditing(question: question)
    }

    func digitEnd(digit: Int) -> Int{
        switch digit{
            case 0: return 9
            case 1: return 9
            case 2: return 99
            case 3: return 999
            case 4: return 9999
            default: return 99999
        }
    }

    func brecketsProblem(digitEnd: Int) -> String {
        let number1 = Int.random(in: 1...digitEnd)
        let number2 = Int.random(in: 1...number1)
        var question = "("
        question += String(number1)+String(simpleOperators.randomElement() ?? "?")+String(number2)
        return question+")"
    }

    func brecketsProblems(digitEnd: Int) -> String {
        let number1 = Int.random(in: 1...digitEnd)
        let number2 = Int.random(in: 1...number1)
        let number3 = Int.random(in: 1...number2)
        var question = "("+String(digitEnd)
        if 1 == Int.random(in: 0...1){
            question += String(number1)+"+"+String(number2)+"-"+String(number3)
        } else {
            question += String(number1)+"-"+String(number2)+"+"+String(number3)
        }
        return question+")"
    }

    func divisibleProblem(dividedBy: Int, digitEnd: Int) -> String {
        var number = Int.random(in: 1...digitEnd)
        while number % dividedBy != 0 {
            number = Int.random(in: 1...digitEnd)
        }
        return String(number)+"÷"+String(dividedBy)
    }

    func questionAdditing(question: String){
        questions.append(question)
    }
    func questionUpdating(coloredOperator: String){
        var questionEdited = self.coloredQuestion
        questionEdited = questionEdited.replacingOccurrences(of: "+", with: " + ")
        questionEdited = questionEdited.replacingOccurrences(of: "-", with: " - ")
        questionEdited = questionEdited.replacingOccurrences(of: "×", with: " * ")
        questionEdited = questionEdited.replacingOccurrences(of: "÷", with: " / ")
        questionEdited = questionEdited.replacingOccurrences(of: "(", with: " ( ")
        questionEdited = questionEdited.replacingOccurrences(of: ")", with: " ) ")
        var tokens = questionEdited.split(separator: " ").map { String($0) }
        for token in tokens{
            if coloredOperator == token {
                let index = tokens.firstIndex(of: token) ?? 0
                if token == "*" {
                    tokens[index] = "×"
                } else if token == "/" {
                    tokens[index] = "÷"
                }
                leveledOperator.append(tokens[index])
//                print(leveledOperator)
                tokens[index] = "leveledOperator["+String(hintCounter-1)+"]"
//                print(tokens)
                self.coloredQuestion = tokens.joined(separator: " ")
//                print(self.coloredQuestion)
                splitingQuestion(coloredQuestion: self.coloredQuestion)
                break
            }
        }
        
    }
    
    func splitingQuestion(coloredQuestion: String){
        self.coloredQuestions = coloredQuestion.split(separator: " ").map { String($0) }
    }

    func timeGenerating(){
        time  = 10.0 - Double(level)*0.01
        time  = time - Double(operand)*0.01
        if time<0.5{
            time = 0.5
        }
    }

    func validation(question: String){
        self.question = self.question.replacingOccurrences(of: "+", with: " + ")
        self.question = self.question.replacingOccurrences(of: "-", with: " - ")
        self.question = self.question.replacingOccurrences(of: "×", with: " * ")
        self.question = self.question.replacingOccurrences(of: "÷", with: " / ")
        self.question = self.question.replacingOccurrences(of: "(", with: " ( ")
        self.question = self.question.replacingOccurrences(of: ")", with: " ) ")
        
        let expression = NSExpression(format: self.question)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            if Int(answer) == result {
                validationSucceed()
            } else {
                validationFailed()
            }
        }
    }
    
    func validationSucceed(){
        level += 1
        score += 20 - Int(counter)
        answer = ""
        answerMinus = false
        hintCounter = 0
        hintAlert = false
        timeWarning = false
        timesUp = false
        timePercentage = 120
        counter = 0
        operatorsAmount = 0
        questions = []
        coloredQuestion = ""
        coloredQuestions = []
        leveledOperator = []
        question = ""
        operand = 0
        digit = 0
        timesUp = false
        timeWarning = false
        
        withAnimation(.spring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.5)){
            correctAnswer.toggle()
        }
        questionGenerating()
        coloredQuestion = self.questions.last ?? "error"
        
        withAnimation(.easeIn(duration: (495/time)*0.2)){
            timeWarning.toggle()
        }
        withAnimation(.linear(duration: 0.2).delay((495/time)*0.2)) {
            timesUp.toggle()
        }
        withAnimation(.easeInOut(duration: 0.2).delay(1)){
            correctAnswer.toggle()
        }
    }
    
    func validationFailed(){
        lives-=1
        withAnimation(.spring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.5)){
            wrongAnswer.toggle()
        }
        withAnimation(.easeInOut(duration: 0.3).delay(0.3)){
            wrongAnswer.toggle()
        }
    }
    
    func hintTapped(){
        var infix = questions.last ?? "?"
        infix = infix.replacingOccurrences(of: "+", with: " + ")
        infix = infix.replacingOccurrences(of: "-", with: " - ")
        infix = infix.replacingOccurrences(of: "×", with: " * ")
        infix = infix.replacingOccurrences(of: "÷", with: " / ")
        infix = infix.replacingOccurrences(of: "(", with: " ( ")
        infix = infix.replacingOccurrences(of: ")", with: " ) ")
        let postfix = infixToPostfix(infix)
        let tokens = postfix.split(separator: " ").map { String($0) }
        operated(tokens: tokens)
    }
    
    func operated(tokens: [String]){
        var index = 0
        let operators = "+-*/"
        var expression = ""
        var questionLast = self.questions.last
//        let questionReplace = questionLast
        for token in tokens {
            if operators.contains(token){
                index = tokens.firstIndex(of: token) ?? 0
                expression += tokens[index-2] + tokens[index] + tokens[index-1]
                let nsexpression = NSExpression(format: expression)
//                print(questionLast ?? "error")
//                print(index)
//                print(tokens)
//                print(token)
//                print(expression)
//                print(nsexpression)
                if let result = nsexpression.expressionValue(with: nil, context: nil) as? Int {
//                    print(result)
//                    print(result)
//                    print(expression)
                    expression = expression.replacingOccurrences(of: "*", with: "×")
                    expression = expression.replacingOccurrences(of: "/", with: "÷")
//                    print(expression)
                    let brecketsCheck = "("+expression+")"
//                    var questionAdd = ""
//                    print(brecketsCheck)
                    questionLast = questionLast?.replacingOccurrences(of: brecketsCheck, with: String(result)) ?? "1+1"
//                    print(questionLast ?? "error" )
                    questionLast = questionLast?.replacingOccurrences(of: expression, with: String(result)) ?? "1+1"
//                    print(questionLast ?? "error" )
                    questionAdditing(question: questionLast ?? "error")
                    hintCounter+=1
                    questionUpdating(coloredOperator: token)
                }
                break
            }
        }
    }
    
    func buttonTapped(button: String) {
        if button == "x" {
            answer = ""
        } else if button == "+" {
            if answer.contains("-") {
                answer =  answer.replacingOccurrences(of: "-", with: "")
            } else {
                answer = "-" + answer
            }
            answerMinus.toggle()
        } else if button == "="{
            validation(question: questions.last ?? "1-1")
        }else{
            answer += button
        }
    }
    
    func buttonHeight(button: String) -> CGFloat {
        if button == "="{
            return (UIScreen.main.bounds.width - 180)
        }
        return (UIScreen.main.bounds.width - 5 * 12) / 5
    }

    func buttonWidth() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 5
    }

    func buttonBackgroundColor(button: String) -> Color {
        switch button {
        case "+", "x":
            return Color("main color")
        case "=" :
            return Color("complementary color")
        default:
            return Color("secondary color")
        }
    }
    var body: some View {
        VStack {
            HStack{
                Text("Level \(level)")
                    .font(.system(.title, design: .monospaced))
                    .fontWeight(.black)
                    .lineLimit(nil).foregroundColor(Color("main color"))
                Spacer()
                HStack(spacing: -2.0){
                    Image(systemName: "bolt.fill").font(.title).foregroundColor( lives>2 ? Color("complementary color") : Color("tertiary color"))
                    Image(systemName: "bolt.fill").font(.title).foregroundColor( lives>1 ? Color("complementary color") : Color("tertiary color"))
                    Image(systemName: "bolt.fill").font(.title).foregroundColor( lives>0 ? Color("complementary color") : Color("tertiary color"))
//                    ForEach(lives...3, id: \.self){_ in
//                        Image(systemName: "bolt.fill").font(.title).foregroundColor(Color("tertiary color"))
//                    }
//                    ForEach(1...lives, id: \.self){_ in
//                        Image(systemName: "bolt.fill").font(.title).foregroundColor(Color("complementary color"))
//                    }
                }
            }
            .padding(.horizontal)
            .frame(width: 380.0, height: 25.0)
            HStack{
                Button(action: {
                    //
                }) {
                    Image(systemName: "chevron.left").font(.title2)
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.white)
                        .background(Color("main color"))
                        .clipShape(Circle())
                }
                if restart {
                    
                }
                Spacer()
                Text("\(score)")
                    .font(.system(.title2, design: .monospaced))
                    .fontWeight(.bold)
                
                Spacer()
                Button(action: {
                    if operand > 2 && score-hintValue>=0 {
                        score-=hintValue
                        hintTapped()
                        operand-=1
                    } else {
                        hintAlert.toggle()
                    }
                    
                }) {
                    Image(systemName: "questionmark").font(.title2)
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color("tertiary color"))
                        .background(Color("main color"))
                        .clipShape(Circle())
                }.alert(isPresented: $hintAlert) {
                    Alert(title: Text("Hint Unavailable"), message: operand>2 ? Text("Your score is insufficient") : Text("Question too simple") , dismissButton: .default(Text("OK")))
                }
            }
            .padding(.all, 8.0)
            .frame(width: 350.0, height: 60.0)
            .background(Color("tertiary color"))
            .clipShape(RoundedRectangle(cornerRadius: 50.0))
            
//            HStack{
//                Text("\(score)")
//                    .font(.system(.title2, design: .monospaced))
//                    .fontWeight(.bold)
//            }
//            .padding(.all, 8.0)
//            .frame(width: 350.0, height: 60.0)
//            .background(Color("tertiary color"))
//            .clipShape(RoundedRectangle(cornerRadius: 50.0))
            ZStack{
                
                ScrollView{
                    VStack{
                        List{
                            ForEach(questions, id: \.self){ question in
                                HStack {
                                    Spacer()
                                    Text(question+"=?")
                                }
                            }.font(.system(.title, design: .monospaced))
                                .fontWeight(.medium).foregroundColor(Color("main color"))
                        }.frame(maxHeight: .infinity)
                    }.frame(width: 350.0, height: 300.0)
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
                }
                HStack{
                    ForEach(coloredQuestions, id: \.self){ question in
                        switch question{
                        case "leveledOperator[0]" :  Text("\(leveledOperator[0])").font(.system(.title2, design: .monospaced))
                                .fontWeight(.medium).foregroundColor(Color("level 1"))
                        case "leveledOperator[1]" :  Text("\(leveledOperator[1])").font(.system(.title2, design: .monospaced))
                                .fontWeight(.medium).foregroundColor(Color("level 2"))
                        case "leveledOperator[2]" :  Text("\(leveledOperator[2])").font(.system(.title2, design: .monospaced))
                                .fontWeight(.medium).foregroundColor(Color("level 3"))
                        case "leveledOperator[3]" :  Text("\(leveledOperator[3])").font(.system(.title2, design: .monospaced))
                                .fontWeight(.medium).foregroundColor(Color("level 4"))
                        case "leveledOperator[4]" :  Text("\(leveledOperator[4])").font(.system(.title2, design: .monospaced))
                                .fontWeight(.medium).foregroundColor(Color("level 5"))
                        case "leveledOperator[5]" :  Text("\(leveledOperator[5])").font(.system(.title2, design: .monospaced))
                                .fontWeight(.medium).foregroundColor(Color("level 6"))
                        case "leveledOperator[6]" :  Text("\(leveledOperator[6])").font(.system(.title2, design: .monospaced))
                                .fontWeight(.medium).foregroundColor(Color("level 7"))
                        case "(",")","+","-","×","÷" :  Text("\(question)").font(.system(.title2, design: .monospaced))
                                .fontWeight(.medium).foregroundColor(Color("secondary color"))
                        default:
                            Text("•").font(.system(.title2, design: .monospaced))
                                    .fontWeight(.medium).foregroundColor(Color("main color"))
                        }
                        
                    }
                }.position(x: 200,y: 19)
                Text("\(Image(systemName: "moonphase.waxing.gibbous.inverse")) Arithmeticus").font(.system(.title3, design: .monospaced)).fontWeight(.semibold).foregroundColor(Color.white).padding(.all, 7.0).background(Color("complementary color")).clipShape(RoundedRectangle(cornerRadius: 50.0)).offset(x: -75 ,y: aritmatikus ? 130 : 190)
                Text(compliment(counter: self.counter)).font(.system(.title3, design: .monospaced)).fontWeight(.black).foregroundColor(Color.white).padding(.all, 15.0).background(Color("secondary color")).clipShape(RoundedRectangle(cornerRadius: 50.0)).offset(x: 0,y: correctAnswer ? 100 : 190)
                Text("Earth \(Image(systemName: "globe.asia.australia.fill"))").font(.system(.title3, design: .monospaced)).fontWeight(.semibold).foregroundColor(Color.white).padding(.all, 7.0).background(Color("main color")).clipShape(RoundedRectangle(cornerRadius: 50.0)).offset(x: 118,y: earth ? 130 : 190)
            }
            HStack{
                ZStack{
                    HStack{
                        Button(action: {
                            //
                        }) {
                            Image(systemName: "airplane").font(.title2)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("tertiary color"))
                                .background(Color("main color"))
                                .clipShape(Circle())
                        }
                    }
                    .padding(.all, 8.0)
                    .frame(width: CGFloat(timePercentage), height: 60.0, alignment: .trailing)
                    .background(timeWarning ?
//                                Color.red
                                Color("main color")
                                : Color("complementary color"))
                    .clipShape(RoundedRectangle(cornerRadius: 50.0))
                    .position(x:35, y:22)
                    Button(action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.5)){
                            aritmatikus.toggle()
                        }
//                        if(lives>0){
//                            lives-=1
//                        }
//                        if(timePercentage<=120){
//                            timePercentage=120
//                        } else if(timePercentage>615){
//                            timePercentage=615
//                        } else {
//                            timePercentage-=5
//                        }
                    }) {
                        Image(systemName: "moonphase.waxing.gibbous.inverse").font(.title2)
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.white)
                            .background(Color("main color"))
                            .clipShape(Circle())
                            .position(x: 20, y: 22)
                    }
                    //if(timesUp){
                        Text("Times Up!").font(.system(.title, design: .monospaced)).fontWeight(.heavy).foregroundColor(Color.white).position(x: 170, y: 20).opacity(timesUp ? 1 : 0)
                    //}
                }
                Spacer()
                Button(action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.5)){
                        earth.toggle()
                    }
//                    if(lives==0){
//                        lives=3
//                    } else if(lives>=3){
//                        lives=3
//                    } else {
//                        lives+=1
//                    }
//                    if(timePercentage<120){
//                        timePercentage=120
//                    } else if(timePercentage>=615){
//                        timePercentage=615
//                    } else {
//                        timePercentage+=5
//                    }
                }) {
                    Image(systemName: "globe.asia.australia.fill").font(.title2)
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.white)
                        .background(Color("main color"))
                        .clipShape(Circle())
                }
            }
            .padding(.all, 8.0)
            .frame(width: 350.0, height: 60.0)
            .background(Color("tertiary color"))
            .clipShape(RoundedRectangle(cornerRadius: 50.0))
            
            TextField(
                "Answer",
                text: $answer
            ).keyboardType(.numberPad).disabled(true)
                .multilineTextAlignment(.center)
            .disableAutocorrection(true)
            .frame(width: 350.0, height: 60.0).overlay(RoundedRectangle(cornerRadius: 15).stroke(wrongAnswer ? Color.red: correctAnswer ? Color.green : Color("main color"), lineWidth: 5))
              .font(.system(.title, design: .monospaced))
              .fontWeight(.heavy)
              .lineLimit(nil).foregroundColor(Color("main color"))
              
            ZStack{
                HStack(spacing: 5) {
                    ForEach(buttons, id: \.self) { row in
                        VStack(spacing: 5) {
                            ForEach(row, id: \.self) { button in
                                Button(action: {
                                    self.buttonTapped(button: button)
                                }) {
                                    switch button{
                                    case "+":
                                        Text("\(Image(systemName: "plus.forwardslash.minus"))")
                                            .font(.system(.title, design: .monospaced))
                                            .fontWeight(.heavy)
                                            .frame(width: self.buttonWidth(),
                                                   height: self.buttonHeight(button: button))
                                            .background(self.buttonBackgroundColor(button: button))
                                            .foregroundColor(.white)
                                            .cornerRadius(15)
                                    case "x":
                                        Text("\(Image(systemName: "delete.left.fill"))")
                                            .font(.system(.title, design: .monospaced))
                                            .fontWeight(.heavy)
                                            .frame(width: self.buttonWidth(),
                                                   height: self.buttonHeight(button: button))
                                            .background(self.buttonBackgroundColor(button: button))
                                            .foregroundColor(.white)
                                            .cornerRadius(15)
                                    default:
                                        Text(button)
                                            .font(.system(.title, design: .monospaced))
                                            .fontWeight(.heavy)
                                            .frame(width: self.buttonWidth(),
                                                   height: self.buttonHeight(button: button))
                                            .background(self.buttonBackgroundColor(button: button))
                                            .foregroundColor(.white)
                                            .cornerRadius(15)
                                    }
                                }
                            }
//                            Button(action: {
//                                self.buttonTapped(button: "=")
//                            }){Text("=")
//                                    .font(.system(.title, design: .monospaced))
//                                    .fontWeight(.heavy)
//                                    .frame(width: self.buttonWidth(),
//                                           height: self.buttonHeight())
//                                    .background(Color("complementary color"))
//                                    .foregroundColor(.white)
//                                    .cornerRadius(15)
//                            }
                        }
                    }
                }
                .padding(.horizontal)
//                Button(action: {
//                    self.buttonTapped(button: "=")
//                })
//                {
//                    Text("=")
//                        .font(.system(.title, design: .monospaced))
//                        .fontWeight(.heavy)
//                        .frame(width: self.buttonWidth(),
//                               height: UIScreen.main.bounds.width - 182)
//                        .background(Color("complementary color"))
//                        .foregroundColor(.white)
//                        .cornerRadius(15)
//                        .offset(x: 142, y: 0)
//                }
            }
             
        }
        .onReceive(timer) { input in
            if !skipped  {
//                print("Hello")
                self.counter += 0.2
                withAnimation {
                    if 120..<616-time ~= timePercentage {
    //                    if correctAnswer {
                            timePercentage+=time
    //                    } else {
    //                        timePercentage-=5
    //                    }
                    }
                }
                if timePercentage > 616 {
                    timePercentage = 120
                    if lives > 1 {
                        lives -= 1
                    } else {
                        //
                    }
                }
    //            if 500..<615 ~= timePercentage {
    //                withAnimation {
    //                    timeWarning.toggle()
    //                }
    //            }
            }
        }
        .onAppear{
            questionGenerating()
            coloredQuestion = self.questions.last ?? "error"
    
            if !skipped{
                withAnimation(.easeIn(duration: (495/time)*0.2)){
                    timeWarning.toggle()
                }
                withAnimation(.linear(duration: 0.2).delay((495/time)*0.2)) {
                    timesUp.toggle()
                }
            }
        }
//        .onAppear{
//            questionGenerating()
//            withAnimation(.easeIn(duration: time)){
//                timePercentage = 165
//                timeWarning.toggle()
//            }
//            //timesUp.toggle()
//            withAnimation(.linear(duration: 0.2).delay(time)) {
//                if correctAnswer {
//                    //
//                } else {
//                    timesUp.toggle()
//                    restart.toggle()
//                    lives-=1
//                }
//            }
//        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(skipped: .constant(false))
    }
}
