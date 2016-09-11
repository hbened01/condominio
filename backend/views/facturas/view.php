<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Facturas */

$this->title = Yii::t('backend', 'Invoice').' N° '.$model->nr;

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

$fecha = $porciones = explode(" ", $model->fecha);
?>
<div class="facturas-view">

    <p>
        <?= Html::a(Yii::t('backend', 'List of Invoices'), ['index'], ['class' => 'btn btn-info']) ?>
    </p>

    <h1><?= Html::encode($this->title) ?></h1>

        <!-- Main content -->
    <section class="invoice">
      <!-- title row -->
      <div class="row">
        <div class="col-xs-12">
          <h2 class="page-header">
            <i class="fa fa-globe"></i> <?= Yii::t('backend', 'Condominium') ?>
            <small class="pull-right"></small>
          </h2>
        </div>
        <!-- /.col -->
      </div>

      <div class="row">
        <div class="col-xs-12">
          <h3>
            <?= Yii::t('backend', 'EXPENSE RELATIONS') ?>
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
              <th style="text-align: right;"><?= Yii::t('backend', 'NR') ?></th>
              <th><?= $model->nr ?></th>
            </tr>
            <tr>
              <th><?= Yii::t('backend', 'Apt.') ?></th>
              <th><?= Yii::t('backend', 'Property') ?></th>
              <th><?= Yii::t('backend', 'Owner') ?></th>
              <th><?= Yii::t('backend', 'Aliquot') ?></th>
              <th><?= Yii::t('backend', 'Month') ?></th>
              <th><?= Yii::t('backend', 'Year') ?></th>
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
              <th style="padding-left:10%"  colspan="3"><?= Yii::t('backend', 'Concept') ?></th>
              <th  style="text-align:right;padding-right:5%"><?= Yii::t('backend', 'Amount') ?></th>
            </tr>
            </thead>
            <tbody>
                <?php 
                    if(!empty($model->gastosComunes)){
                        foreach ($model->gastosComunes as $key => $value) {
                            if ($key == 0) {
                               echo '<tr>
                                        <td colspan="3"><small><strong>'.Yii::t('backend', 'Common Expenses').'</strong></small></td>
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
                    <td><strong><?= Yii::t('backend', 'Total Expenditure Month') ?>:</strong></td>
                    <td><strong><?= number_format($model->total_gastos_mes, 0, ',', '.') ?></strong></td>
                    <td style="text-align:right;"><strong><?= Yii::t('backend', 'Common Expenses Subtotal According to Aliquot') ?>:</strong></td>
                    <td style="text-align:right;padding-right:4%"><strong><?= number_format($model->sub_total_alicuota, 0, ',', '.') ?></strong></td>
                </tr>
                <?php 
                    if(!empty($model->gastosNocomunes)){
                        foreach ($model->gastosNocomunes as $key => $value) {
                            if ($key == 0) {
                               echo '<tr>
                                        <td colspan="3"><small><strong>'.Yii::t('backend', 'No Common Expenses').'</strong></small></td>
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
                    <td colspan="3" style="text-align:right;"><strong><?= Yii::t('backend', 'Total Price Month') ?> <?= $fecha[0] ?>:</strong></td>
                    <td style="text-align:right;padding-right:4%"><strong><?= number_format($model->total_pagar_mes, 0, ',', '.') ?></strong></td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:right;"><strong><?= Yii::t('backend', 'CURRENT DEBT IS SE') ?> <?= $model->recibos ?> <?= Yii::t('backend', 'RECEIPTS FOR Bs') ?> :</strong></td>
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
              <th><?= Yii::t('backend', 'Funds') ?></th>
              <th style="text-align:center;"><?= Yii::t('backend', 'Previous Balance') ?></th>
              <th style="text-align:center;"><?= Yii::t('backend', 'Quota Month') ?></th>
              <th style="text-align:center;"><?= Yii::t('backend', 'Carry') ?></th>
              <th style="text-align:center;"><?= Yii::t('backend', 'Current Balance') ?></th>
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
              echo '<h1>'.Yii::t('backend', 'COPY').'</h1>';
              echo $msn->texto;
              echo '</div>';
            }else{
              echo '<div class="col-xs-12 text-muted well well-sm no-shadow" style="margin-top: 10px;text-align: center;font-size:20px">';
              echo '<h1>'.Yii::t('backend', 'ORIGINAL').'</h1>';
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
          <?= (in_array(Yii::$app->controller->id.'-factura-pdf',$operaciones)) ? Html::a('<span class="fa fa-download"></span>&nbsp&nbsp'.Yii::t('backend', 'Generate PDF'), ['facturas/factura-pdf','id' => $model->cd_factura_pk], ['class' => 'btn btn-primary pull-right','style' => 'margin-right: 5px','target' =>'_blan']) : ''  ?>
        </div>
      </div>
    </section>

</div>