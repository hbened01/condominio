<?php

namespace frontend\controllers;

use Yii;
use frontend\models\Facturas;
use frontend\models\FacturasSearch;
use frontend\models\CdPropietarios;
use backend\models\Mensajes;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use kartik\mpdf\Pdf;

/**
 * FacturasController implements the CRUD actions for Facturas model.
 */
class FacturasController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Facturas models.
     * @return mixed
     */
    public function actionIndex()
    {
        $user = new CdPropietarios();
        $update_usr = $user->getStatus(Yii::$app->user->identity->username);
        if ($update_usr) {
            Yii::$app->session->setFlash('warning', 'Antes de ejecutar cualquier otra opción por favor registre sus datos en el formulario.');
            return $this->redirect('cd-propietarios/update');
        }
        $searchModel = new FacturasSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Facturas model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
            'msn' => Mensajes::find()->where(['msn_default' => true])->one()
        ]);
    }

    /**
     * Finds the Facturas model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Facturas the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function findModel($id)
    {
       if (($model = Facturas::find()->where(['cd_factura_pk' => $id])->joinWith(['fondos','gastosNocomunes','gastosComunes'])->one()) !== null) {
           return $model;
       } else {
           throw new NotFoundHttpException('The requested page does not exist.');
       }
   }

       /**
     * PDF Facturas.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionFacturaPdf($id)
    {

       $content = $this->renderPartial('factura-pdf', [
            'model' => $this->findModel($id),
            'msn' => Mensajes::find()->where(['msn_default' => true])->one()
       ]);

       // setup kartik\mpdf\Pdf component
       $pdf = new Pdf([
           // set to use core fonts only
           'mode' => Pdf::MODE_CORE, 
           // A4 paper format
           'format' => Pdf::FORMAT_A4, 
           // portrait orientation
           'orientation' => Pdf::ORIENT_PORTRAIT, 
           // stream to browser inline
           'destination' => Pdf::DEST_BROWSER, 
           // your html content input
           'content' => $content,  
           // format content from your own css file if needed or use the
           // enhanced bootstrap css built by Krajee for mPDF formatting 
           'cssFile' => '@vendor/kartik-v/yii2-mpdf/assets/kv-mpdf-bootstrap.min.css',
           // any css to be embedded if required
           'cssInline' => '.kv-heading-1{font-size:10px}', 
            // set mPDF properties on the fly
           'options' => ['title' => 'Factura de Condominio', 'subject' => 'Administración y Gestión'],
            // call mPDF methods on the fly
           'methods' => [ 
               'SetHeader'=>['Factura de Condominio'], 
               'SetFooter'=>['{PAGENO}'],
           ]
       ]);

       $model = $this->findModel($id);
       if (($model->estatus_factura && $model->total_deducible != 0) || (!$model->estatus_factura)) {
          $mpdf = $pdf->api; 
          $mpdf->SetWatermarkText('COPIA DE FACTURA');
          $mpdf->showWatermarkText = true;
          $mpdf->watermarkTextAlpha = 0.1;
       }

       // return the pdf output as per the destination setting
       return $pdf->render(); 
       
    }
}
