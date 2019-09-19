package  poscope.wire;
import tink.template.Html;
import poscope.views.Layout;
import poscope.wire.ILayout;
using poscope.wire.Log;
using Lambda;
class Actor{

    public static var actions:Map<String,Any>=new Map();
    private static var actionString=""; 
    public static  var scripts:Array<String>=[];
    public static var styles:Array<String>=[];

    @:isVar public static var defaultLayout(default,set):ILayout;
    public function new(){

    }
     static function set_defaultLayout(layout:ILayout){
        return defaultLayout=layout;
    }

    @:isVar public static var defaultHead(default,set):IHead;
    
     static function set_defaultHead(head:IHead){
        return defaultHead=head;
    }


    public function getAction(){

    }
    public static function addAction<T>(layout:ILayout,a:ActionCommand,?data:T):ILayout{
       
            writeAction(a,data);
            addAct(layout,haxe.Serializer.run(actions));
            return layout;
       
    }
    public static function cleanAfter(layout:ILayout):ILayout{
        
        update(layout);
        actions.clear();
        actionString="";
        return layout;
    }

    private static  function addAct(layout:ILayout,actions:String):ILayout{
        actionString=actions;
        update(layout);
        return layout;
    }
    public static function clearScripts(layout:ILayout,script:String):ILayout{
        
        while(scripts.length>0)
            scripts.pop();
        update(layout);
        return layout;
    }
    public static function removeScript(layout:ILayout,script:String):ILayout{
        if (scripts.has(script)){
            scripts.remove(script);
            update(layout);
        }
        return layout;
    }
    public static function addScript(layout:ILayout,script:String):ILayout{
       
        if (!scripts.has(script)){
            scripts.push(script);
            update(layout);
        }
            return layout;

    }
     public static function addStyle(layout:ILayout,style:String):ILayout{
       
        if (!styles.has(style)){
            styles.push(style);
            update(layout);
        }
            return layout;

    }
    //@todo decouple Head ici....
    public dynamic static function update(layout:ILayout){
        //layout.head=poscope.views.Head.render(scripts,styles,actions);
    
       layout.head=defaultHead.render(scripts,styles,actionString);
       

    }

    static function  writeAction<T>(a:ActionCommand,?data:T){
        actions.set(a,data);
        return actions;
    }

    public static function withLayout(v:tink.template.Html,?layout:ILayout,?contentid="layout"):ILayout{
       var  _Layout=(layout==null)? defaultLayout : layout;
       update(_Layout);
        _Layout.viewContent=v;
        _Layout.id=contentid;
        return _Layout;
    }




}


//// good idee    bad impl
abstract HtmlPart(String) from String to String{
    public function new (p:String){
        this=p;
    }
    @:to public function toHtml():Html{
       return new Html(this);
    }
}

