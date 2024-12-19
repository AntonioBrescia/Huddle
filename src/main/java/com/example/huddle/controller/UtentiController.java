package com.example.huddle.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.huddle.dto.UtentiDTO;
import com.example.huddle.services.UtentiServices;

@RestController
@RequestMapping("api/v1/utenti")
public class UtentiController {
    @Autowired
    UtentiServices utentiServices;

    @GetMapping()
    public ResponseEntity<List<UtentiDTO>> getAllUtenti() {
        List<UtentiDTO> utenti = utentiServices.getAllUtenti();
        return new ResponseEntity<>(utenti, HttpStatus.OK);
    }

    @PostMapping("/login")
    public ResponseEntity<UtentiDTO> getUtenteByUsernameAndPassword(@RequestBody UtentiDTO utentiDTO) {
        try {
            UtentiDTO utente = utentiServices.getUtenteByUsernameAndPassword(utentiDTO);
            return new ResponseEntity<>(utente, HttpStatus.OK);

        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND); // Utente non trovato
        }
    }
}
