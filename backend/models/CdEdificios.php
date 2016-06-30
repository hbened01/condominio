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
 * @property CdAguas[] $cdAguas
 * @property CdChequeras[] $cdChequeras
 * @property CdDeudas[] $cdDeudas
 * @property CdConjuntos $codConjunto
 * @property CdFondos[] $cdFondos
 * @property CdHistoricos[] $cdHistoricos
 * @property CdMovMes[] $cdMovMes
 * @property CdPropietarios[] $cdPropietarios
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
            [['cod_conjunto', 'nombre_edificio', 'nombre_concerje', 'porcentaje_nro1', 'porcentaje_nro2', 'agua', 'fondo_nro3', 'fondo_nro7', 'fondo_nro8'], 'required'],
            [['cod_conjunto'], 'integer'],
            [['telf_concerje', 'porcentaje_nro1', 'porcentaje_nro2', 'agua', 'fondo_nro1', 'fondo_nro2', 'fondo_nro3', 'fondo_nro4', 'fondo_nro5', 'fondo_nro6', 'fondo_nro7', 'fondo_nro8'], 'number'],
            [['nombre_edificio'], 'string', 'max' => 20],
            [['nombre_concerje'], 'string', 'max' => 30],
            [['cod_conjunto'], 'exist', 'skipOnError' => true, 'targetClass' => CdConjuntos::className(), 'targetAttribute' => ['cod_conjunto' => 'cd_conjuntos_pk']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cd_edificios_pk' => 'Cd Edificios Pk',
            'cod_conjunto' => 'Cod Conjunto',
            'nombre_edificio' => 'Nombre Edificio',
            'nombre_concerje' => 'Nombre Concerje',
            'telf_concerje' => 'Telf Concerje',
            'porcentaje_nro1' => 'Porcentaje Nro1',
            'porcentaje_nro2' => 'Porcentaje Nro2',
            'agua' => 'Agua',
            'fondo_nro1' => 'Fondo Nro1',
            'fondo_nro2' => 'Fondo Nro2',
            'fondo_nro3' => 'Fondo Nro3',
            'fondo_nro4' => 'Fondo Nro4',
            'fondo_nro5' => 'Fondo Nro5',
            'fondo_nro6' => 'Fondo Nro6',
            'fondo_nro7' => 'Fondo Nro7',
            'fondo_nro8' => 'Fondo Nro8',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdAguas()
    {
        return $this->hasMany(CdAguas::className(), ['cod_edificio' => 'cd_edificios_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdChequeras()
    {
        return $this->hasMany(CdChequeras::className(), ['cod_edificio' => 'cd_edificios_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdDeudas()
    {
        return $this->hasMany(CdDeudas::className(), ['cod_edificio' => 'cd_edificios_pk']);
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
    public function getCdFondos()
    {
        return $this->hasMany(CdFondos::className(), ['cod_edificio' => 'cd_edificios_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdHistoricos()
    {
        return $this->hasMany(CdHistoricos::className(), ['cod_edificio' => 'cd_edificios_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdMovMes()
    {
        return $this->hasMany(CdMovMes::className(), ['cod_edificio' => 'cd_edificios_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdPropietarios()
    {
        return $this->hasMany(CdPropietarios::className(), ['cod_edificio' => 'cd_edificios_pk']);
    }
}
