package command;
using tink.CoreApi;
class Mock2 implements poscope.wire.ICommand<Noise>{

   public function new(n){

   }
   public function execute<T>(data:T):Promise<Noise>{
      trace ("pipo2");
      return Promise.lift(Noise);
   }

}