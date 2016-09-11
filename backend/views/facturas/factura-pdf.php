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
              <th colspan="4" style="border-top:0"><?= Yii::t('backend', 'EXPENSE RELATIONS') ?></th>
              <th style="text-align: right;border-top:0"><?= Yii::t('backend', 'NR') ?></th>
              <th style="border-top:0"><?= $model->nr ?></th>
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
              <th  colspan="3" style="padding-left:10%"><?= Yii::t('backend', 'Concept') ?></th>
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
        <!-- </div>
      </div> -->

      <!-- Table row -->
     <!--  <div class="row">
        <div class="col-xs-12 table-responsive"> -->
          <table class="table table-striped" style="font-size:10px;margin:0">
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
       <!--  </div>
      </div>
 -->
    <!-- <div class="row"> -->
        <!-- accepted payments column -->
        <div style="margin-top: 5px;text-align: center;font-size:10px">
            <?php 
                if (($model->estatus_factura && $model->total_deducible != 0) || (!$model->estatus_factura)) {
                    echo "<h1 style='font-size:15px;'>".Yii::t('backend', 'COPY')."</h1>";
                    echo $msn->texto;
                }else{
                  echo '<br>';
                  echo "<h1 style='font-size:15px;'>".Yii::t('backend', 'ORIGINAL')."</h1>";
                  echo 'RECIBIMOS DEL PROPIETARIO CUYO NOMBRE APARECE MAS ARRIBA, LA CUOTA DE LOS GASTOS DE CONDOMINIO DE SU APARTAMENTO CORRESPONDIENTE AL MES POR MEDIO DE LOS SIGUIENTES PAGOS:';
                  echo '<br><br>';

                  foreach ($model->cdPagos as $key => $value) {
                    echo '<strong>Pago '.($key+1).'</strong>: '.$value->codTipoPago->descrip_pago.' - BANCO '.$value->codBancos->nombre.' - MONTO Bs. '.number_format($value->monto,2,',','.').'<br>';
                  }
                  echo '<br>';
                  echo 'Cheques devueltos tendrán un recargo del 10% del monto con un mínimo de 5000 Bs.';
                }
            ?>
        </div>
    <!-- </div> -->
      <!-- /.row -->
    </section>

</div>
