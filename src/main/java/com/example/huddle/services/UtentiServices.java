package com.example.huddle.services;

import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.huddle.dto.UtentiDTO;
import com.example.huddle.entities.Utenti;
import com.example.huddle.mapper.UtentiMapper;
import com.example.huddle.repository.UtentiRepository;

@Service
public class UtentiServices {
    @Autowired
    private UtentiRepository utentiRepository;

    private final UtentiMapper utentiMapper = new UtentiMapper(); // Usa un'istanza

    public List<UtentiDTO> getAllUtenti() {
        List<Utenti> utenti = utentiRepository.findAll();
        return utenti.stream()
                .map(utentiMapper::toDto) // Metodo non statico chiamato su un'istanza
                .collect(Collectors.toList());
    }

    public UtentiDTO getUtenteByUsernameAndPassword(UtentiDTO utentiDTO) {
        Utenti utenti = utentiRepository.findByEmailAndPassword(utentiDTO.getEmail(), utentiDTO.getPassword());
        if (utenti != null) {
            return utentiMapper.toDto(utenti);
        }
        throw new RuntimeException("Utente non trovato");
    }

}
