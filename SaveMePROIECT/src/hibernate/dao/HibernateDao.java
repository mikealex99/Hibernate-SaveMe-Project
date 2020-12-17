package hibernate.dao;




import java.sql.SQLException;
import java.util.List;


import org.hibernate.Session;
import org.hibernate.Transaction;

import hibernate.model.Admin;
import hibernate.model.Cufar;
import hibernate.model.Nevoie;
import hibernate.model.User;
import hibernate.model.User2;
import hibernate.util.HibernateUtil;


public class HibernateDao {
	
	// Realizam conexiunea la DB si introducem informatiile cu Hibernate
	
public void saveUser(User user) {
	
   Transaction transaction = null;
   
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // save the user object
            session.save(user);
            
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
 }
    
public void saveUser2(User2 user) {
	
   Transaction transaction = null;
   
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // save the user object
            session.save(user);
            
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
 }
  
public void saveCufar(Cufar cufar) {
	
   Transaction transaction = null;
        
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            
            // save the user object
            session.save(cufar);
            
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
 }    
 
public void saveNevoie(Nevoie nevoie) {
	
   Transaction transaction = null;
   
    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
        // start a transaction
        transaction = session.beginTransaction();
        
        // save the user object
        session.save(nevoie);
        
        // commit transaction
        transaction.commit();
    } catch (Exception e) {
        if (transaction != null) {
            transaction.rollback();
        }
        e.printStackTrace();
    }
 }



	//Validarea operatiilor de logare

public boolean validate(String Email, String Parola) {

        Transaction transaction = null;
        User user = null;
     
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            user = (User) session.createQuery("FROM User U WHERE U.Email = :Email").setParameter("Email", Email)
                .uniqueResult();
            if ( user != null && user.getParola().equals(Parola) ) {          	
                return true;
            }    
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
 }
	
public boolean validare(String Email, String Parola) {

        Transaction transaction = null;
        User2 user2 = null;     
       
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            user2 = (User2) session.createQuery("FROM User2 U WHERE U.Email = :Email").setParameter("Email", Email)
                .uniqueResult();
 
            if ( user2 != null && user2.getParola().equals(Parola) ) {
                return true;
            }
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
 }
	
public boolean validateAdmin(String Utilizator, String Parola) {

        Transaction transaction = null;
        Admin admin = null;
         
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            admin = (Admin) session.createQuery("FROM Admin A WHERE A.Utilizator = :Utilizator").setParameter("Utilizator", Utilizator)
                .uniqueResult();
            if ( admin != null && admin.getParola().equals(Parola) ) {
                return true;
            }
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
 }



	//Afisarea datelor din DB folosind Hibernate

@SuppressWarnings("unchecked")
public List<User> selectAllUsers() {

		Transaction transaction = null;
		List<User> users = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			
			users = session.createQuery("FROM User").getResultList();
			
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return users;
 }
	

@SuppressWarnings("unchecked")
public List<Cufar> selectAllCufar() {

		Transaction transaction = null;
		List<Cufar> users = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			
			users = session.createQuery("FROM Cufar").getResultList();
			
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return users;
 }
	
@SuppressWarnings("unchecked")
public List<Cufar> selectAllCufarNev() {

		Transaction transaction = null;
		List<Cufar> users = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			
			users = session.createQuery("FROM Cufar C  WHERE Titlu != 'null'").getResultList();
			
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return users;
 }
	
@SuppressWarnings("unchecked")
public List<User2> selectAllUsers2() {

		Transaction transaction = null;
		List<User2> users = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object	
			users = session.createQuery("FROM User2").getResultList();
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return users;
 }
	
@SuppressWarnings("unchecked")
public List<Nevoie> selectAllNevoie() {

		Transaction transaction = null;
		List<Nevoie> nev = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			nev = session.createQuery("FROM Nevoie WHERE Status = 'valid'").getResultList();
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return nev;
 }
	
@SuppressWarnings("unchecked")
public List<Nevoie> selectNevoieNevalid() {

		Transaction transaction = null;
		List<Nevoie> nev = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object	
			nev = session.createQuery("FROM Nevoie WHERE Status = 'nevalid'").getResultList();
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return nev;
 }
	
@SuppressWarnings("unchecked")
public List<Nevoie> selectNevoieLoad() {

		Transaction transaction = null;
		List<Nevoie> nev = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			nev = session.createQuery("FROM Nevoie WHERE Status = 'loading'").getResultList();
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return nev;
 }
	
	
@SuppressWarnings("unchecked")
public List<Nevoie> selectAllNevoieUsers() {

		Transaction transaction = null;
		List<Nevoie> nev = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object	
			nev = session.createQuery("FROM Nevoie").getResultList();
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return nev;
 }



	//Query-urile 'SelectUser' pentru realizarea operatiilor dupa ce ne-am logat 

public User selectUser(int id_user) {
	
		Transaction transaction = null;
		User user = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			user = session.get(User.class, id_user);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return user;
 }	
	
public Cufar selectCufar(int id_cufar) {
	
		Transaction transaction = null;
		Cufar cufar = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			cufar = (Cufar) session.createQuery("FROM Cufar U WHERE U.Id_cufar = :Id_cufar").setParameter("Id_cufar", id_cufar)
	                .uniqueResult();
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return cufar;
 }
		
public User selectUserProfil(int id_cufar) {
	
		Transaction transaction = null;
		User user = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			user = (User) session.createQuery("FROM User U WHERE U.Id_cufar = :Id_cufar").setParameter("Id_cufar", id_cufar)
	                .uniqueResult();
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return user;
 }
		
public User2 selectUserProfil2(int id_usernev) {
	
		Transaction transaction = null;
		User2 user = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			user = (User2) session.createQuery("FROM User2 U WHERE U.Id_UserNev= :Id_UserNev").setParameter("Id_UserNev", id_usernev)
	                .uniqueResult();		
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return user;
 }

public Admin selectUserProfilId(int id) {
	
	Transaction transaction = null;
	Admin user = null;
	
	try (Session session = HibernateUtil.getSessionFactory().openSession()) {
		// start a transaction
		transaction = session.beginTransaction();
		// get an user object
		user = (Admin) session.createQuery("FROM Admin U WHERE U.ID = :ID").setParameter("ID", id)
                .uniqueResult();
		// commit transaction
		transaction.commit();
	} catch (Exception e) {
		if (transaction != null) {
			transaction.rollback();
		}
		e.printStackTrace();
	}
	return user;
}


public User selectProfil(String Email) {
	
		Transaction transaction = null;
		User user = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			user = (User) session.createQuery("FROM User U WHERE U.Email = :Email").setParameter("Email", Email)
	                .uniqueResult();			
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return user;
 }
	
public Admin selectProfilAdmin(String Utilizator) {
	
	Transaction transaction = null;
	Admin user = null;
	
	try (Session session = HibernateUtil.getSessionFactory().openSession()) {
		// start a transaction
		transaction = session.beginTransaction();
		// get an user object
		user = (Admin) session.createQuery("FROM Admin U WHERE U.Utilizator = :Utilizator").setParameter("Utilizator", Utilizator)
                .uniqueResult();			
		// commit transaction
		transaction.commit();
	} catch (Exception e) {
		if (transaction != null) {
			transaction.rollback();
		}
		e.printStackTrace();
	}
	return user;
}

public User2 selectProfil2(String Email) {
	
		Transaction transaction = null;
		User2 user = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			user = (User2) session.createQuery("FROM User2 U WHERE U.Email = :Email").setParameter("Email", Email)
	                .uniqueResult();
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return user;
 }
	
public Nevoie selectUserNevoie(int Id_UserNev) {
	
		Transaction transaction = null;
		Nevoie user = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			user = (Nevoie) session.createQuery("FROM Nevoie U WHERE U.Id_UserNev = :Id_UserNev").setParameter("Id_UserNev", Id_UserNev)
	                .uniqueResult();	
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return user;
}
	
public User2 selectUser2(int id_user) {
	
		Transaction transaction = null;
		User2 user = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			user = session.get(User2.class, id_user);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return user;
}
	
public Nevoie selectNevoie(int id) {
	
		Transaction transaction = null;
		Nevoie nev = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			nev = session.get(Nevoie.class, id);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return nev;
 }



	//Operatia de actualizare a datelor folosind Hibernate

public void updateUser(User user) throws SQLException {
		
		Transaction transaction = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			session.saveOrUpdate(user);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
 }
	
public void updateUser2(User2 user) throws SQLException {
		
		Transaction transaction = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			session.saveOrUpdate(user);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
 }
	
public void updateNevoie(Nevoie nev) throws SQLException {
		
		Transaction transaction = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			session.saveOrUpdate(nev);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
 }

public void updateCufar(Cufar cufar) throws SQLException {
	
	Transaction transaction = null;
	
	try (Session session = HibernateUtil.getSessionFactory().openSession()) {
		// start a transaction
		transaction = session.beginTransaction();
		// save the student object
		session.saveOrUpdate(cufar);
		// commit transaction
		transaction.commit();
	} catch (Exception e) {
		if (transaction != null) {
			transaction.rollback();
		}
		e.printStackTrace();
	}
 }
	


	//Operatia 'delete' cu Hibernate

public void deleteUser(int id_user) throws SQLException {
	
		Transaction transaction = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// Delete object
			User user = session.get(User.class, id_user);
			if (user != null) {
				session.delete(user);
				System.out.println("\n");
				System.out.println("------------ Se sterge userul: ------------");
				System.out.println("\n");				
			}
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}	
 }
    
public void deleteCufar(int id_user) throws SQLException {
	
		Transaction transaction = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();

			// Delete a todo object
			Cufar user = session.get(Cufar.class, id_user);
			if (user != null) {
				session.delete(user);
				System.out.println("\n");
				System.out.println("------------ Se sterge userul: ------------");
				System.out.println("\n");				
			}
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}	
 }
	
public void deleteUser2(int id_user) throws SQLException {
	
		Transaction transaction = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();

			// Delete a todo object
			User2 user = session.get(User2.class, id_user);
			if (user != null) {
				session.delete(user);
				System.out.println("\n");
				System.out.println("------------ Se sterge userul: ------------");
				System.out.println("\n");				
			}

			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}	
 }
	
public void deleteNevoie(int id_user) throws SQLException {
	
		Transaction transaction = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();

			// Delete a todo object
			Nevoie nev = session.get(Nevoie.class, id_user);
			if (nev != null) {
				session.delete(nev);
				System.out.println("\n");
				System.out.println("------------ Se sterge nevoiasul: ------------");
				System.out.println("\n");				
			}
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}	
 }

}   
    
    
