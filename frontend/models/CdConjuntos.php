<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "cd_conjuntos".
 *
 * @property integer $cd_conjuntos_pk
 * @property string $nombre
 * @property string $direccion
 *
 * @property CdAguas[] $cdAguas
 * @property CdChequeras[] $cdChequeras
 * @property CdDeudas[] $cdDeudas
 * @property CdEdificios[] $cdEdificios
 * @property CdFondos[] $cdFondos
 * @property CdHistoricos[] $cdHistoricos
 * @property CdMovMes[] $cdMovMes
 */
class CdConjuntos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cd_conjuntos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nombre', 'direccion'], 'required'],
            [['nombre'], 'string', 'max' => 50],
            [['direccion'], 'string', 'max' => 150],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cd_conjuntos_pk' => Yii::t('app', 'Cd Conjuntos Pk'),
            'nombre' => Yii::t('app', 'Nombre'),
            'direccion' => Yii::t('app', 'Direccion'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdAguas()
    {
        return $this->hasMany(CdAguas::className(), ['cod_conjunto' => 'cd_conjuntos_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdChequeras()
    {
        return $this->hasMany(CdChequeras::className(), ['cod_conjunto' => 'cd_conjuntos_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdDeudas()
    {
        return $this->hasMany(CdDeudas::className(), ['cod_conjunto' => 'cd_conjuntos_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdEdificios()
    {
        return $this->hasMany(CdEdificios::className(), ['cod_conjunto' => 'cd_conjuntos_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdFondos()
    {
        return $this->hasMany(CdFondos::className(), ['cod_conjunto' => 'cd_conjuntos_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdHistoricos()
    {
        return $this->hasMany(CdHistoricos::className(), ['cod_conjunto' => 'cd_conjuntos_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdMovMes()
    {
        return $this->hasMany(CdMovMes::className(), ['cod_conjunto' => 'cd_conjuntos_pk']);
    }
}
