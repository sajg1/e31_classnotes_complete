package com.example.pirateservice.controllers;

import com.example.pirateservice.models.Pirate;
import com.example.pirateservice.models.Ship;
import com.example.pirateservice.respositories.PirateRepository;
import com.example.pirateservice.respositories.ShipRespository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(value = "/pirates")
public class PirateController {
    @Autowired
    PirateRepository pirateRepository;

}
