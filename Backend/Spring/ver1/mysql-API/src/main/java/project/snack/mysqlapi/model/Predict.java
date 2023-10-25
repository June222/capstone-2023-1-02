package project.snack.mysqlapi.model;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Setter
@Getter
@Entity
@Table(name="predict")
public class Predict {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    private Origin origin;
    private Integer defectLabel;
    private String imageUrl;
}
