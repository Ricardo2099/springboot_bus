package com.j.c.proyecto.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class PasswordInvalidoException extends RuntimeException {
    public PasswordInvalidoException() {
        super("La contraseña debe tener al menos 8 caracteres");
    }
}