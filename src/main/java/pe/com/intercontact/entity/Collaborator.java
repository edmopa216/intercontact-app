package pe.com.intercontact.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@Setter
@Entity
@Table
public class Collaborator {

    @Id
    private int id;

    private String name;

    @Column(name = "last_name")
    private String lastName;

    private int dni;

    private String user;

    private String password;

    @Column(name = "profile_id")
    private int profileId;

}
