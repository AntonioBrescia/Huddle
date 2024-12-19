package com.example.huddle.dto;

import java.time.LocalDateTime;

public class UtentiDTO {
    private Integer user_id;
    private String email;
    private String password;
    private String nome_cognome;
    private LocalDateTime registrato_il;
    private String autenticazione_provider;
    private boolean is_active;

    // COSTRUTTORE

    public UtentiDTO() {
    }

    public UtentiDTO(Integer user_id, String email, String password, String nome_cognome, LocalDateTime registrato_il,
            String autenticazione_provider, boolean is_active) {
        this.user_id = user_id;
        this.email = email;
        this.password = password;
        this.nome_cognome = nome_cognome;
        this.registrato_il = registrato_il;
        this.autenticazione_provider = autenticazione_provider;
        this.is_active = is_active;
    }

    // GETTER E SETTER
    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNome_cognome() {
        return nome_cognome;
    }

    public void setNome_cognome(String nome_cognome) {
        this.nome_cognome = nome_cognome;
    }

    public LocalDateTime getRegistrato_il() {
        return registrato_il;
    }

    public void setRegistrato_il(LocalDateTime registrato_il) {
        this.registrato_il = registrato_il;
    }

    public String getAutenticazione_provider() {
        return autenticazione_provider;
    }

    public void setAutenticazione_provider(String autenticazione_provider) {
        this.autenticazione_provider = autenticazione_provider;
    }

    public boolean isIs_active() {
        return is_active;
    }

    public void setIs_active(boolean is_active) {
        this.is_active = is_active;
    }

}
