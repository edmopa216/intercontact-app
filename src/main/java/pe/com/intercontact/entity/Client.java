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
public class Client {

    @Id
    private int id;

    private String ruc;

    @Column(name = "business_name")
    private String businessName;

    private String phone;

}
