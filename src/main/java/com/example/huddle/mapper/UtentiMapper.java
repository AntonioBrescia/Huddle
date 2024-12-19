package com.example.huddle.mapper;

import com.example.huddle.dto.UtentiDTO;
import com.example.huddle.entities.Utenti;

public class UtentiMapper {

    // Mappare Utenti a UtentiDTO
    public UtentiDTO toDto(Utenti entity) {
        if (entity == null) {
            return null;
        }

        return new UtentiDTO(
                entity.getUser_id(),
                entity.getEmail(),
                entity.getPassword(),
                entity.getNome_cognome(),
                entity.getRegistrato_il(),
                entity.getAutenticazione_provider(),
                entity.isIs_active());
    }

    // Mappare UtentiDTO a Utenti
    public Utenti toEntity(UtentiDTO dto) {
        if (dto == null) {
            return null;
        }

        Utenti entity = new Utenti();
        entity.setUser_id(dto.getUser_id());
        entity.setEmail(dto.getEmail());
        entity.setPassword(dto.getPassword());
        entity.setNome_cognome(dto.getNome_cognome());
        entity.setRegistrato_il(dto.getRegistrato_il());
        entity.setAutenticazione_provider(dto.getAutenticazione_provider());
        entity.setIs_active(dto.isIs_active());
        return entity;
    }
}
