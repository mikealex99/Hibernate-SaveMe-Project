package hibernate.model;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cufar")
public class Cufar implements Serializable {
    private static final long serialVersionUID = 1L ;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="Id")
    private int Id;
      
    @Column(name="Id_cufar")
    private int Id_cufar;

    @Column(name = "Data")
    private String Data;

    @Column(name = "Titlu")
    private String Titlu;

    @Column(name = "Text")
    private String Text;
    
    @Column(name = "Telefon")
    private String Telefon;
    
    public int getId() {
		return Id;
	}

	public void setId(int Id) {
		this.Id = Id;
	}
    
    

	public int getIdCufar() {
		return Id_cufar;
	}

	public void setIdCufar(int Id_cufar) {
		this.Id_cufar = Id_cufar;
	}

    public String getData() {
        return Data;
    }
    public void setData(String Data) {
        this.Data = Data;
    }
    public String getTitlu() {
        return Titlu;
    }
    public void setTitlu(String Titlu) {
        this.Titlu = Titlu;
    }
    
    public String getText() {
        return Text;
    }
    public void setText(String Text) {
        this.Text = Text;
    }
    
    public String getTelefon() {
        return Telefon;
    }
    public void setTelefon(String Telefon) {
        this.Telefon = Telefon;
    }
    
}