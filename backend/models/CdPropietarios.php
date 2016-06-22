<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "cd_propietarios".
 *
 * @property integer $cd_propietarios_pk
 * @property integer $cod_conjunto
 * @property integer $cod_edificio
 * @property integer $nro_piso
 * @property string $nombre
 * @property string $apellido
 * @property string $telf_local
 * @property string $telf_celular
 * @property string $fax
 * @property string $alicuota
 * @property string $quien_vive
 * @property string $direccion
 * @property string $direccion_cobro
 *
 * @property CdAptos[] $cdAptos
 * @property CdConjuntos $codConjunto
 * @property CdEdificios $codEdificio
 */
class CdPropietarios extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cd_propietarios';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cod_conjunto', 'cod_edificio', 'nro_piso', 'nombre', 'apellido', 'fax', 'alicuota', 'direccion', 'direccion_cobro'], 'required'],
            [['cod_conjunto', 'cod_edificio', 'nro_piso'], 'integer'],
            [['telf_local', 'telf_celular', 'alicuota'], 'number'],
            [['nombre', 'apellido'], 'string', 'max' => 30],
            [['fax'], 'string', 'max' => 15],
            [['quien_vive'], 'string', 'max' => 1],
            [['direccion', 'direccion_cobro'], 'string', 'max' => 150],
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
            'cd_propietarios_pk' => 'Cd Propietarios Pk',
            'cod_conjunto' => 'Cod Conjunto',
            'cod_edificio' => 'Cod Edificio',
            'nro_piso' => 'Nro Piso',
            'nombre' => 'Nombre',
            'apellido' => 'Apellido',
            'telf_local' => 'Telf Local',
            'telf_celular' => 'Telf Celular',
            'fax' => 'Fax',
            'alicuota' => 'Alicuota',
            'quien_vive' => 'Quien Vive',
            'direccion' => 'Direccion',
            'direccion_cobro' => 'Direccion Cobro',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdAptos()
    {
        return $this->hasMany(CdAptos::className(), ['cod_propietario' => 'cd_propietarios_pk']);
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
