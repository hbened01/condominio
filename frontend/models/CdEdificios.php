<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "cd_edificios".
 *
 * @property integer $cd_edificios_pk
 * @property integer $cod_conjunto
 * @property string $nombre_edificio
 * @property string $nombre_concerje
 * @property string $telf_concerje
 * @property string $porcentaje_nro1
 * @property string $email_edificio
 * @property string $porcentaje_nro2
 * @property string $agua
 * @property string $fondo_nro1
 * @property string $fondo_nro2
 * @property string $fondo_nro3
 * @property string $fondo_nro4
 * @property string $fondo_nro5
 * @property string $fondo_nro6
 * @property string $fondo_nro7
 * @property string $fondo_nro8
 *
 * @property CdConjuntos $codConjunto
 */
class CdEdificios extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cd_edificios';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cod_conjunto'], 'required'],
            [['cod_conjunto'], 'integer'],
            [['telf_concerje', 'porcentaje_nro1', 'porcentaje_nro2', 'agua', 'fondo_nro1', 'fondo_nro2', 'fondo_nro3', 'fondo_nro4', 'fondo_nro5', 'fondo_nro6', 'fondo_nro7', 'fondo_nro8'], 'number'],
            [['nombre_edificio'], 'string', 'max' => 20],
            [['nombre_concerje'], 'string', 'max' => 30],
            [['email_edificio'], 'string', 'max' => 256],
            [['cod_conjunto'], 'exist', 'skipOnError' => true, 'targetClass' => CdConjuntos::className(), 'targetAttribute' => ['cod_conjunto' => 'cd_conjuntos_pk']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cd_edificios_pk' => Yii::t('frontend', 'Cd Edificios Pk'),
            'cod_conjunto' => Yii::t('frontend', 'Cod Conjunto'),
            'nombre_edificio' => Yii::t('frontend', 'Nombre Edificio'),
            'nombre_concerje' => Yii::t('frontend', 'Nombre Concerje'),
            'telf_concerje' => Yii::t('frontend', 'Telf Concerje'),
            'porcentaje_nro1' => Yii::t('frontend', 'Porcentaje Nro1'),
            'email_edificio' => Yii::t('frontend', 'Email Edificio'),
            'porcentaje_nro2' => Yii::t('frontend', 'Porcentaje Nro2'),
            'agua' => Yii::t('frontend', 'Agua'),
            'fondo_nro1' => Yii::t('frontend', 'Fondo Nro1'),
            'fondo_nro2' => Yii::t('frontend', 'Fondo Nro2'),
            'fondo_nro3' => Yii::t('frontend', 'Fondo Nro3'),
            'fondo_nro4' => Yii::t('frontend', 'Fondo Nro4'),
            'fondo_nro5' => Yii::t('frontend', 'Fondo Nro5'),
            'fondo_nro6' => Yii::t('frontend', 'Fondo Nro6'),
            'fondo_nro7' => Yii::t('frontend', 'Fondo Nro7'),
            'fondo_nro8' => Yii::t('frontend', 'Fondo Nro8'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodConjunto()
    {
        return $this->hasOne(CdConjuntos::className(), ['cd_conjuntos_pk' => 'cod_conjunto']);
    }
}