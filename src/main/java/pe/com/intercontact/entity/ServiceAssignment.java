package pe.com.intercontact.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Table;

@Getter
@Setter
@Entity
@Table
public class ServiceAssignment {
    private int serviceId;
    private int collaboratorId;

}
