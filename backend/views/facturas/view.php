<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Facturas */

$this->title = 'Factura N° '.$model->nr;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Facturas'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

$fecha = $porciones = explode(" ", $model->fecha);
?>
<div class="facturas-view">

    <p>
        <?= Html::a(Yii::t('app', 'Lista de Facturas'), ['index'], ['class' => 'btn btn-info']) ?>
    </p>

    <h1><?= Html::encode($this->title) ?></h1>

        <!-- Main content -->
    <section class="invoice">
      <!-- title row -->
      <div class="row">
        <div class="col-xs-12">
          <h2 class="page-header">
            <i class="fa fa-globe"></i> Condominio
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
              echo '<h1>COPIA</h1>';
              echo $msn->texto;
              echo '</div>';
            }else{
              echo '<div class="col-xs-12 text-muted well well-sm no-shadow" style="margin-top: 10px;text-align: center;font-size:20px">';
              echo '<h1>ORIGINAL</h1>';
              echo 'RECIBIMOS DEL PROPIETARIO CUYO NOMBRE APARECE MAS ARRIBA, LA CUOTA DE LOS GASTOS DE CONDOMINIO DE SU APARTAMENTO CORRESPONDIENTE AL MES POR MEDIO DE LOS SIGUIENTES PAGOS:';
              echo '<br><br>';

              foreach ($model->cdPagos as $key => $value) {
                echo '<strong>Pago '.($key+1).'</strong>: '.$value->codTipoPago->descrip_pago.' - BANCO '.$value->codBancos->nombre.' - MONTO Bs. '.number_format($value->monto,2,',','.').'<br>';
              }

              echo '</div>';
            }
        ?>
        
    </div>
      <!-- /.row -->

      <!-- this row will not appear when printing -->
      <div class="row no-print">
        <div class="col-xs-12">
          <!-- <a href="invoice-print.html" target="_blank" class="btn btn-default"><i class="fa fa-print"></i> Print</a> -->
          <!-- <button type="button" class="btn btn-success pull-right"><i class="fa fa-credit-card"></i> Submit Payment -->
          <!-- </button> -->
          <!-- <button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;"> -->
            <!-- <i class="fa fa-download"></i> Generate PDF -->
          <!-- </button> -->
          <?= (in_array(Yii::$app->controller->id.'-factura-pdf',$operaciones)) ? Html::a(Yii::t('backend', '<i class="fa fa-download"></i> Generate PDF'), ['facturas/factura-pdf','id' => $model->cd_factura_pk], ['class' => 'btn btn-primary pull-right','style' => 'margin-right: 5px','target' =>'_blan']) : ''  ?>
        </div>
      </div>
    </section>

</div>