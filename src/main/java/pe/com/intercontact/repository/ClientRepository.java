package pe.com.intercontact.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pe.com.intercontact.entity.Client;

public interface ClientRepository extends JpaRepository<Client, Integer> {

}
