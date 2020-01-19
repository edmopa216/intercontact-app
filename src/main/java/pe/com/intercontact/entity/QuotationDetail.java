package pe.com.intercontact.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;

@Getter
@Setter
@Entity
@Table
public class QuotationDetail {

    @Id
    private int id;
    private int quoteId;
    private String service;
    private int idServiceType;
    private BigDecimal price;

}
