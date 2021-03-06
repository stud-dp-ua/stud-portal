
package ua.dp.stud.StudPortalLib.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 *
 * @author Ольга
 */
@Entity
@Table(name = "tags_table")
@PrimaryKeyJoinColumn(name = "id", referencedColumnName = "id")
public class Tags implements Serializable{
    
    public Tags(){       
    }
    
   @ManyToMany(mappedBy = "tags")
   private List<Events> events=new LinkedList<Events>();
    
    private String name;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="tagId")
    private Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    
     public List<Events> getEvents(){
       return this.events; 
    }
    
    public void setEvents(List<Events> events){
        this.events=events;
    }
    
    public void addEvent(Events event){
        this.events.add(event);
    }
    
    @Column(name="name")
      public String getName(){
       return this.name; 
    }
    
    public void setName(String name){
        this.name=name;
    }
    
}
