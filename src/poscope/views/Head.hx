package poscope.views;
import tink.template.Html;
import poscope.wire.IHead;
class Head implements IHead{
  public function new(){
  }

@:template('renderHead')
public function render(scripts:Array<String>,styles:Array<String>,actions:String):Html;

}