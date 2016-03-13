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
        createButton()
        createTextButton()
    }
    /**
     * Button
     */
    func createButton(){
        let card:Card = container.addSubView(Card(NaN/**/, NaN/*120*/, "Buttons: ", container, "buttonCard"))
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
        //var textButton:TextButton = textButtonSection.addChild(new TextButton(96,24,false,false,"Button",textButtonSection)) as TextButton;
    
        
        let textButton:TextButton = TextButton("Button",NaN,NaN,card)
        
        card.addSubview(textButton)
        
    
    }
}
class Card:Element{
    var text:String;
    init(_ width: CGFloat, _ height: CGFloat, _ text:String = "", _ parent: IElement?, _ id: String?) {
        self.text = text
        super.init(width, height, parent, id)
    }
    override func resolveSkin() {
        super.resolveSkin()
        addSubView(Element(CGFloat.NaN, CGFloat.NaN, self, "ruler"))
        addSubView(Text(CGFloat.NaN, CGFloat.NaN, text, self, "cardText"));
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}


