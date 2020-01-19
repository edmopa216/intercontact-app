package pe.com.intercontact.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table
public class Service {

    @Id
    private int id;
    private int orderBuyId;
    private int idServiceType;
    private int detailed_idization_id;
    private String priority;
    private String state;
    private LocalDate deliverDate;

}
