pragma Singleton
import QtQuick 2.6
import QtQuick.LocalStorage 2.0

QtObject {


    property  var db: LocalStorage.openDatabaseSync("todos-scope", "1.0", "Todos", 1000000)
    property ListModel itemModel : ListModel {}


    function dbInit()
    {

        try {
            db.transaction(function (tx) {
                tx.executeSql('CREATE TABLE IF NOT EXISTS todo (todo_id INTEGER  PRIMARY KEY, name TEXT, done INTEGER, created_date INTEGER);')

                //clean datas, don't keep old todos, may be configuratble in settings
                //tx.executeSql('DELETE FROM todo where todo_id < (SELECT MAX(todo_id)-20 FROM todo)')


            })
        } catch (err) {
            console.log("Error creating table in database: " + err)
        };
    }


    function buildModel()
    {
        itemModel.clear()
        db.transaction(function (tx) {
            var results = tx.executeSql('SELECT * FROM todo ORDER BY created_date DESC')
            for (var i = 0; i < results.rows.length; i++) {
                //console.log(results.rows.item(i).name)
                var todo = {
                    id: results.rows.item(i).todo_id,
                    name: results.rows.item(i).name,
                    done: results.rows.item(i).done,
                    createdDate: results.rows.item(i).created_date,
                }
                itemModel.append(todo)
                //console.log(JSON.stringify(todo))
            }
        })

    }

    function count(){
        var count = 0
        db.transaction(function (tx) {
            var result = tx.executeSql('SELECT count(*) as nb FROM todo')
             count = parseInt(result.nb)
        })

        return count
    }


    function save(name)
    {
        var rowid = 0;
        db.transaction(function (tx) {
            tx.executeSql('INSERT INTO todo(name, done, created_date) VALUES(?, 0, strftime(\'%s\',\'now\'))',
                          [name])
            var result = tx.executeSql('SELECT last_insert_rowid()')
            rowid = parseInt(result.insertId)
        })
        var todo = {
            id: rowid,
            name: name,
            done: 0,
            createdDate: Date.now()
        }

        itemModel.insert(0, todo)
    }



    function update(index, name)
    {
        var data = itemModel.get(index)

        db.transaction(function (tx) {
            tx.executeSql(
                        'update todo set name=? where todo_id = ?', [todo.name, todo.id])
        })

        data.name = name

    }

    function done(index , done)
    {
        var data = itemModel.get(index)

        db.transaction(function (tx) {
            tx.executeSql(
                        'update todo set done=? where todo_id = ?', [done, data.id])
        })

        data.done = done

    }

    function remove(index)
    {
        var data = itemModel.get(index)
        db.transaction(function (tx) {
            console.log("delete rowid:" + data.id)
            tx.executeSql('delete from todo where todo_id = ?', [data.id])
        })

        itemModel.remove(index, 1)
    }



    Component.onCompleted:{
        dbInit()


        buildModel()
    }
}
