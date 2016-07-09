<?php

/* @var $this yii\web\View */
/* @var $name string */
/* @var $message string */
/* @var $exception Exception */

use yii\helpers\Html;

$this->title = $name;
?>

<section id="error" class="container text-center">
        <h1><?= Html::encode('404, Page not found') ?></h1>
        <p><?= Html::encode("The Page you are looking for doesn't exist or an other error occurred.") ?></p>
        <a class="btn btn-primary" <?= Html::a('GO BACK TO THE HOMEPAGE', ['site/index'],['data' => [ 'method' => 'post',]]) ?></a>
</section><!--/#error-->


