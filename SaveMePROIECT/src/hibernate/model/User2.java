package hibernate.model;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "inregistrare2")
public class User2 implements Serializable {
    private static final long serialVersionUID = 1L ;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="Id_user")
    private int Id_user;

    @Column(name = "Id_UserNev")
    private int Id_UserNev;
    
    @Column(name = "Email")
    private String Email;

    @Column(name = "Parola")
    private String Parola;

    @Column(name = "Nume")
    private String Nume;
    
    @Column(name = "Prenume")
    private String Prenume;
    
    @Column(name = "Adresa")
    private String Adresa;
    
    @Column(name = "Telefon")
    private String Telefon;
    
    @Column(name = "Code")
    private String Code;
    
    @Column(name = "Verificat")
    private String Verificat;
    
    
	public int getId() {
		return Id_user;
	}
	public void setId(int Id_user) {
		this.Id_user = Id_user;
	}
    public String getEmail() {
        return Email;
    }
    public void setEmail(String Email) {
        this.Email = Email;
    }
    public String getParola() {
        return Parola;
    }
    public void setParola(String Parola) {
        this.Parola = Parola;
    }
    public String getPrenume() {
        return Prenume;
    }
    public void setPrenume(String Prenume) {
        this.Prenume = Prenume;
    }
    public String getAdresa() {
        return Adresa;
    }
    public void setAdresa(String Adresa) {
        this.Adresa = Adresa;
    } 
    public String getNume() {
        return Nume;
    }
    public void setNume(String Nume) {
        this.Nume = Nume;
    }   
    public String getTelefon() {
        return Telefon;
    }
    public void setTelefon(String Telefon) {
        this.Telefon = Telefon;
    }
	public int getId_UserNev() {
		return Id_UserNev;
	}
	public void setId_UserNev(int Id_UserNev) {
		this.Id_UserNev = Id_UserNev;
	}
    public String getCode() {
        return Code;
    }
    public void setCode(String Code) {
        this.Code = Code;
    }
    
    public String getVerificat() {
        return Verificat;
    }
    public void setVerificat(String Verificat) {
        this.Verificat = Verificat;
    }
	
}