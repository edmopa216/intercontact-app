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
public class DocumentDetail {

    @Id
    private int id;
    private int documentId;
    private String fileName;
    private LocalDate uploadDate;
    private String version;

}
