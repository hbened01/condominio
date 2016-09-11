<?php

/* @var $this yii\web\View */
/* @var $name string */
/* @var $message string */
/* @var $exception Exception */

use yii\helpers\Html;

$this->title = $name;
?>

<br><br><br><br><br><br><br>
<section id="error" class="container text-center">
        <i class="fa fa-exclamation-triangle fa-5x"></i>
        <h1><?= Html::encode(Yii::t('backend', '404, Page not found')) ?></h1>
        <p><?= Html::encode(Yii::t('backend', "The Page you are looking for doesn't exist or an other error occurred.")) ?></p>
        <a class="btn btn-primary" <?= Html::a(Yii::t('backend', 'GO BACK TO THE HOMEPAGE'), ['site/index'],['data' => [ 'method' => 'post',]]) ?></a>
</section><!--/#error-->
<br><br><br><br><br><br><br>