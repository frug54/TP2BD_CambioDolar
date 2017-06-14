package com.tec.conection;

import com.tec.model.User;
import java.util.ArrayList;

public class AdminConection {

    public AdminConection() {
    }
    
    public ArrayList<User> getUsers() {
        ArrayList<User> users = new ArrayList<User>();
        
        // Examples
            User user1 = new User(1, "Participante", "PW4769", "Activo", "Moon");
            User user2 = new User(2, "Admin", "PW7974", "Suspendido", "Ralph");
            users.add(user2);
            users.add(user1);
        //
        //Llamada al SP que trae a todos los usuario de la base de datos
        
        return users;
    }
}
