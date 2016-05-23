<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "cd_aptos".
 *
 * @property string $cd_aptos_pk
 * @property integer $cod_propietario
 *
 * @property CdAguas[] $cdAguas
 * @property CdPropietarios $codPropietario
 * @property CdDeudas[] $cdDeudas
 * @property CdHistoricos[] $cdHistoricos
 * @property CdMovMes[] $cdMovMes
 */
class CdAptos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cd_aptos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cd_aptos_pk', 'cod_propietario'], 'required'],
            [['cod_propietario'], 'integer'],
            [['cd_aptos_pk'], 'string', 'max' => 3],
            [['cod_propietario'], 'exist', 'skipOnError' => true, 'targetClass' => CdPropietarios::className(), 'targetAttribute' => ['cod_propietario' => 'cd_propietarios_pk']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cd_aptos_pk' => 'Cd Aptos Pk',
            'cod_propietario' => 'Cod Propietario',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdAguas()
    {
        return $this->hasMany(CdAguas::className(), ['cod_apto' => 'cd_aptos_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodPropietario()
    {
        return $this->hasOne(CdPropietarios::className(), ['cd_propietarios_pk' => 'cod_propietario']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdDeudas()
    {
        return $this->hasMany(CdDeudas::className(), ['cod_apto' => 'cd_aptos_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdHistoricos()
    {
        return $this->hasMany(CdHistoricos::className(), ['cod_apto' => 'cd_aptos_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdMovMes()
    {
        return $this->hasMany(CdMovMes::className(), ['cod_apto' => 'cd_aptos_pk']);
    }
}
