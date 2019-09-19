package command;
using tink.CoreApi;
class Mock implements poscope.wire.ICommand<Noise>{

   public function new(n){

   }
   public function execute<T>(data:T):Promise<Noise>{
      trace ("pipo");
      return Promise.lift(Noise);
   }

}