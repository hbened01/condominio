<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "fondos".
 *
 * @property integer $cd_fondo_pk
 * @property integer $cod_factura_fk
 * @property string $descripcion
 * @property string $saldo_anterior
 * @property string $cota_mes
 * @property string $cargo
 * @property string $saldo_actual
 *
 * @property Facturas $codFacturaFk
 */
class Fondos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'fondos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cod_factura_fk', 'descripcion'], 'required'],
            [['cod_factura_fk'], 'integer'],
            [['saldo_anterior', 'cota_mes', 'cargo', 'saldo_actual'], 'number'],
            [['descripcion'], 'string', 'max' => 250],
            [['cod_factura_fk'], 'exist', 'skipOnError' => true, 'targetClass' => Facturas::className(), 'targetAttribute' => ['cod_factura_fk' => 'cd_factura_pk']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cd_fondo_pk' => Yii::t('frontend', 'Id'),
            'cod_factura_fk' => Yii::t('frontend', 'Code Invoice'),
            'descripcion' => Yii::t('frontend', 'Description'),
            'saldo_anterior' => Yii::t('frontend', 'Previous Balance'),
            'cota_mes' => Yii::t('frontend', 'Cota Month'),
            'cargo' => Yii::t('frontend', 'Carry'),
            'saldo_actual' => Yii::t('frontend', 'Current Balance'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodFacturaFk()
    {
        return $this->hasOne(Facturas::className(), ['cd_factura_pk' => 'cod_factura_fk']);
    }
}
