package com.codeclan.example.pirateservice_d1_starter.models;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "ships")
public class Ship {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name="type")
    @Enumerated(value = EnumType.STRING)
    private ShipType shipType;

    @JsonIgnore
    @OneToMany(mappedBy = "ship")
    private List<Pirate> pirates;

    public Ship(String name, ShipType shipType) {
        this.name = name;
        this.shipType = shipType;
        this.pirates = new ArrayList<>();
    }

    public Ship() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Pirate> getPirates() {
        return pirates;
    }

    public void setPirates(List<Pirate> pirates) {
        this.pirates = pirates;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public ShipType getShipType() {
        return shipType;
    }

    public void setShipType(ShipType shipType) {
        this.shipType = shipType;
    }
}
