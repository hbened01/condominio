<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

$fecha = $porciones = explode(" ", $model->fecha);
?>
<div class="facturas-view">

        <!-- Main content -->
    <section class="invoice">

      <!-- <div class="row">
        <div class="col-xs-12">
          <h3 style="font-size:10px;">
            RELACIONES DE GASTOS
          </h3>
        </div>
      </div> -->

      <!-- Table row -->
      <!-- <div class="row">
        <div class="col-xs-12 table-responsive"> -->
          <table class="table table-striped" style="font-size:10px;">
            <thead>
            <tr>
              <th colspan="4" style="border-top:0">RELACIONES DE GASTOS</th>
              <th style="text-align: right;border-top:0">NR</th>
              <th style="border-top:0"><?= $model->nr ?></th>
            </tr>
            <tr>
              <th>Apto.</th>
              <th>Inmueble</th>
              <th>Propietario</th>
              <th>Al&iacute;cuota</th>
              <th>Mes</th>
              <th>Año</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td><?= $model->cod_apto ?></td>
              <td><?= $model->edificio ?></td>
              <td><?= $model->nombre ?></td>
              <td><?= $model->alicuota ?></td>
              <td><?= $fecha[0] ?></td>
              <td><?= $fecha[1] ?></td>
            </tr>
            </tbody>
          </table>
        <!-- </div> -->
        <!-- /.col -->
      <!-- </div> -->
      <!-- /.row -->

      <!-- Table row -->
      <!-- <div class="row">
        <div class="col-xs-12 table-responsive"> -->
          <table class="table table-striped" style="font-size:10px;">
            <thead>
            <tr>
              <th  colspan="3" style="padding-left:10%">Concepto</th>
              <th  style="text-align:right;padding-right:5%">Monto</th>
            </tr>
            </thead>
            <tbody>
                <?php 
                    if(!empty($model->gastosComunes)){
                        foreach ($model->gastosComunes as $key => $value) {
                            if ($key == 0) {
                               echo '<tr>
                                        <td colspan="3"><small><strong>Gastos Comunes</strong></small></td>
                                        <td></td>
                                    </tr>';
                            }

                            echo '<tr>
                                    <td colspan="3">'.$value->descripcion.'</td>
                                    <td style="text-align:right;padding-right:4%">'.number_format($value->monto, 0, ',', '.').'</td>
                                </tr>';
                        }
                    }
                ?>
                <tr>
                    <td><strong>Total gastos en el mes......</strong></td>
                    <td><strong><?= number_format($model->total_gastos_mes, 0, ',', '.') ?></strong></td>
                    <td style="text-align:right;"><strong>Subtotal Gastos Comunes seg&uacute;n al al&iacute;cuota</strong></td>
                    <td style="text-align:right;padding-right:4%"><strong><?= number_format($model->sub_total_alicuota, 0, ',', '.') ?></strong></td>
                </tr>
                <?php 
                    if(!empty($model->gastosNocomunes)){
                        foreach ($model->gastosNocomunes as $key => $value) {
                            if ($key == 0) {
                               echo '<tr>
                                        <td colspan="3"><small><strong>Gastos no Comunes</strong></small></td>
                                        <td></td>
                                    </tr>';
                            }

                            echo '<tr>
                                    <td colspan="3">'.$value->descripcion.'</td>
                                    <td style="text-align:right;padding-right:4%">'.number_format($value->monto, 0, ',', '.').'</td>
                                </tr>';
                        }
                    }
                ?>
                <tr>
                    <td colspan="3" style="text-align:right;"><strong>Total a pagar mes <?= $fecha[0] ?></strong></td>
                    <td style="text-align:right;padding-right:4%"><strong><?= number_format($model->total_pagar_mes, 0, ',', '.') ?></strong></td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:right;"><strong>SE DEUDA ACTUAL ES DE <?= $model->recibos ?> RECIBOS POR Bs</strong></td>
                    <td style="text-align:right;padding-right:4%"><strong><?= number_format($model->total_pagar_mes, 0, ',', '.') ?></strong></td>
                </tr>
            </tbody>
          </table>
        <!-- </div>
      </div> -->

      <!-- Table row -->
     <!--  <div class="row">
        <div class="col-xs-12 table-responsive"> -->
          <table class="table table-striped" style="font-size:10px;margin:0">
            <thead>
            <tr>
              <th>Fondos</th>
              <th style="text-align:center;">Saldo anterio</th>
              <th style="text-align:center;">Cuota del mes</th>
              <th style="text-align:center;">Cargo</th>
              <th style="text-align:center;">Saldo actual</th>
            </tr>
            </thead>
            <tbody>
                <?php 
                    if(!empty($model->fondos)){
                        foreach ($model->fondos as $key => $value) {
                            echo '<tr>
                                    <td>'.$value->descripcion.'</td>
                                    <td style="text-align:right;padding-right:4%">'.number_format($value->saldo_anterior, 0, ',', '.').'</td>
                                    <td style="text-align:right;padding-right:4%">'.number_format($value->cota_mes, 0, ',', '.').'</td>
                                    <td style="text-align:right;padding-right:4%">'.number_format($value->cargo, 0, ',', '.').'</td>
                                    <td style="text-align:right;padding-right:4%">'.number_format($value->saldo_actual, 0, ',', '.').'</td>
                                </tr>';
                        }
                    }
                ?>
            </tbody>
          </table>
       <!--  </div>
      </div>
 -->
    <!-- <div class="row"> -->
        <!-- accepted payments column -->
        <div style="margin-top: 5px;text-align: center;font-size:10px">
            <?php 
                if (($model->estatus_factura && $model->total_deducible != 0) || (!$model->estatus_factura)) {
                    echo "<h1 style='font-size:15px;'>COPIA</h1>";
                    echo $msn->texto;
                }
            ?>
        </div>
    <!-- </div> -->
      <!-- /.row -->
    </section>

</div>
