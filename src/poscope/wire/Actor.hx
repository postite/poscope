package wire;
import tink.template.Html;
import views.Layout;
import wire.ILayout;
using Lambda;
class Actor{

    static var actions:Map<String,Any>=new Map();

    static  var scripts:Array<String>=[];
    static var styles:Array<String>=[];

    @:isVar public static var defaultLayout(default,set):ILayout;
    public function new(){

    }
     static function set_defaultLayout(layout:ILayout){
        return defaultLayout=layout;
    }

    public function getAction(){

    }
    public static function addAction<T>(layout:ILayout,a:ActionCommand,?data:T):ILayout{
       
            writeAction(a,data);
            addAct(layout,haxe.Serializer.run(actions));
            return layout;
       
    }

    private static  function addAct(layout:ILayout,actions:String):ILayout{
        init(layout,actions);
        return layout;
    }

    public static function addScript(layout:ILayout,script:String):ILayout{
       
        if (!scripts.has(script))
            scripts.push(script);
            return layout;

    }
     public static function addStyle(layout:ILayout,style:String):ILayout{
       
        if (!styles.has(style))
            styles.push(style);
            return layout;

    }
    //@todo decouple Head ici....
    public static function init(layout:ILayout,?actions:String){
        layout.head=views.Head.render(scripts,styles,actions);
    }

    static function  writeAction<T>(a:ActionCommand,?data:T){
        actions.set(a,data);
        return actions;
    }

    public static function withLayout(v:tink.template.Html,?layout:ILayout,?contentid="layout"):ILayout{
       var  _Layout=(layout==null)? defaultLayout : layout;
       init(_Layout);
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

