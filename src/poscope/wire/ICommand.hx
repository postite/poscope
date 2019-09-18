package wire;
using tink.CoreApi;
interface ICommand<Z> {

    #if js
    public function execute<T>(?data:T):Promise<Z>;
    #end
}