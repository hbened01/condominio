<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\ContactForm */

use frontend\assets\CorlateAsset;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

$this->title = 'Contact';
$asset = frontend\assets\CorlateAsset::register($this);
$baseUrl = $asset->baseUrl;

?>
<section id="contact-info">
    <div class="center">                
        <h2><?= Yii::t('frontend', 'Where are you located?'); ?></h2>
        <h2><?= Yii::t('frontend', 'How to contact us?'); ?></h2>
        <p class="lead"><i class="fa fa-globe"></i>&nbsp
<?= Yii::t('frontend', 'It is very easy to give you all the information below, and plus we give you a contact form to interact with us.'); ?></p>
    </div>
    <div class="gmap-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-5 text-center">
                    <div class="gmap">
                        <iframe frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=JoomShaper,+Dhaka,+Dhaka+Division,+Bangladesh&amp;aq=0&amp;oq=joomshaper&amp;sll=37.0625,-95.677068&amp;sspn=42.766543,80.332031&amp;ie=UTF8&amp;hq=JoomShaper,&amp;hnear=Dhaka,+Dhaka+Division,+Bangladesh&amp;ll=23.73854,90.385504&amp;spn=0.001515,0.002452&amp;t=m&amp;z=14&amp;iwloc=A&amp;cid=1073661719450182870&amp;output=embed"></iframe>
                    </div>
                </div>

                <div class="col-sm-7 map-content">
                    <ul class="row">
                        <li class="col-sm-6">
                            <address>
                                <h5>Head Office</h5>
                                <p>1537 Flint Street <br>
                                Tumon, MP 96911</p>
                                <p>Phone:670-898-2847 <br>
                                Email Address:info@domain.com</p>
                            </address>

                            <address>
                                <h5>Zonal Office</h5>
                                <p>1537 Flint Street <br>
                                Tumon, MP 96911</p>                                
                                <p>Phone:670-898-2847 <br>
                                Email Address:info@domain.com</p>
                            </address>
                        </li>


                        <li class="col-sm-6">
                            <address>
                                <h5>Zone#2 Office</h5>
                                <p>1537 Flint Street <br>
                                Tumon, MP 96911</p>
                                <p>Phone:670-898-2847 <br>
                                Email Address:info@domain.com</p>
                            </address>

                            <address>
                                <h5>Zone#3 Office</h5>
                                <p>1537 Flint Street <br>
                                Tumon, MP 96911</p>
                                <p>Phone:670-898-2847 <br>
                                Email Address:info@domain.com</p>
                            </address>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>  <!--/gmap_area -->

<section id="contact-page">
    <div class="container">
        <div class="center">
            <br><br><br>  
            <h2><?= Yii::t('frontend', 'Write us your message'); ?></h2>
            <p class="lead"><i class="glyphicons glyphicons-pencil"></i>&nbsp<?= Yii::t('frontend', 'Using the form below ask your questions, doubts and we will respond as soon as possible.'); ?></p>
        </div> 
        <div class="row contact-wrap"> 
            <div class="status alert alert-success" style="display: none"></div>
            
            <?php $form = ActiveForm::begin(
                ['id' => 'contact-form',  
                    'fieldConfig' => [
                        'template' => "<div id='main-contact-form' class='contact-form'><div class='form-group'>{label}\n{beginWrapper}\n{input}\n{hint}\n{error}\n{endWrapper}</div></div>",
                        'horizontalCssClasses' => [
                            'label' => 'col-sm-5',
                            'offset' => 'col-sm-offset-1',
                            'wrapper' => 'col-sm-8',
                            'error' => '',
                            'hint' => '',
                        ],
                    ],
                ]); 
            ?>

            <div class="col-sm-5 col-sm-offset-1">

                <?= $form->field($model, 'name')->textInput(['autofocus' => true]) ?>

                <?= $form->field($model, 'email') ?>

                <?= $form->field($model, 'verifyCode')->widget(Captcha::className(), [
                'template' => '<div class="row"><div class="col-lg-6">{image}</div><div class="col-lg-6">{input}</div></div>',
                ]) ?>
        
            </div>

            <div class="col-sm-5">

                <?= $form->field($model, 'subject') ?>

                <?= $form->field($model, 'body')->textArea(['rows' => 8]) ?>

                <?= Html::submitButton(Yii::t('frontend', 'Submit Message'), ['class' => 'btn btn-primary btn-lg', 'name' => 'contact-button']) ?>

            </div>

            <?php ActiveForm::end(); ?>
        </div><!--/.row-->
        <br>
        <br>
        <br>
    </div><!--/.container-->
</section><!--/#contact-page-->
