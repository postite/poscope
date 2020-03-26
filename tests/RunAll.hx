import haxe.display.Protocol.HaxeResponseErrorData;
import utest.Assert;
import poscope.wire.*;
import poscope.views.*;
using poscope.wire.Actor;
using poscope.wire.Log;
class RunAll{
    
    public static function main(){
       utest.UTest.run([new TestCase1()]);
    }

}

class TestCase1 extends utest.Test{

   public function testOne()
   {
         Assert.isTrue(1==1);
   }
   public function testTmplate1()
   {
      var f=poscope.views.Home.render();
      Assert.stringContains("div",f);
      
   }
   public function testnonStatic()
   {
      var f=new NonStatic("me").render();
      Assert.stringContains("me",f);
   }

   public function testrenderHead(){
      Actor.defaultLayout=new poscope.views.Layout();
      Actor.defaultHead= new poscope.views.Head();
      var home=Home.render().withLayout().render();
      Assert.stringContains("div",home);//for home
      Assert.stringContains("UTF-8",home);//for head
      Assert.stringContains("html",home);//for layout
      
   }

   public function testaddscript(){
      Actor.defaultLayout=new poscope.views.Layout();
      Actor.defaultHead= new poscope.views.Head();
      var home=Home.render().withLayout().addScript("pop.js").render();
      Assert.stringContains("div",home);//for home
      Assert.stringContains("UTF-8",home);//for head
      Assert.stringContains("html",home);//for layout
      Assert.stringContains("pop.js",home);//for layout
      
   }

   public function testRemoveScript(){
      Actor.defaultLayout=new poscope.views.Layout();
      Actor.defaultHead= new poscope.views.Head();
      var home=Home.render().withLayout().addScript("pop.js").render();
      Assert.stringContains("div",home);//for home
      Assert.stringContains("UTF-8",home);//for head
      Assert.stringContains("html",home);//for layout
      Assert.stringContains("pop.js",home);//for layout
      home=Home.render().withLayout().removeScript("pop.js").render();
      Assert.notContains("pop.js",Actor.scripts);//for layout
   }

   public function testaddAction(){
      Actor.defaultLayout=new poscope.views.Layout();
      Actor.defaultHead= new poscope.views.Head();
      var home=Home.render().withLayout().addAction(command.Mock).render();
      Assert.stringContains("div",home);//for home
      Assert.stringContains("UTF-8",home);//for head
      Assert.stringContains("html",home);//for layout
      home=Home.render().withLayout().render();
      Assert.isTrue(Actor.actions.exists((command.Mock:ActionCommand)));//for layout
   }

   public function testCleanAfter(){
      Actor.defaultLayout=new poscope.views.Layout();
      Actor.defaultHead= new poscope.views.Head();
      var home=Home.render().withLayout().addAction(command.Mock).cleanAfter().render();
      Assert.stringContains("Mock",home);//for home
      home=Home.render().withLayout().render();
      Assert.isFalse(StringTools.contains(home,"Mock"),home);
      Assert.isFalse(Actor.actions.exists((command.Mock:ActionCommand)));//for layout
     
   }

   public function testCleanAfterScript(){
      Actor.defaultLayout=new poscope.views.Layout();
      Actor.defaultHead= new poscope.views.Head();
      var home=Home.render().withLayout().addScript("pop.js").cleanAfter().render();
      Assert.stringContains("pop.js",home);//for home
      home=Home.render().withLayout().render();
      Assert.isFalse(StringTools.contains(home,"pop.js"),home);
      Assert.isFalse(Actor.scripts.indexOf("pop.js")==1);//for layout
     
   }

   public function testMultiActions(){
      Actor.defaultLayout=new poscope.views.Layout();
      Actor.defaultHead= new poscope.views.Head();
      var home=Home.render().withLayout()
      .addAction(command.Mock)
      .addAction(command.Mock2)
      .cleanAfter()
      .render();
      Assert.stringContains("Mock",home);//for home
      Assert.stringContains("Mock2",home);//for home
      home=Home.render().withLayout().render();
      Assert.isFalse(StringTools.contains(home,"Mock"),home);
      Assert.isFalse(StringTools.contains(home,"Mock2"),home);
      Assert.isFalse(Actor.actions.exists((command.Mock:ActionCommand)));//for layout
      Assert.isFalse(Actor.actions.exists((command.Mock2:ActionCommand)));//for layout
     
   }


}