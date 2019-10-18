    import sys.db.Sqlite;
    import haxe.MainLoop;

    class Test2 {
        public static function main() {
            for (k in 0...6) {
                MainLoop.addThread(function() {
                    var cnx = Sqlite.open('./klsfxp_${k + 1}.db');

                    cnx.request("PRAGMA synchronous = OFF");
                    cnx.request("PRAGMA locking_mode=EXCLUSIVE");
                    cnx.request("PRAGMA journal_mode=WAL");
                    cnx.request("
                    CREATE TABLE IF NOT EXISTS fa_game (
                        id integer NOT NULL PRIMARY KEY AUTOINCREMENT,
                        n1 integer  NOT NULL DEFAULT 0,
                        n2 integer  NOT NULL DEFAULT 0,
                        n3 integer NOT NULL DEFAULT 0,
                        n4 integer NOT NULL DEFAULT 0,
                        n5 integer NOT NULL DEFAULT 0,
                        n6 integer NOT NULL DEFAULT 0,
                        n7 integer NOT NULL DEFAULT 0,
                        n8 integer NOT NULL DEFAULT 0
                        
                    
                    )
                    ");

                    var m = 0;
                    var a:Float = 0;
                    while (m < 100000000) {
                        m++;
                        a += k / 2 * 2 % 2 * Math.sqrt(2);

                        trace("can you see me fisrt time ? I don't think so!" + m); // m will not eq 100000000 
                    }
                });
            }
        }
    }
