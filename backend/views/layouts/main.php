<?php

/* @var $this \yii\web\View */
/* @var $content string */

use backend\assets\DashboardAsset;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\Breadcrumbs;
use common\widgets\Alert;

$asset = backend\assets\DashboardAsset::register($this);
$baseUrl = $asset->baseUrl;
//DashboardAsset::register($this);
$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
        <meta charset="<?= Yii::$app->charset ?>">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <?= Html::csrfMetaTags() ?>
        <title><?= Html::encode($this->title) ?></title>
        <?php $this->head() ?>
</head>
<body class="hold-transition skin-blue sidebar-mini">
        <?php $this->beginBody() ?>
        <div class="wrapper">
                <header class="main-header">
                    <!-- Logo -->
                    <a href="index2.html" class="logo">
                          <!-- mini logo for sidebar mini 50x50 pixels -->
                          <span class="logo-mini"><b>Cond.</b></span>
                          <!-- logo for regular state and mobile devices -->
                          <span class="logo-lg"><b>Condominio</b> Admin.</span>
                    </a>
                    <!-- Header Navbar: style can be found in header.less -->
                    <nav class="navbar navbar-static-top">
                      <!-- Sidebar toggle button-->
                      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                      </a>

                      <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                          <!-- User Account: style can be found in dropdown.less -->
                          <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                              <img src="<?=$baseUrl?>/dist/img/user.png" class="user-image" alt="User Image">
                              <span class="hidden-xs"><?= Yii::$app->user->identity->username ?></span>
                            </a>
                            <ul class="dropdown-menu">
                              <!-- Menu Footer-->
                              <li class="user-footer">
                                <div class="pull-left">
                                </div>
                                <div class="pull-right">
                                    <?=  
                                          Html::beginForm(['/site/logout'], 'post').
                                          Html::submitButton('Logout. ( ' . Yii::$app->user->identity->username . ' ) <i class="fa fa-power-off"></i> ',['class' => 'btn btn-default btn-flat']).
                                          Html::endForm();
                                     ?>
                                </div>
                              </li>
                            </ul>
                          </li>
                          <!-- Control Sidebar Toggle Button -->
                        </ul>
                      </div>
                    </nav>
                  </header>
                <!-- Left side column. contains the logo and sidebar -->
          <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
              <!-- Sidebar user panel -->
              <div class="user-panel">
                <div class="pull-left image">
                  <img src="<?=$baseUrl?>/dist/img/user.png" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                  <p><?= Yii::$app->user->identity->username ?></p>
                  <i class="fa fa-circle text-success"></i> Online
                </div>
              </div>
              <!-- sidebar menu: : style can be found in sidebar.less -->
              <ul class="sidebar-menu">
                <li class="header">MENU PRINCIPAL</li>
                <li class="treeview">
                  <a href="<?= Url::base(); ?>/site/index">
                    <i class="fa fa-dashboard"></i> <span>Dashboard</span></i>
                  </a>
                </li>
                <li class="treeview">
                  <a href="#">
                    <i class="fa fa-cogs"></i>
                    <span>Configuración</span>
                    <i class="fa fa-angle-left pull-right"></i>
                  </a>
                  <ul class="treeview-menu">
                    <?php if(in_array('user-index',$operaciones)): ?>
                      <li><a href="<?= Url::base(); ?>/user"><i class="fa fa-user"></i> Usuarios</a> </li>
                    <?php endif;?>
                    <?php if(in_array('operaciones-index',$operaciones)): ?>
                      <li><a href="<?= Url::base(); ?>/operaciones"><i class="fa fa-calculator"></i> Operaciones</a></li>
                    <?php endif;?>
                    <?php if(in_array('roles-index',$operaciones)): ?>
                      <li><a href="<?= Url::base(); ?>/roles"><i class="fa fa-users"></i> Roles</a></li>
                    <?php endif;?>
                  </ul>
                </li>
                <li class="treeview">
                  <a href="#">
                    <i class="fa fa-database"></i>
                    <span>Mantenimiento</span>
                    <i class="fa fa-angle-left pull-right"></i>
                  </a>
                  <ul class="treeview-menu">
                    <?php if(in_array('cd-propietarios-index',$operaciones)): ?>
                      <li><a href="<?= Url::base(); ?>/cd-propietarios"><i class="glyphicons glyphicons-user"></i> Propietarios</a></li>
                    <?php endif;?>
                    <?php if(in_array('cd-conceptos-index',$operaciones)): ?>
                      <li><a href="<?= Url::base(); ?>/cd-conceptos"><i class="fa fa-list-ol"></i> Conceptos</a> </li>
                    <?php endif;?>
                    <?php if(in_array('cd-conjuntos-index',$operaciones)): ?>
                      <li><a href="<?= Url::base(); ?>/cd-conjuntos"><i class="fa fa-building-o"></i> Conjuntos</a></li>
                    <?php endif;?>
                    <?php if(in_array('files-file-load',$operaciones)): ?>
                      <li><a href="<?= Url::base(); ?>/files/file-load"><i class="fa fa-building-o"></i> Carga de Archivo</a></li>
                    <?php endif;?>
                  </ul>
                </li>
              </ul>
            </section>
            <!-- /.sidebar -->
          </aside>
              <!-- Content Wrapper. Contains page content -->
          <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                  <h1>
                    Dashboard
                    <small>Control panel</small>
                  </h1>
                  <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">Dashboard</li>
                  </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                     <?= Alert::widget() ?>
                    <?= $content ?>
                </section>
            </div>
        </div>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
