<?php

namespace backend\models;

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
            [['cod_conjunto','email_edificio','nombre_edificio'], 'required'],
            [['cod_conjunto'], 'integer'],
            [['telf_concerje', 'porcentaje_nro1', 'porcentaje_nro2', 'agua', 'fondo_nro1', 'fondo_nro2', 'fondo_nro3', 'fondo_nro4', 'fondo_nro5', 'fondo_nro6', 'fondo_nro7', 'fondo_nro8'], 'number'],
            [['nombre_edificio', 'nombre_concerje'], 'string', 'max' => 100],
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
            'cd_edificios_pk' => 'Código Edificio',
            'cod_conjunto' => 'Cod Conjunto',
            'nombre_edificio' => 'Nombre Edificio',
            'nombre_concerje' => 'Nombre Concerje',
            'telf_concerje' => 'Telf Concerje',
            'porcentaje_nro1' => 'Porcentaje Nro1',
            'email_edificio' => 'Email Edificio',
            'porcentaje_nro2' => 'Porcentaje Nro2',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodConjunto()
    {
        return $this->hasOne(CdConjuntos::className(), ['cd_conjuntos_pk' => 'cod_conjunto']);
    }

    public function conjunto($id)
    {
        $model = CdConjuntos::find()->where(['cd_conjuntos_pk' => $id])->one();
        return $model?$model->nombre.' - '.$model->direccion:'';
    }
}
