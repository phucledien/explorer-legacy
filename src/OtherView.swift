import Cocoa

class OtherView:CustomView {
    var container:Container!
    var fileWatcher:FileWatcher?
    
    override func resolveSkin() {
        super.resolveSkin()
        container = addSubView(Container(1000,800,self,"main"))
        createColorBox()
        createColorInput()
        //createColorPanel()
        //createGradientPanel()
    }
    func createColorBox(){
        Swift.print("createColorBox")
        let card:Card = container.addSubView(Card(NaN, NaN, "ColorBox: ", container, "colorBoxCard"))
        card
        let colorBox = card.addSubView(ColorBox(NaN,NaN,NSColor.cyanColor(),card))
        colorBox
    }
    func createColorInput(){// :TODO: inpliment TextInput TextAre in the css
        /*let url:String = "~/Desktop/ElCapitan/other/colorinput/colorinput.css"
        StyleManager.addStylesByURL(url,true)*/
        Swift.print("createColorInput()")
        let colorInputCard:Card = container.addSubView(Card(NaN, NaN, "ColorInput: ", container, "colorInputCard"))
        colorInputCard
        let colorInput:ColorInput = colorInputCard.addSubView(ColorInput(NaN,NaN,"Color: ",NSColor.magentaColor(),colorInputCard))//NSColorParser.nsColor(Colors.MAGENTA)
        colorInput
    }
    func createColorPanel(){
        let url:String = "~/Desktop/ElCapitan/other/colorpanel/colorpanel.css"
        StyleManager.addStylesByURL(url,true)
        
        let colorPanelCard:Card = container.addSubView(Card(NaN, NaN, "ColorPanel: ", container, "colorPanelCard"))
        let colorPanel = colorPanelCard.addSubView(ColorPanel(NaN,NaN,24,NSColor.magentaColor(),"Color",colorPanelCard))
        colorPanel
        //colorPanel.setPosition(new Point(0,144));
        //colorPanel.setSize(300, 300);
    }
    func createGradientPanel(){
        let url:String = "~/Desktop/ElCapitan/other/gradientpanel/gradientpanel.css"
        StyleManager.addStylesByURL(url,true)
        
        fileWatcher = FileWatcher([url.tildePath])
        fileWatcher!.event = { event in
            //Swift.print(self)
            Swift.print(event.description)
            if(event.fileChange && event.path == url.tildePath) {
                StyleManager.addStylesByURL(url,true)
                ElementModifier.refreshSkin(self)
                ElementModifier.floatChildren(self)
            }
        }
        fileWatcher!.start()
        
        let gradientPanelCard:Card = container.addSubView(Card(NaN, NaN, "GradientPanel: ", container, "gradientPanelCard"))
        let gradientColors:Array<CGColor> = [NSColor.redColor().cgColor, NSColor.blueColor().cgColor]
        var gradient:IGradient = LinearGradient(gradientColors,[],0)
        gradient.colors = Gradients.deepPurple()
        let gradientPanel:GradientPanel = gradientPanelCard.addSubView(GradientPanel(200,NaN,20,gradient,gradientPanelCard))
        gradientPanel
    }
}