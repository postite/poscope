package wire;

abstract ActionCommand(String) from String to String{

    @:from public static function toString<T>(c:Class<ICommand<T>>):ActionCommand{
        //return Std.string(c);
        return Type.getClassName(c);
    }

    @:to public static function toClass<T>(a:ActionCommand):Class<ICommand<T>>{
        return cast Type.resolveClass(a);
    }
}