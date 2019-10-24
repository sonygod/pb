package utils;

class SQLRex {
    



    public static function checkSQL(content:String):Bool {


        var r=~/(delete)|(drop)|(;)|(-)|(insert)|(drop)|(count)|(\*)|(select)|(where)|(when)|(\s+)/;


        return !r.match(content);
    }
}