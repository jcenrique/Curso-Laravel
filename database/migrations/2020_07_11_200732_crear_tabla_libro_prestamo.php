<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CrearTablaLibroPrestamo extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('libro_prestamo', function (Blueprint $table) {
            $table->id();
           
            $table->foreignId('user_id')->constrained()->onDelete('restrict')->onUpdate('restrict');
          
            $table->foreignId('libro_id')->constrained()->onDelete('restrict')->onUpdate('restrict');
            $table->date('feche_prestamo');
            $table->string('presatado_a', 100);
            $table->boolean('estado');
            $table->date('feche_devolucion')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('libro_prestamo');
    }
}
