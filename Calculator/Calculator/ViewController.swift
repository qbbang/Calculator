//
//  ViewController.swift
//  Calculator
//
//  Created by qbbang on 2018. 9. 5..
//  Copyright © 2018년 qbbang. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    /* ViewController Lifecycle의 일부분,  계산기 작성 시 사용되지 않음!v */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false'
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        /* 불필요한 코드
        // C의 문법
        //print("touched %s digit", digit)
        // Swift의 방식
        print("touched \(digit) digit")
        
        // textCurrentlyInDisplay를 생성하고 display에 text를 전달하고자 함
        // display.text는 불가함
        // display!.text를 통해 강제로 가져옴*/
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            
            // + 연산자로 Srting을 연산할 수 있음
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
        
    }
    //display에 표기되는 값을 더블로 가질 변수를 생성
    //역할 : 디스플레이 안에 뭐가 있었는지를 추적 -> 이 변수를 가진다면 디스플레이가 더블일때
    //이 변수에 값이 들어간다면 디스플레이에 set이 되었다라고 알 수 있음
    //계산을 담당할 것임으로, 변수 선언 뒤에 중괄호를 써서 계산 프로퍼티로 생성
    var displayValue: Double {
        //displayValue 값을 가져오기 - get
        get {
            //display.text의 z 값을 강제로 추출해서 반환 할건데
            //displayValue가 Double임으로 String -> Double 변환해줘야함
            //String에서 Double반환 시 옵셔널이 들어가는 이유는
            //변환이 안될 수도 있음으로,
            //안되면 앱을 정지하기 위해 쓰임
            return Double(display.text!)!
        }
        //displayValue 값을 세팅하기 - set
        set {
            // newValue는 특별한 키워드
            display.text = String(newValue)
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        //performOperation 동작 할때마다 display의 숫자를 지움
        userIsInTheMiddleOfTyping = false
        // 버튼의 TitleName이 있을 때만 누르겠다
        if let mathematicalSymbol = sender.currentTitle {
            if mathematicalSymbol == "π" {
                displayValue = Double.pi;
                
                /* displayValue 계산 프로퍼티에 의해 사용하지 않음, 대체됨
                //initializer String(M_PI)
                //M_PI Double값으로부터 String 생성
               display.text = String(Double.pi) //M_PI
                */
            }
        } else if mathematicalSymbol == "√" {
            displayValue = sqrt(displayValue)
        }
    }
    
}

