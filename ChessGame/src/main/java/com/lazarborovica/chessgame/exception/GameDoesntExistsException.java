package com.lazarborovica.chessgame.exception;

public class GameDoesntExistsException extends RuntimeException{
    public GameDoesntExistsException(String message) {
        super(message);
    }
}
