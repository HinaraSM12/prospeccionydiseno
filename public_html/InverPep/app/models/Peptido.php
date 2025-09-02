<?php

class Peptido extends Eloquent {
    // Aqui lo que estoy diciendo, es que esta $table hace referencia a la tabla publicacion
    // de mi BD. Con eso puedo hacer todo tipo de consultas.
    protected $table = 'peptido';
    
    public function freshTimestamp() {
        return format('Y-m-d h:i:s');
    }
}