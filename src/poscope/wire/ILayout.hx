package wire;

import tink.template.Html;
interface ILayout{

    public var viewContent:Html;
    public var id:String;
    public  var footer:Html;
    public  var header:Html;
    public  var head:Html;
    public  var menu:Html;
    
    
    public function render():Html;
}