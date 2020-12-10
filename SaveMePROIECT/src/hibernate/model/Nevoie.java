package hibernate.model;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "nevoie")
public class Nevoie implements Serializable {
    private static final long serialVersionUID = 1L ;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="Id")
    private int Id;  

    @Column(name = "Bani")
    private String Bani;
    
    @Column(name = "Mancare")
    private String Mancare;
    
    @Column(name = "MesajAdmin")
    private String MesajAdmin;

    @Column(name = "Nume")
    private String Nume;
    
    @Column(name = "Prenume")
    private String Prenume;
    
    @Column(name = "Adresa")
    private String Adresa;
    
    @Column(name = "Adresa2")
    private String Adresa2;
    
    @Column(name = "Telefon")
    private String Telefon;
    
    @Column(name = "Haine")
    private String Haine;
    
    @Column(name = "Descriere")
    private String Descriere;

    @Column(name = "CodPostal")
    private int CodPostal;
    
    @Column(name = "Ziua")
    private String Ziua;
    
    @Column(name = "Luna")
    private String Luna;
    
    @Column(name = "Id_UserNev")
    private int Id_UserNev;
    
    @Column(name = "Anul")
    private String Anul;

    @Column(name = "Document")
    private String Document;
    
    @Column(name = "Status")
    private String Status;

    
	public int getId() {
		return Id;
	}
	public void setId(int Id) {
		this.Id = Id;
	}       
    public String getLuna() {
        return Luna;
    }
    public void setLuna(String Luna) {
        this.Luna = Luna;
    }
    public String getDocument() {
        return Document;
    }
    public void setDocument(String Document) {
        this.Document = Document;
    }    
    public String getAdresa2() {
        return Adresa2;
    }
    public void setAdresa2(String Adresa2) {
        this.Adresa2 = Adresa2;
    }   
    public String getZiua() {
        return Ziua;
    }
    public void setZiua(String Ziua) {
        this.Ziua = Ziua;
    }    
    public String getMesajAdmin() {
        return MesajAdmin;
    }
    public void setMesajAdmin(String MesajAdmin) {
        this.MesajAdmin = MesajAdmin;
    }   
    public String getAnul() {
        return Anul;
    }   
    public void setAnul(String Anul) {
        this.Anul=Anul;
    }    
    public String getDescriere() {
        return Descriere;
    }
    public void setDescriere(String Descriere) {
        this.Descriere = Descriere;
    }
    public String getHaine() {
        return Haine;
    }
    public void setHaine(String Haine) {
        this.Haine = Haine;
    }
    public String getStatus() {
        return Status;
    }
    public void setStatus(String Status) {
        this.Status = Status;
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
    public String getBani() {
        return Bani;
    }
    public void setBani(String Bani) {
        this.Bani = Bani;
    }   
    public String getMancare() {
        return Mancare;
    }
    public void setMancare(String Mancare) {
        this.Mancare = Mancare;
    }  
    public int getCodPostal() {
        return CodPostal;
    }
    public void setCodPostal(int CodPostal) {
        this.CodPostal = CodPostal;
    }
	public int getId_UserNev() {
		return Id_UserNev;
	}
	public void setId_UserNev(int Id_UserNev) {
		this.Id_UserNev = Id_UserNev;
	}

}