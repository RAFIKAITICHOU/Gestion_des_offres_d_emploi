/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao2;

/**
 *
 * @author ichou
 */
import entities.User;

public class UserDao extends AbstractDao<User> {
    public UserDao() {
        super(User.class);
    }
}
