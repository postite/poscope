package  poscope.views;
import tink.template.Html;
using Lambda;
import poscope.wire.IHead;

class Layout implements poscope.wire.ILayout{

    public var viewContent:Html;
    public  var footer:Html;
    public  var header:Html;
    public var head:Html;
    public  var menu:Html;
    public  var id:String;
    
   
 
    public function new(){
        this.footer=poscope.views.Footer.render();
        this.header=poscope.views.Header.render();
    }

    @:template("layout.tt")
    public function render():Html;
}