<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "cd_aguas".
 *
 * @property integer $cd_aguas_pk
 * @property string $cod_apto
 * @property integer $cod_conjunto
 * @property integer $cod_edificio
 * @property string $lect_ant
 * @property string $lect_post
 *
 * @property CdAptos $codApto
 * @property CdConjuntos $codConjunto
 * @property CdEdificios $codEdificio
 */
class CdAguas extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cd_aguas';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cod_apto', 'cod_conjunto', 'cod_edificio', 'lect_ant', 'lect_post'], 'required'],
            [['cod_conjunto', 'cod_edificio'], 'integer'],
            [['lect_ant', 'lect_post'], 'number'],
            [['cod_apto'], 'string', 'max' => 3],
            [['cod_apto'], 'exist', 'skipOnError' => true, 'targetClass' => CdAptos::className(), 'targetAttribute' => ['cod_apto' => 'cd_aptos_pk']],
            [['cod_conjunto'], 'exist', 'skipOnError' => true, 'targetClass' => CdConjuntos::className(), 'targetAttribute' => ['cod_conjunto' => 'cd_conjuntos_pk']],
            [['cod_edificio'], 'exist', 'skipOnError' => true, 'targetClass' => CdEdificios::className(), 'targetAttribute' => ['cod_edificio' => 'cd_edificios_pk']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cd_aguas_pk' => 'Cd Aguas Pk',
            'cod_apto' => 'Cod Apto',
            'cod_conjunto' => 'Cod Conjunto',
            'cod_edificio' => 'Cod Edificio',
            'lect_ant' => 'Lect Ant',
            'lect_post' => 'Lect Post',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodApto()
    {
        return $this->hasOne(CdAptos::className(), ['cd_aptos_pk' => 'cod_apto']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodConjunto()
    {
        return $this->hasOne(CdConjuntos::className(), ['cd_conjuntos_pk' => 'cod_conjunto']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodEdificio()
    {
        return $this->hasOne(CdEdificios::className(), ['cd_edificios_pk' => 'cod_edificio']);
    }
}
