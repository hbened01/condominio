<?php

use yii\helpers\Html;
use frontend\assets\CorlateAsset;
/* @var $this yii\web\View */
/* @var $model backend\models\Facturas */

$this->title = Yii::t('frontend', 'Invoice N°').$model->nr;

$fecha = $porciones = explode(" ", $model->fecha);
CorlateAsset::register($this);
?>

<section id="facturas-view">
    <div class="container">
        <h2 align="center"><span class="glyphicons glyphicons-invoice"></span>&nbsp<?= (Html::encode($this->title)) ?></h2>
         <!-- Main content -->
        <section class="invoice">
          <!-- title row -->
          <div class="row">
            <div class="col-xs-12">
              <h2 class="page-header">
                <small class="pull-right"></small>
              </h2>
            </div>
            <!-- /.col -->
          </div>

          <div class="row">
            <div class="col-xs-12">
              <h3>
                RELACIONES DE GASTOS
              </h3>
            </div>
            <!-- /.col -->
          </div>

          <!-- Table row -->
          <div class="row">
            <div class="col-xs-12 table-responsive">
              <table class="table table-striped">
                <thead>
                <tr>
                  <th colspan="4"></th>
                  <th style="text-align: right;">NR</th>
                  <th><?= $model->nr ?></th>
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
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->

          <!-- Table row -->
          <div class="row">
            <div class="col-xs-12 table-responsive">
              <table class="table table-striped">
                <thead>
                <tr>
                  <th style="padding-left:10%"  colspan="3">Concepto</th>
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
                        <td><strong>Subtotal Gastos Comunes seg&uacute;n al al&iacute;cuota</strong></td>
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
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->

          <!-- Table row -->
          <div class="row">
            <div class="col-xs-12 table-responsive">
              <table class="table table-striped">
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
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->

          <div class="row">
              <!-- accepted payments column -->
              <?php 
                  if (($model->estatus_factura && $model->total_deducible != 0) || (!$model->estatus_factura)) {
                    echo '<div class="col-xs-12 text-muted well well-sm no-shadow" style="margin-top: 10px;text-align: center;font-size:20px">';
                    echo '<h1><font color="black">COPIA</font></h1>';
                    echo $msn->texto;
                    echo '</div>';
                  }
              ?>
              
          </div>
            <!-- /.row -->
            <!-- this row will not appear when printing -->
            <div class="row no-print">
            <div class="col-xs-12">
              <p>
                  <?= Html::a('<span class="glyphicons glyphicons-unshare"></span>&nbsp'.Yii::t('frontend', 'Back to List'), ['index'], ['class' => 'btn btn-info pull-right', 'style' => 'margin-right: 5px']) ?>
                  <?= Html::a('<span class="glyphicons glyphicons-download-alt"></span>&nbsp'.Yii::t('frontend', 'Generate PDF'), ['facturas/factura-pdf','id' => $model->cd_factura_pk], ['class' => 'btn btn-danger pull-right', 'style' => 'margin-right: 5px','target' =>'_blan']) ?>
              </p>

            </div>
          </div>
        </section>
    </div>
</section>