package ;
class NonStatic {
  public var name : String;
  
  public function new( name ) {
    this.name = name;
  }

  @:template("./nonstat")
   public function render();// <---- this bit is new!
}