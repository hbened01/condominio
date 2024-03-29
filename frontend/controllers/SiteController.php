<?php
namespace frontend\controllers;

use Yii;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use frontend\models\PasswordResetRequestForm;
use frontend\models\ResetPasswordForm;
use frontend\models\SignupForm;
use frontend\models\ContactForm;
use frontend\models\CdPropietarios;
use yii\helpers\Url;

/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout', 'signup'],
                'rules' => [
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        // return $this->render('index');
         if (is_null(Yii::$app->user->identity)){
            if(Yii::$app->controller->route != 'site/login'){
                return $this->redirect(Yii::$app->getUser()->loginUrl);
            }
        }else{
            $user = new CdPropietarios();
            $update_usr = $user->getStatus(Yii::$app->user->identity->username);
            if ($update_usr) {
                return $this->redirect('cd-propietarios/update');
            }
                return $this->redirect('facturas');
        }
    }

    /**
     * Logs in a user.
     *
     * @return mixed
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        $user = new CdPropietarios();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            $defaultUrl = Yii::$app->request->baseUrl;
            $httpsAbsoluteHomeUrl = Url::home('http');
            if (stripos( $httpsAbsoluteHomeUrl,'condominio.hjtecnosystems')) {
                     $url = str_replace('condominio.hjtecnosystems','admin.hjtecnosystems',$httpsAbsoluteHomeUrl);
            }else{
                     $url = str_replace('frontend','backend',$defaultUrl);
            }

            if (Yii::$app->user->identity->rol_id != 3) {
                Yii::$app->user->logout();
                return $this->redirect($url);
            }

            $value = Yii::$app->request->post();  //$_POST['LoginForm']['username']); otra forma de obtener el post!!
            $update_usr = $user->getStatus($value['LoginForm']['username']); 
            Yii::$app->session->set('user.update_usr',$update_usr);
            return $this->goBack();
        } else {
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Logs out the current user.
     *
     * @return mixed
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return mixed
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail(Yii::$app->params['adminEmail'])) {
                Yii::$app->session->setFlash('success', 'Thank you for contacting us. We will respond to you as soon as possible.');
            } else {
                Yii::$app->session->setFlash('error', 'There was an error sending email.');
            }
            return $this->refresh();
        } else {
            return $this->render('contact', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Displays about page.
     *
     * @return mixed
     */
    public function actionAbout()
    {
        return $this->render('about');
    }

    /**
     * Signs user up.
     *
     * @return mixed
     */
    public function actionSignup()
    {   
        $model = new SignupForm();
        $user = new CdPropietarios();
        if ($model->load(Yii::$app->request->post())) {
            $result = $model->signup();
            if (is_object($result)) {
                if (Yii::$app->getUser()->login($result)) {
                    $value = Yii::$app->request->post(); 
                    $update_usr = $user->getStatus($value['SignupForm']['username']); 
                    Yii::$app->session->set('user.update_usr',$update_usr);
                    Yii::$app->session->setFlash('success', 'Usuario registrado correctamente');
                    return $this->goHome();
                }
            }
            else{
                Yii::$app->session->setFlash('error', $result);
            }
        }

        return $this->render('signup', [
            'model' => $model
        ]);
    }

    /**
     * Requests password reset.
     *
     * @return mixed
     */
    public function actionRequestPasswordReset()
    {
        $model = new PasswordResetRequestForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail()) {
                Yii::$app->session->setFlash('success', 'Check your email for further instructions.');
                return $this->goHome();
            } else {
                Yii::$app->session->setFlash('error', 'Sorry, we are unable to reset password for email provided.');
            }
        }

        return $this->render('requestPasswordResetToken', [
            'model' => $model,
        ]);
    }

    /**
     * Resets password.
     *
     * @param string $token
     * @return mixed
     * @throws BadRequestHttpException
     */
    public function actionResetPassword($token)
    {
        try {
            $model = new ResetPasswordForm($token);
        } catch (InvalidParamException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if (!empty(Yii::$app->request->post())) {
            $value = Yii::$app->request->post();
            $username = $value['ResetPasswordForm']['username'];
            Yii::$app->session->set('username', $username);
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->resetPassword()) {
            Yii::$app->session->setFlash('success', 'New password was saved.');
            return $this->goHome();
        }

        return $this->render('resetPassword', [
            'model' => $model,
        ]);
    }
}
