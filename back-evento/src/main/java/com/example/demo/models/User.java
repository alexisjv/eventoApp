package com.example.demo.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Getter @Setter
@Table(name = "users", uniqueConstraints = @UniqueConstraint(columnNames = "email"))
public class User {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String username;
    private String firstname;
    private String surname;
    private String email;
    private String password;
    private Date birthday;

    @OneToOne
    @JoinColumn(name = "role_id")
    private Role role;

    public User(String username, String firstname, String surname, String email, String password, Date birthday) {
        this.username = username;
        this.firstname = firstname;
        this.surname = surname;
        this.email = email;
        this.password = password;
        this.birthday = birthday;
    }

    public User() {

    }
}
