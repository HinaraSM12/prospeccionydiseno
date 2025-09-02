<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableUser extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('usuario', function(Blueprint $table)
		{
			//
                    $table->increments('id');
                    $table->string('nombres');
                    $table->string('apellidos');
                    $table->string('usuario')->unique();
                    $table->string('password');
                    $table->rememberToken();
                    $table->timestamps();
                    
		});
                
                Schema::create('peptido', function(Blueprint $table)
		{
			//
            /*      $table->increments('codigo');
                    $table->string('especie');
                    $table->string('nombre');
                    $table->string('secuencia')->unique()->nullable()->default('NULL');
                    $table->integer('tamano');
                    $table->string('senal')->nullable()->default('NULL');
                    $table->string('propeptido')->nullable()->default('NULL');
                    $table->string('actividad')->nullable()->default('NULL');
                    $table->string('estructura')->nullable()->default('NULL');
                    $table->string('referencia');
                    $table->integer('carga_neta');
                    $table->decimal('hidrofobicidad',10,0);
                    $table->decimal('indice_boman',10,0)->nullable();
                    $table->integer('aminoacidos_misma_superficie')->nullable();
                    $table->string('prediccion_estructura')->nullable();
                    $table->decimal('indice_alifatico',10,0)->nullable();
                    $table->string('uniprot')->nullable();
                    $table->timestamps();*/
					
					$table->increments('Codigo');
                    $table->string('Especie');
                    $table->string('Nombre');
                    $table->string('Secuencia')->unique()->nullable()->default('NULL');
                    $table->integer('Num_aas');
					$table->decimal('Peso_molecular',7,2);
                    $table->string('Estructura',100);
                    $table->decimal('Carga_neta',2,1);
                    $table->decimal('pl',3,1);
                    $table->decimal('Hidrofobicidad',3,2);
                    $table->decimal('Indice_Boman',3,2);
                    $table->decimal('Indice_alifatico',6,3);
                    $table->decimal('pct_aas_hidrofobicos',4,2);
                    $table->string('Actividad',100);
					$table->string('Origen',100);
					$table->string('Referencia',200);
					$table->string('Link',200);
					$table->string('Accion',100);
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
            Schema::drop('usuario');
            Schema::drop('peptido');
	}

}
