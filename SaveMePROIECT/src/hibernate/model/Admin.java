package hibernate.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "adminlog")
public class Admin implements Serializable{
	private static final long serialVersionUID = 1L ;
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="ID")
    private int Id;
	
	@Column(name = "Utilizator")
    private String Utilizator;
	
	@Column(name = "Parola")
    private String Parola;
	
	public int getId() {
		return Id;
	}

	public void setId(int Id) {
		this.Id = Id;
	}
	
    public String getUtilizator() {
        return Utilizator;
    }
    public void setUtilizator(String Utilizator) {
        this.Utilizator = Utilizator;
    }
    
    public String getParola() {
        return Parola;
    }
    public void setParola(String Parola) {
        this.Parola = Parola;
    }
	
}
