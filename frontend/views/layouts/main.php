<?php

/* @var $this \yii\web\View */
/* @var $content string */

use frontend\assets\LoginAsset;
use frontend\assets\CorlateAsset;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\Breadcrumbs;
use common\widgets\Alert;
use yii\grid\GridView;

$asset = frontend\assets\CorlateAsset::register($this);
$baseUrl = $asset->baseUrl;

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
<body class="homepage">
<?php $this->beginBody() ?>   
        <header id="header">
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-4">
                        <div class="top-number"><p><i class="fa fa-phone-square"></i>  +0123 456 70 90</p></div>
                    </div>
                    <!-- <div class="col-sm-6 col-xs-8">
                       <div class="social">
                            <ul class="social-share">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li> 
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                <li><a href="#"><i class="fa fa-skype"></i></a></li>
                            </ul>
                            <div class="search">
                                <form role="form">
                                    <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                                    <i class="fa fa-search"></i>
                                </form>
                           </div>
                       </div>
                    </div> -->
                </div>
            </div>
        </div>

        <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html"><img src="<?=$baseUrl?>/dist/img/logo_condominio.png" alt="logo"></a>
                </div>
                
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li><?= Html::a(Yii::t('frontend', 'Home'), (!Yii::$app->user->isGuest) ? ['facturas/index'] : ['/site/login'], ['data' => ['method' => 'post']]) ?></li>
                        <!-- <li><?//= Html::a(Yii::t('frontend', 'About Us'), ['site/about'],['data' => ['method' => 'post']]) ?></li> -->
                        <li><?= Html::a(Yii::t('frontend', 'Contact'), ['site/contact'],['data' => ['method' => 'post']]) ?></li> 
                        <?php   if (Yii::$app->user->isGuest) {
                                    //echo '<li>'.Html::a(Yii::t('frontend', 'Login'), ['/site/login'],['data' => ['method' => 'post']]).'</li>';
                                } 
                                else {
                                    echo '<li class="dropdown">
                                            <a href="" class="dropdown-toggle" data-toggle="dropdown">'.Yii::t('frontend', 'Activities').'&nbsp'.'<i class="fa fa-angle-double-down"></i></a>
                                            <ul class="dropdown-menu">';
                                    if (Yii::$app->session->get('user.update_usr')) {   
                                        echo   '<li>'.Html::a(Yii::t('frontend', 'Update data'), ['cd-propietarios/update'/*, 'id_user' => Yii::$app->user->id*/]).'</li>';

                                    } else {
                                        Yii::$app->session->remove('user.update_usr');
                                    }
                                    echo       '<li>'.Html::a(Yii::t('frontend', 'Payment Record'), ['cd-pagos/']).'</li>';
                                    echo       '<li>'.Html::a(Yii::t('frontend', 'My bills'), ['facturas/']).'</li>';
                                    echo    '</ul>
                                         </li>';
                                    echo '<li>'.Html::a(Yii::t('frontend', 'Logout').'( ' . Yii::$app->user->identity->username . ' )  <i class="fa fa-power-off"></i>', ['/site/logout'], ['data' => ['confirm' => Yii::t('frontend', 'Sure to log off?'), 'method' => 'post',]]).'</li>';
                                }                  
                        ?> 
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
        
    </header><!--/header--> 
    
    <!-- Main content -->
    <?= Alert::widget() ?>
    <?= $content ?>

    <!-- <section id="bottom">
        <div class="container wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>Company</h3>
                        <ul>
                            <li><a href="#">About us</a></li>
                            <li><a href="#">We are hiring</a></li>
                            <li><a href="#">Meet the team</a></li>
                            <li><a href="#">Copyright</a></li>
                            <li><a href="#">Terms of use</a></li>
                            <li><a href="#">Privacy policy</a></li>
                            <li><a href="#">Contact us</a></li>
                        </ul>
                    </div>    
                </div>

                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>Support</h3>
                        <ul>
                            <li><a href="#">Faq</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Forum</a></li>
                            <li><a href="#">Documentation</a></li>
                            <li><a href="#">Refund policy</a></li>
                            <li><a href="#">Ticket system</a></li>
                            <li><a href="#">Billing system</a></li>
                        </ul>
                    </div>    
                </div>

                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>Developers</h3>
                        <ul>
                            <li><a href="#">Web Development</a></li>
                            <li><a href="#">SEO Marketing</a></li>
                            <li><a href="#">Theme</a></li>
                            <li><a href="#">Development</a></li>
                            <li><a href="#">Email Marketing</a></li>
                            <li><a href="#">Plugin Development</a></li>
                            <li><a href="#">Article Writing</a></li>
                        </ul>
                    </div>    
                </div>

                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>Our Partners</h3>
                        <ul>
                            <li><a href="#">Adipisicing Elit</a></li>
                            <li><a href="#">Eiusmod</a></li>
                            <li><a href="#">Tempor</a></li>
                            <li><a href="#">Veniam</a></li>
                            <li><a href="#">Exercitation</a></li>
                            <li><a href="#">Ullamco</a></li>
                            <li><a href="#">Laboris</a></li>
                        </ul>
                    </div>    
                </div>
            </div>
        </div>
    </section> -->

    <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <?php echo date('Y') ?>&nbsp<a target="_blank" href="" title="">HJ TECNOSYSTEMS</a>&nbsp&copy;.&nbsp<?= Yii::t('frontend', 'All Rights Reserved') ?>.
                </div>
                <div class="col-sm-6">
                    <ul class="pull-right">
                        <li><?= Html::a(Yii::t('frontend', 'Home'), (!Yii::$app->user->isGuest) ? ['facturas/index'] : ['/site/login'], ['data' => ['method' => 'post']]) ?></li>
                        <li><?= Html::a(Yii::t('frontend', 'Contact'), ['site/contact'],['data' => ['method' => 'post']]) ?></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer><!--/#footer-->
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
