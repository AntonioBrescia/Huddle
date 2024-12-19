package com.example.huddle.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.huddle.entities.Utenti;

public interface UtentiRepository extends JpaRepository<Utenti, Integer> {
    Utenti findByEmailAndPassword(String email, String password);

}
