<?php

/* @var $this \yii\web\View */
/* @var $content string */

use backend\assets\DashboardAsset;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\Breadcrumbs;
use common\widgets\Alert;

$views = array('cd-pagos-index');
if (in_array(Yii::$app->controller->id.'-'.Yii::$app->controller->action->id,$views)) {
    $asset = backend\assets\AppAsset::register($this);
}else{
    $asset = backend\assets\DashboardAsset::register($this);
}

$baseUrl = $asset->baseUrl;
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
                                          // Html::beginForm(['/site/logout'], 'post').
                                          // Html::submitButton('Logout. ( ' . Yii::$app->user->identity->username . ' ) <i class="fa fa-power-off"></i> ',['class' => 'btn btn-default btn-flat']).
                                          // Html::endForm();
                                    Html::a(Yii::t('frontend', 'Logout').'( ' . Yii::$app->user->identity->username . ' )  <i class="fa fa-power-off"></i>', ['/site/logout'], ['data' => ['confirm' => Yii::t('frontend', 'Sure to log off?'), 'method' => 'post'],'class' => 'btn btn-default btn-flat']);
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
                      <li><a href="<?= Url::base(); ?>/operaciones"><i class="glyphicons glyphicons-calculator"></i>&nbsp&nbsp Operaciones</a></li>
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
                      <li><a href="<?= Url::base(); ?>/cd-propietarios"><i class="glyphicons glyphicons-user"></i>&nbsp&nbsp Propietarios</a></li>
                    <?php endif;?>
                    <?php if(in_array('cd-conceptos-index',$operaciones)): ?>
                      <li><a href="<?= Url::base(); ?>/cd-conceptos"><i class="fa fa-list-ol"></i> Conceptos</a> </li>
                    <?php endif;?>
                    <?php if(in_array('cd-conjuntos-index',$operaciones)): ?>
                      <li><a href="<?= Url::base(); ?>/cd-conjuntos"><i class="glyphicons glyphicons-show-thumbnails"></i>&nbsp&nbsp Conjuntos</a></li>
                    <?php endif;?>
                    <?php if(in_array('cd-edificios-index',$operaciones)): ?>
                      <li><a href="<?= Url::base(); ?>/cd-edificios"><i class="glyphicons glyphicons-building"></i>&nbsp&nbsp Edificios</a></li>
                    <?php endif;?>
                    <?php if(in_array('files-file-load',$operaciones)): ?>
                      <li><a href="<?= Url::base(); ?>/files/file-load"><i class="glyphicons glyphicons-cloud-upload"></i>&nbsp&nbsp Carga de Archivo</a></li>
                    <?php endif;?>
                  </ul>
                </li>
                <li class="treeview">
                  <a href="#">
                    <i class="glyphicons glyphicons-invoice"></i>&nbsp&nbsp 
                    <span>Facturas</span>
                    <i class="fa fa-angle-left pull-right"></i>
                  </a>
                  <ul class="treeview-menu">
                    <?php if(in_array('facturas-index',$operaciones)): ?>
                      <li><a href="<?= Url::base(); ?>/facturas"><i class="glyphicons glyphicons-list"></i>&nbsp&nbsp Lista de Facturas</a></li>
                    <?php endif;?>
                    <?php if(in_array('mensajes-index',$operaciones)): ?>
                      <li><a href="<?= Url::base(); ?>/mensajes"><i class="glyphicons glyphicons-folder-open"></i>&nbsp&nbsp Mensajes</a></li>
                    <?php endif;?>
                    <?php if(in_array('cd-pagos-index',$operaciones)): ?>
                      <li><a href="<?= Url::base(); ?>/cd-pagos"><i class="glyphicons glyphicons-fees-payments"></i>&nbsp&nbsp Lista de Pagos</a></li>
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
                    <?php 
                        foreach (Yii::$app->session->getAllFlashes() as $key => $message) {
                          echo '<div class="alert alert-' . $key . '">
                                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>'
                                  . $message . 
                               '</div>';
                        }
                    ?>
                    <?= $content ?>
                </section>
            </div>

            <footer class="main-footer">
              <div class="pull-right hidden-xs">
                Desarrollado por <a href="http://hjtecnosystems.com.ve"  target="_blank">HJ TECNOSYSTEMS</a>
              </div>
              <strong>Copyright &copy; <?php echo date('Y') ?></strong> All rights
              reserved.
            </footer>
        </div>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
