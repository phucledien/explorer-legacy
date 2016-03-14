import Foundation

class BasicView:CustomView {
    var container:Container!
    override func resolveSkin() {
        StyleManager.addStylesByURL("~/Desktop/css/explorer/explorer.css")
        super.resolveSkin()
        var css:String = ""
        css += ""
        //StyleManager.addStyle(css)
        Swift.print("hello world")
        container = addSubView(Container(1000,800,self,"main"))
        
        /*
        
        createButton()
        createTextButton()
        createRadioBullet()
        createCheckBoxButton()
        createLeverSpinner()
        createTabBar()
        createIconButtons()
        createLeverStepper()

        */
        
        createTextInput()
    }
    /**
     * Button
     */
    func createButton(){
        let card:Card = container.addSubView(Card(NaN, NaN, "Buttons: ", container, "buttonCard"))
        let button = card.addSubView(Button(96,24,card))
        func onbuttonDown(event:Event){
            if(event.type == ButtonEvent.upInside){
                //var startTime:int = getTimer();
                //StyleResolver.style(event.target as Button);
                //print("selectRow-duration: " + (getTimer() - startTime));
            }
        }
        button.event = onbuttonDown
    }
    /**
     * TextButton
     */
    func createTextButton(){
        let card:Card = container.addSubView(Card(NaN, NaN, "TextButton: ", container, "textButtonCard"))
        card.addSubView(TextButton("Button",NaN,NaN,card))
    }
    /**
     * RadioBullet
     */
    func createRadioBullet(){
        let card:Card = container.addSubView(Card(NaN, NaN, "RadioBullet: ", container, "radioBulletCard"))
        let section = card.addSubView(Section(NaN,NaN,card,"radioBulletContainer"))
        let radioBullet1 = section.addSubView(RadioBullet(NaN,NaN,true,section))
        let radioBullet2 = section.addSubView(RadioBullet(NaN,NaN,false,section))
        let selectGroup = (SelectGroup([radioBullet1,radioBullet2],radioBullet1))
        selectGroup
    }
    /**
     * CheckboxButtons
     */
    func createCheckBoxButton(){
        let card:Card = container.addSubView(Card(NaN, NaN, "CheckBoxButton: ", container, "checkBoxButtonCard"))
        let section = card.addSubView(Section(NaN, NaN, card, "checkBoxButtonContainer")) /*this instance represents the inset shadow bagground and also holds the buttons*/
        let checkBoxButton1 = section.addSubView(CheckBoxButton(NaN, NaN,"Option 1",true,section))
        let checkBoxButton2 = section.addSubView(CheckBoxButton(NaN, NaN,"Option 2",false,section))
        let checkGroup = CheckGroup([checkBoxButton1,checkBoxButton2],checkBoxButton1)/*Add the CheckBoxButtons to the checkGroup instance*/
        func onEvent(event:Event){/*this is the event handler*/
            if(event.type == CheckGroupEvent.change){Swift.print("CustomView.onCheck() checked" + "\((event as! CheckGroupEvent).checked)")}
        }
        checkGroup.event = onEvent/*adds the event handler to the event exit point in the checkGroup*/
    }
    /**
     * TODO: create the LeverSpinner component with text
     */
    func createLeverSpinner(){
        let card:Card = container.addSubView(Card(NaN, NaN, "LeverSpinner: ", container, "leverSpinnerCard"))
        let leverSpinner:LeverSpinner = card.addSubView(LeverSpinner(NaN, NaN,"Value: ", 0, 1, Int.min.cgFloat, Int.max.cgFloat, 0, 100, 200, card))
        leverSpinner
    }
    func createTabBar(){
        let card:Card = container.addSubView(Card(NaN, NaN, "Tab bar: ", container, "tabBarCard"))
        let btn1 = card.addSubView(SelectTextButton(NaN,NaN,"first",false,card,"first"))
        let btn2 = card.addSubView(SelectTextButton(NaN,NaN,"second",true,card,"second"))
        let btn3 = card.addSubView(SelectTextButton(NaN,NaN,"third",false,card,"third"))
        let selectGroup = SelectGroup([btn1,btn2,btn3],btn2)//SelectParser.selectables(card)
        selectGroup
    }
    func createIconButtons(){
        let card:Card = container.addSubView(Card(NaN, NaN, "Icon button: ", container, "iconButtonCard"))
        let iconButton1 = card.addSubView(SelectButton(NaN,NaN,false,card,"first"))
        let iconButton2 = card.addSubView(SelectButton(NaN,NaN,false,card,"second"))
        let iconButton3 = card.addSubView(SelectButton(NaN,NaN,true,card,"third"))
        let iconButton4 = card.addSubView(SelectButton(NaN,NaN,false,card,"fourth"))
        let selectGroup = SelectGroup([iconButton1,iconButton2,iconButton3,iconButton4],iconButton3);
        selectGroup
    }
    func createLeverStepper(){
        let card:Card = container.addSubView(Card(NaN, NaN, "LeverStepper: ", container, "leverStepperCard"))
        let stepper:LeverStepper = card.addSubView(LeverStepper(NaN,NaN,0,1,Int.min.cgFloat,Int.max.cgFloat,0,100,200,card))
        stepper
    }
    
    /**
     * TODO: Create examples etc
     */
    func createTextInput(){
        var css:String = ""
        
        css += "InsetShadow{"
        css +=      "drop-shadow:drop-shadow(0px 0 #000000 0.4 4 4 1 2 true);"
        css += "}"
        
        css += "Text{"
        css +=     "float:left;"
        css +=     "clear:left;"
        css +=     "font:Lucida Grande;"
        css +=     "size:12px;"
        css +=     "align:left;"
        //css +=     "wordWrap:true;"
        //css +=     "autoSize:none;"
        css +=     "color:grey6;"
        //css +=     "margin-top:4px;"
        css +=     "backgroundColor:orange;"
        css +=     "background:false;"
        css += "}"
        
        css += "TextInput{"
        css +=     "padding:0px;"
        css +=     "float:left;"
        css +=     "clear:left;"
        css += "}"
        css += "TextInput Text{"
        css +=     "float:left;"
        css +=     "clear:none;"
        css +=     "width:78px;"
        css +=     "height:22px;"
        css +=     "margin-top:4px;"
        css +=     "color:grey4;"
        css += "}"/**/
        css += "TextInput TextArea{"
        css +=     "clear:none;"
        css +=     "width:60px;"
        css +=     "height:24px;"
        css +=     "padding:0px;"
        css +=     "fill:white;"
        css +=     "line:grey9;"
        css +=     "line-alpha:1;"
        css +=     "line-thickness:1px;"
        css +=     "line-offset-type:outside;"
        css +=     "drop-shadow:<InsetShadow>;"
        css += "}"/**/
        css += "TextInput TextArea Text{"
        css +=     "margin-left:4px;"
        css +=     "padding-right:-20px;"
        css +=     "type:input;"
        css +=     "selectable:true;"
        css += "}"
        
        
        css += "Section#textContainer{fill:green;fill-alpha:0;float:left;clear:left;padding-top:20px;padding-left:20px;corner-radius:0px;}"
        
        /*Text*//*generics*//*TextInput*/
        
        StyleManager.addStyle(css)
        
        let section = container.addSubView(Section(200,200,container,"textContainer"))
        
        let textInput:TextInput = section.addSubView(TextInput(200, 28, "Description: ", "blue", section))
        textInput
    }
    
    //create single-line text
    //create text
    //create text area
    //create the search-box
    
    //vertical slider
    //horizontal slider
    
    //slider textArea
    //list
    //slider list
    
    //comboBox
    
    
}