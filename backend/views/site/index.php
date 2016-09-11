<?php

/* @var $this yii\web\View */

use backend\assets\DashboardAsset;
use yii\helpers\Url;

$this->title = 'Backend-Index';
$asset = backend\assets\DashboardAsset::register($this);
$baseUrl = $asset->baseUrl;

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<section class="content">
      <!-- Main row -->
      <div class="row">
        <!-- Left col -->
        <section class="col-lg-5 connectedSortable">
                    <!-- Calendar -->
          <div class="box box-solid bg-green-gradient">
            <div class="box-header">
              <i class="fa fa-calendar"></i>
              <h3 class="box-title"><?= Yii::t('backend', 'Calendar') ?></h3>
              <!-- tools box -->
              <!-- <div class="pull-right box-tools">
                <button type="button" class="btn btn-success btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div -->>
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <!--The calendar -->
              <div id="calendar" style="width: 100%"></div>
            </div>
          </div>
          <!-- /.box -->
        </section>
        <!-- /.Left col -->
        <!-- right col (We are only adding the ID to make the widgets sortable)-->
        <section class="col-lg-7 connectedSortable">
           <div class="col-lg-6 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3><?= $cant_propietarios ?></h3>
              <p><?= Yii::t('backend', 'Owners') ?></p>
            </div>
            <div class="icon">
              <i class="ion ion-person"></i>
            </div>
            <?php if(in_array('cd-propietarios-index',$operaciones)): ?>
              <a href="<?= Url::base(); ?>/cd-propietarios" class="small-box-footer"><?= Yii::t('backend', 'More info') ?> <i class="fa fa-arrow-circle-right"></i></a>
            <?php endif;?>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-6 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><?= $cant_users ?></h3>
              <p><?= Yii::t('backend', 'Registered Users') ?></p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <?php if(in_array('user-index',$operaciones)): ?>
              <a href="<?= Url::base(); ?>/user" class="small-box-footer"><?= Yii::t('backend', 'More info') ?> <i class="fa fa-arrow-circle-right"></i></a>
            <?php endif;?>
          </div>
        </div>
        <!-- ./col -->
                <div class="col-lg-6 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3><?= $cant_facturas ?></h3>
              <p><?= Yii::t('backend', 'Unpaid Bills') ?></p>
            </div>
            <div class="icon">
              <i class="ion ion-document-text"></i>
            </div>
            <?php if(in_array('facturas-index',$operaciones)): ?>
              <a href="<?= Url::base(); ?>/facturas" class="small-box-footer"><?= Yii::t('backend', 'More info') ?> <i class="fa fa-arrow-circle-right"></i></a>
            <?php endif;?>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-6 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3><?= $cant_pagos ?></h3>
              <p><?= Yii::t('backend', 'Cash Payments') ?></p>
            </div>
            <div class="icon">
              <i class="ion ion-cash"></i>
            </div>
            <?php if(in_array('cd-pagos-index',$operaciones)): ?>
              <a href="<?= Url::base(); ?>/cd-pagos" class="small-box-footer"><?= Yii::t('backend', 'More info') ?> <i class="fa fa-arrow-circle-right"></i></a>
            <?php endif;?>
          </div>
        </div>
        <!-- ./col -->
        </section>
        <!-- right col -->
      </div>
      <!-- /.row (main row) -->
</section>
