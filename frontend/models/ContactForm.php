<?php

namespace frontend\models;

use Yii;
use yii\base\Model;

/**
 * ContactForm is the model behind the contact form.
 */
class ContactForm extends Model
{
    public $name;
    public $email;
    public $subject;
    public $body;
    public $verifyCode;


    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            // name, email, subject and body are required
            [['name', 'email', 'subject', 'body'], 'required'],
            // email has to be a valid email address
            ['email', 'email'],
            // verifyCode needs to be entered correctly
            ['verifyCode', 'captcha'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'email' => Yii::t('frontend', 'Email *'),
            'name' => Yii::t('frontend', 'Name *'),
            'subject' => Yii::t('frontend', 'Subject *'),
            'body' => Yii::t('frontend', 'Body *'),
            'verifyCode' => Yii::t('frontend', 'Verification Code *'),
        ];
    }

    /**
     * Sends an email to the specified email address using the information collected by this model.
     *
     * @param string $email the target email address
     * @return boolean whether the email was sent
     */
    public function sendEmail($email)
    {
        $content  = "<p><i><b><u>Email</u></b></i>: " . $this->email . "</p>";
        $content .= "<p><i><b><u>Name</u></b></i>: " . $this->name . "</p>";
        $content .= "<p><i><b><u>Subject</u></b></i>: " . $this->subject . "</p>";
        $content .= "<p><i><b><u>Body</u></b></i><br><br><br>: " . $this->body . "</p>";
        return Yii::$app->mailer->compose("@common/mail/layouts/html", ["content" => $content])
            ->setTo($email)
            ->setFrom([$this->email => $this->name])
            ->setSubject($this->subject)
            ->setTextBody($this->body)
            ->send();

        /*return Yii::$app->mailer->compose()
            ->setTo($email)
            ->setFrom([$this->email => $this->name])
            ->setSubject($this->subject)
            ->setTextBody($this->body)
            //->setHtmlBody($this->body)
            ->send();*/
        //Configuración por defecto de email!!!
    }
}
