<?php

/* @var $this yii\web\View */
/* @var $name string */
/* @var $message string */
/* @var $exception Exception */

use yii\helpers\Html;

$this->title = $name;
?>

<section id="error" class="container text-center">
        <i class="fa fa-exclamation-triangle fa-5x"></i>
        <h1><?= Html::encode(Yii::t('frontend', '404, Page not found')) ?></h1>
        <p><?= Html::encode(Yii::t('frontend', "The Page you are looking for doesn't exist or an other error occurred.")) ?></p>
        <a class="btn btn-primary" <?= Html::a(Yii::t('frontend', 'GO BACK TO THE HOMEPAGE'), ['site/index'],['data' => [ 'method' => 'post',]]) ?></a>
</section><!--/#error-->


