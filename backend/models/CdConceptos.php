<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "cd_conceptos".
 *
 * @property integer $cd_conceptos_pk
 * @property string $descrip_concepto
 * @property string $tipo
 * @property integer $frecuencia
 *
 * @property CdMovChequeras[] $cdMovChequeras
 * @property CdMovMes[] $cdMovMes
 */
class CdConceptos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cd_conceptos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['descrip_concepto', 'tipo', 'frecuencia'], 'required'],
            [['frecuencia'], 'integer'],
            [['descrip_concepto'], 'string', 'max' => 50],
            [['tipo'], 'string', 'max' => 1],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cd_conceptos_pk' => 'Cd Conceptos Pk',
            'descrip_concepto' => 'Descrip Concepto',
            'tipo' => 'Tipo',
            'frecuencia' => 'Frecuencia',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdMovChequeras()
    {
        return $this->hasMany(CdMovChequeras::className(), ['cod_concepto' => 'cd_conceptos_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdMovMes()
    {
        return $this->hasMany(CdMovMes::className(), ['cod_concepto' => 'cd_conceptos_pk']);
    }
}
