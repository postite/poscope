package  poscope.wire;
using tink.CoreApi;
interface ICommand<Z> {

    #if (js && !nodejs || client)
    public function execute<T>(?data:T):Promise<Z>;
    #end
}